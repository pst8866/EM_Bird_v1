/*
 *
 *  Created on: Aug 29, 2018
 *      Author: pagrawal
 */
/* ========================================================================== */
/*                            INCLUDE FILES                                   */
/* ========================================================================== */
#include <xdc/std.h>
//#include <ti/sysbios/io/IOM.h>
#include <xdc/runtime/Memory.h>
#include <ti/sysbios/heaps/HeapMem.h>
#include <xdc/runtime/IHeap.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Log.h>
#include <xdc/runtime/System.h>
#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Semaphore.h>
#include <mcasp_drv.h>
#include <ti/csl/csl_chip.h>
#include <ti/sdo/edma3/drv/edma3_drv.h>
#include <ti/sdo/edma3/rm/edma3_rm.h>
#include <ti/sdo/edma3/drv/sample/bios6_edma3_drv_sample.h>
#include "mcasp_osal.h"
#include "ICodec.h"
#include "mcasp_cfg.h"
#include "MCASP_log.h"
#include "stdio.h"
#include "string.h"

#include <ti/csl/cslr_mcasp.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/hal/Cache.h>

#include "IOM.h"
#include "Aic31.h"
#include "aic31_if.h"
#include "ethernet.h"
ICodec_ChannelConfig AIC31_con8000 =
{
        16000,  /* sampling rate for codec */
        100,  /* gain (%) for codec      */
        0x00,//8000, 11025, 16000, 22050, 24000, 32000, 44100,
            //48000 or  96000. \n bitclockfreq 0x1F400
        0x00
};

/* ========================================================================== */
/*                          IMPORTED VARIABLES                                */
/* ========================================================================== */
extern EDMA3_DRV_Handle hEdma;
extern HeapMem_Handle myHeap;

/*
 * Buffers placed in external memory are aligned on a 128 bytes boundary.
 * In addition, the buffer should be of a size multiple of 128 bytes for
 * the cache work optimally on the C6x.
 */
#define BUFLEN          (1024) //Number of samples in serializer frame
#define BUFALIGN        (128) //Alignment of buffer for use of L2 Cache
/* This is the number of buffers used by the application to be issued and reclaimed
   This number can be higher than 2 (Ping pong) also. The McASP driver puts them in
   a queue internally and process them in order and give back to the application */
//#define NUM_BUFS         (2)
Ptr hAicDev;    //pointer to Aic31 driver object aic31mdcreatechan(2ndarg)
Ptr hAicChannel;//pointer to Aic31 driver channel handle aicmdcreatechan(1starg)

/* Function prototype */
static Void createStreams();    //contains aicCreateMdchan
static Void prime();    //Allocates Memory calloc for the SIO buffer xchange

//Ptr rxbuf[NUM_BUFS];
//Ptr txbuf[NUM_BUFS];
Ptr mybuf[NUM_BUFS];


/*McASP Device handles */
Ptr hMcaspDev;
/*McASP device Parameters*/
Mcasp_Params mcaspParams; //Struct to enable Cache

Ptr hMcaspTxChan; // Channel Handle for the mcaspCrateChan();
Ptr hMcaspRxChan; // Object for the mcaspCreatechan();

int rxFrameIndex = (NUM_BUFS-1), txFrameIndex = (NUM_BUFS-1);  //Index count 0 and 1 since NUM_BUFS=2
volatile int RxFlag=0, TxFlag=0;
//Semaphore_Handle semR, semT; //Handle for Rx and Tx Semaphore
//Semaphore_Params params;
int mcaspApiTest = FALSE;  // Variable to test mcasp at runtime

Error_Block eb;  //Still no idea about its use

int mcaspControlChanTest(void * mcaspChan); //This function tests the mcaspControlChan API.

/**************************************************************************************/
/*   FUNCTION DESCRIPTION: This utility function converts local GEM L2 address in to global
    memory addresses used by the EDMA inside McASP
 */
/**************************************************************************************/
static uint32_t getGlobalAddr (uint32_t addr)
{
    if ((addr >= 0x800000) && (addr < 0x1000000))
    {
#ifdef _TMS320C6X
        uint32_t coreNum;

        /* Get the core number. */
        coreNum = CSL_chipReadReg(CSL_CHIP_DNUM);

#if defined(SOC_AM572x) || defined(SOC_AM571x)
        /* Compute the global address. */
        return ((1 << 30) | (coreNum << 24) | (addr & 0x00ffffff));

#else
        /* Compute the global address. */
        return ((1 << 28) | (coreNum << 24) | (addr & 0x00ffffff));
#endif
#else
        return addr;
#endif
    }
    else
    {
        /* non-L2 address range */
        return addr;
    }
}
/*********************** APPLICATION DEFINED FUNCTIONS: Begin ****************************/
/* The below functions need to be defined by the application and are registered to the
   McASP driver during instantiation
 */
