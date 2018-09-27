/*
 * ethernet.h
 *
 *  Created on: Sep 11, 2018
 *      Author: pagrawal
 */
#include <ti/sysbios/knl/Semaphore.h>
#include <mcasp_drv.h>
#ifndef ETHERNET_H_
#define ETHERNET_H_

#define NUM_BUFS 2
MCASP_Packet rxFrame[NUM_BUFS]; //McASp Packet is a queue
MCASP_Packet txFrame[NUM_BUFS];
uint32_t buffdata;

extern int gtxFrameIndexCount;
extern int grxFrameIndexCount;
Ptr rxbuf[NUM_BUFS];
Ptr txbuf[NUM_BUFS];
Ptr ethbuf[NUM_BUFS];
Semaphore_Handle semR, semT; //Handle for Rx and Tx Semaphore
Semaphore_Params params;


#endif /* ETHERNET_H_ */