/*
 * This call back function is provided to the McASP driver during mcaspCreateChan()
 * and is called at the end of a transaction. This example uses the same call back function
 * for both TX and RX transfers and the call back argument is not being used in this
 * application and hence we pass NULL during mcaspCreateChan() as the call back argument.
 * This need not be the case for other applications where they could use a seperate
 * call back function for TX and RX. Also they could provide a non-NULL argument as
 * the call back argument and use it in their implementation of the call back function(s).
 */
//callback function

/*
 * This call back is used during interrupt processing and is defined by the
 * application for error handling. These functions are called back from within the
 * mcasp driver when an error interrupt happens and macspIsr() is being called.
 * The sample error handling functions just records these errors which
 * are later used for analyzing the errors seen.
 */
/* The below variables are used to quit the frame processing loop if an error occurs */
int gblErrFlagXmt=0;
int gblErrFlagRcv=0;
/* The below variables are used to analyze the errors if an error interrupt happens */
Mcasp_errCbStatus errCbStatusXmt;
Mcasp_errCbStatus errCbStatusRcv;

/* Error handler for Transmit side */
void GblErrXmt(Mcasp_errCbStatus errCbStat)
{
    gblErrFlagXmt=1;
    errCbStatusXmt=errCbStat;
}
/* Error handler for Rcv side */
void GblErrRcv(Mcasp_errCbStatus errCbStat)
{
    gblErrFlagRcv=1;
    errCbStatusRcv=errCbStat;
}

void mcaspAppCallback(void* arg, MCASP_Packet *ioBuf)
// MCASP_Packet is Mcasp frame object Params struct type
{
    if(ioBuf-> cmd == MCASP_READ) //if parameter is set to read
    {
        RxFlag++;       //Increaments the Rx Flag
        rxFrameIndex=((rxFrameIndex+1) %NUM_BUFS);
        Semaphore_post(semR);/*post semaphore */
    }
    if (ioBuf-> cmd == MCASP_WRITE)
    {
        txFrameIndex= ((txFrameIndex+1)%NUM_BUFS);
        TxFlag++;       //Increaments the Tx Flag
        Semaphore_post(semT);
    }
}

static Void createStreams()
{
    int status;
    int mode = IOM_INPUT;//Input mode set
    char remName[10] = "aic";  //AIC channel name

    status = aic31MdCreateChan(&hAicChannel, hAicDev, remName,mode,
                               (Ptr)(&AIC31_con8000),(IOM_TiomCallback)&mcaspAppCallback, NULL); //mcaspcallback argument is NULL

    mcasp_chanparam[0].edmaHandle = hEdma;  //mcasp_chanparam is a struct contains Mcaspchan parameters
    //above is the mcasp channel params for the input channel
    mcasp_chanparam[1].edmaHandle = hEdma; //mcasp output chan params


    /* Creating a mcasp channel fir the TX*/
    status = mcaspCreateChan(&hMcaspTxChan, hMcaspDev, MCASP_OUTPUT,
                             &mcasp_chanparam[1], mcaspAppCallback, NULL );
    /*Creating a mcasp channel fior RX*/
    status = mcaspCreateChan(&hMcaspRxChan, hMcaspDev, MCASP_INPUT,
                             &mcasp_chanparam[0], mcaspAppCallback, NULL);
}



#include <ti/sysbios/family/c64p/Hwi.h>
Hwi_Handle myHwi;

static Void prime()
{
    Error_Block eb;
    int32_t count = 0, status;
    IHeap_Handle iheap;
    uint32_t tx_bytes_per_sample = (mcasp_chanparam[1].wordWidth/8); //bydefault its 32 and 32/4 is 4
    uint32_t rx_bytes_per_sample = (mcasp_chanparam[0].wordWidth/8); // samw wordwidth parameters for input and output channel parameters

    uint32_t tx_frame_size = BUFLEN*TX_NUM_SERIALIZER*tx_bytes_per_sample;     // BUFFLEN=1024,SERIALZER=1, bytes per sample = 4; framesize is 4096
    uint32_t rx_frame_size = BUFLEN*RX_NUM_SERIALIZER*rx_bytes_per_sample;      //4096
    iheap = HeapMem_Handle_to_xdc_runtime_IHeap(myHeap);
    Error_init(&eb);

    for (count = 0; count<(NUM_BUFS);count++)   //runs twice
    {
        rxbuf[count] = Memory_calloc(iheap, rx_frame_size, BUFALIGN,&eb);  //memmory allocation in the heap
    }
    for(count=0; count<(NUM_BUFS); count++)
    {
        txbuf[count] = Memory_calloc(iheap,tx_frame_size, BUFALIGN, &eb);
    }

    for(count = 0;count <(NUM_BUFS);count++)
    {
        //Issue of the bUUffer to tzhe input stream
        memset((uint8_t*)rxbuf[count], (0xA0+count),rx_frame_size);   //160(A0)+count
        //RX Frame processing
        rxFrame[count].cmd = MCASP_READ;
        rxFrame[count].addr = (void*)(getGlobalAddr((uint32_t)rxbuf[count]));
        rxFrame[count].size = rx_frame_size;
        rxFrame[count].arg = (uint32_t) hMcaspRxChan;
        rxFrame[count].status = 0;
        rxFrame[count].misc = 1;   /* reserved - used in callback to indicate asynch packet */


        /* Submit McASP packet for Rx */
        status = mcaspSubmitChan(hMcaspRxChan, &(rxFrame[count]));
    }

    for(count = 0; count < (NUM_BUFS); count ++)
    {

        memset((uint8_t *)txbuf[count], (0xA0+count), tx_frame_size);
        /* TX frame processing */
        txFrame[count].cmd = MCASP_WRITE;
        txFrame[count].addr = (void*)(getGlobalAddr((uint32_t)txbuf[count]));
        txFrame[count].size = tx_frame_size;
        txFrame[count].arg = (uint32_t) hMcaspTxChan;
        txFrame[count].status = 0;
        txFrame[count].misc = 1;   /* reserved - used in callback to indicate asynch packet */
        /* Submit McASP packet for Tx */
        status = mcaspSubmitChan(hMcaspTxChan, &(txFrame[count]));
    }
}

extern EDMA3_DRV_GblConfigParams sampleEdma3GblCfgParams[];
/* EnableEDMA event in the SampleCfg*/
static void enableEDMAHwEvent(uint32_t edmaNum, uint32_t eventNo)
{
    sampleEdma3GblCfgParams[edmaNum].dmaChannelHwEvtMap[eventNo/32] |= (1 << (eventNo%32));          // Ask Rintu
}

extern Int aic31MdBindDev(Ptr *, Int, Ptr);
int gtxFrameIndexCount=0;
int grxFrameIndexCount=0;
int itemp;
int result, pwr_status, fs_status, bck_status;
int total_frames_sent=0;


/*************************Audio Echo Task************************/
/******Signal Processing Algorithm will be here*******************/

Void Audio_echo_Task()
{
    volatile int32_t i32Count, status = 0;
    hMcaspDev  = NULL;
    uint32_t tx_bytes_per_sample=(mcasp_chanparam[1].wordWidth/8); // 4 byte samples
    uint32_t rx_bytes_per_sample=(mcasp_chanparam[0].wordWidth/8); // changed both wordth width to 32
    /* This represents the actual  number of bytes being transferred by the
     * DMA to/from the Host memory to the McASP peripheral. This include all serializers and timeslots.
     * BUFLEN contains the samples per serializer (inclusive of its timeslots) */
    uint32_t tx_frame_size = BUFLEN*TX_NUM_SERIALIZER*tx_bytes_per_sample; //1024*1*4 =4096
    uint32_t rx_frame_size = BUFLEN*RX_NUM_SERIALIZER*rx_bytes_per_sample;


    /* 1. EDMA Initializations */
    EDMA3_DRV_Result edmaResult = 0;

    enableEDMAHwEvent(EDMACC_NUM,MCASP_RX_DMA_CH);
    enableEDMAHwEvent(EDMACC_NUM,MCASP_TX_DMA_CH);

    hEdma = edma3init(EDMACC_NUM, &edmaResult);     //Edmma Initialization

    /* 2. SEM Initializations */
       Semaphore_Params_init(&params);

       /* Create semaphores to wait for buffer reclaiming */
       semR = Semaphore_create(1, &params, &eb);  //changed from 0
       semT = Semaphore_create(0, &params, &eb);

       /* 3. McASP Initializations */
       /* Initialize McASP Tx and Rx parameters */

       mcaspParams = Mcasp_PARAMS;
       status = mcaspBindDev(&hMcaspDev, MCASP_NUM, &mcaspParams); // mcasp Bind
       aic31MdBindDev(&hAicDev, 0, (Ptr)&Aic31_PARAMS);     //AIC code bind

       /* Call createStream function to create I/O streams                       */
          createStreams();
          prime();



          /* Forever loop to continuously receive and transmit audio data           */
          for (i32Count = 0; i32Count >= 0; i32Count++)
          {



              Semaphore_pend(semR, BIOS_WAIT_FOREVER);
              Semaphore_pend(semT, BIOS_WAIT_FOREVER);


              /* Reclaim full buffer from the input stream                          */
              gtxFrameIndexCount=txFrameIndex;  //txframeindes = NUMBUFS-1 =1
              grxFrameIndexCount=rxFrameIndex;

              Cache_inv((void *)((uint8_t *)rxbuf[grxFrameIndexCount]),rx_frame_size,Cache_Type_ALL, TRUE); //rx nd tx frame size =4096
              /******************************* Sample Processing Begins ***************************/
              /* (BUFLEN* RX_NUM_SERIALIZER) 32-bit samples samples have been accumulated in rxbuf[grxFrameIndexCount] now.
                       Application specific processing on these samples, before sending it back to McASP via
                       txbuf[grxFrameIndexCount].
                       APPLICATION SPECIFIC PROCESSING could be done here. Below are the few audio demos and their
                       application specific processing shown below.
               */

              /* DEFAULT CASE: Copy the frame received and send it back to Tx buffer.
                       This way the audio received by McASP from the remote device, is loopbacked and sent back
                       to the device here.
               */
              //memset((uint8_t *)mybuf[gtxFrameIndexCount], (0x00), tx_frame_size);      //EDITED
              //memcpy((void *)((uint8_t *)txbuf[gtxFrameIndexCount]),(void *)((uint8_t *)mybuf[grxFrameIndexCount]),rx_frame_size);
              memcpy((void *)((uint8_t *)txbuf[gtxFrameIndexCount]),(void *)((uint8_t *)rxbuf[grxFrameIndexCount]),rx_frame_size);

              /******************************* Sample Processing End ***************************/
             // Cache_wbInv((void *)((uint8_t *)mybuf[gtxFrameIndexCount]),tx_frame_size,Cache_Type_ALL, FALSE);//EDITED
              Cache_wbInv((void *)((uint8_t *)txbuf[gtxFrameIndexCount]),tx_frame_size,Cache_Type_ALL, FALSE);

              /* Issue full buffer to the output stream                             */
              /* TX frame processing */
              txFrame[gtxFrameIndexCount].cmd = MCASP_WRITE;
              txFrame[gtxFrameIndexCount].addr = (void*)getGlobalAddr((uint32_t)txbuf[gtxFrameIndexCount]);
              txFrame[gtxFrameIndexCount].size = tx_frame_size;
              txFrame[gtxFrameIndexCount].arg = (uint32_t) hMcaspTxChan;
              txFrame[gtxFrameIndexCount].status = 0;
              txFrame[gtxFrameIndexCount].misc = 1;   /* reserved - used in callback to indicate asynch packet */

              status = mcaspSubmitChan(hMcaspTxChan, &(txFrame[gtxFrameIndexCount]));
                  buffdata = *(int32_t*)txFrame[gtxFrameIndexCount].addr;

              /* Issue an empty buffer to the input stream                          */
              rxFrame[grxFrameIndexCount].cmd = MCASP_READ;
              rxFrame[grxFrameIndexCount].addr = (void*)getGlobalAddr((uint32_t)rxbuf[grxFrameIndexCount]);
              rxFrame[grxFrameIndexCount].size = rx_frame_size;
              rxFrame[grxFrameIndexCount].arg = (uint32_t) hMcaspRxChan;
              rxFrame[grxFrameIndexCount].status = 0;
              rxFrame[grxFrameIndexCount].misc = 1;   /* reserved - used in callback to indicate asynch packet */

                           status = mcaspSubmitChan(hMcaspRxChan, &(rxFrame[grxFrameIndexCount]));
                           buffdata = *(int32_t*)rxFrame[gtxFrameIndexCount].addr;

          }
}
