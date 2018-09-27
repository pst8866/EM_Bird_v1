/*
 * udp_hello.c
 *
 *  Created on: Aug 1, 2018
 *      Author: pagrawal
 */


/*
 * udpHello.c
 *
 * This program implements a UDP echo server, which echos back any
 * input it receives.
 *
 * Copyright (C) 2007 Texas Instruments Incorporated - http://www.ti.com/
 *
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *    Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 *    Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the
 *    distribution.
 *
 *    Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */
#include <xdc/runtime/System.h>
#include <xdc/std.h>
#include <math.h>
#include <ti/ndk/inc/netmain.h>
#include "Aic31.h"
#include "ethernet.h"
#include <mcasp_drv.h>
#include <ti/sysbios/BIOS.h>
#define DELAY_VALUE       (590U)

#define radian 0.017453288888
void AppDelay(unsigned int delayVal);

//
// dtask_udp_hello() - UDP Echo Server Daemon Function
// (SOCK_DGRAM, port 7)
//
// Returns "1" if socket 's' is still open, and "0" if its been closed
//
int dtask_udp_hello( SOCKET s, UINT32 unused )
{
    struct sockaddr_in sin1;
    struct timeval     to;
    int                i,tmp;
    char               *pBuf;
    HANDLE             hBuffer;
    int                counter=0;


    struct sndData {
        Mcasp_QueueElem  data ;
    };
    struct sndData mydata;
    MCASP_Packet var1 ;
    //var1 = rxFrame.link;

  //  mydata.data = rxFrame.link;

    sin1.sin_family =AF_INET;
    sin1.sin_port =7;
    sin1.sin_addr.s_addr = 2852016755;//169.254.43.115
    //   System_printf("In Function\n");
    //      char VerSt[30] = "\Counting Stopped\n";
    char InvStr[30] = "\Invalid Command\n";
    //   char Terminate[30] = "\n";
    UINT32                j = 0;


    // Configure our socket timeout to be 3 seconds
    to.tv_sec  = 3;
    to.tv_usec = 0;
    setsockopt( s, SOL_SOCKET, SO_SNDTIMEO, &to, sizeof( to ) );
    setsockopt( s, SOL_SOCKET, SO_RCVTIMEO, &to, sizeof( to ) );

    //Cache_inv((void *)((uint8_t *)rxbuf[grxFrameIndexCount]),rx_frame_size,Cache_Type_ALL, TRUE);

    for(;;) {
        tmp = sizeof( sin1 );
        // i = (int)
        recvncfrom( s, (void **)&pBuf, 0, (PSA)&sin1, &tmp, &hBuffer );
        int len = strlen(pBuf);
        //           if (i>0)
        //           {
        if (len == 5)
        {
            if (pBuf[0] == 'S' && pBuf[1] == 'T' && pBuf[2] == 'A' && pBuf[3] == 'R'  && pBuf[4] == 'T')
            {
                while(j<100000)
                    //for(;;)
                {


                    Semaphore_pend(semR, BIOS_WAIT_FOREVER);
                    // memcpy((void *)((uint8_t *)ethbuf[gtxFrameIndexCount]),(void *)((uint8_t *)rxbuf[grxFrameIndexCount]),4096);
                   // memcpy((void *)mydata.data,(void *)rxFrame.link,sizeof(rxFrame.link));
                    //mydata = rxFrame.link;
                    sendto( s,(void**)&buffdata, sizeof(buffdata), 0, (PSA)&sin1, sizeof(sin1) );
                    //                       sendto( s,(void**)&rxFrame.link, sizeof(rxFrame.link), 0, (PSA)&sin1, sizeof(sin1) );
                    //                  sendto( s,(void**)(int32_t *)&rxbuf, sizeof(rxbuf), 0, (PSA)&sin1, sizeof(sin1) );
                    //  sendto( s,(void**)&test, sizeof(test), 0, (PSA)&sin1, sizeof(sin1) );
                    Semaphore_post(semR);
                    System_printf("exit taskFxn()\n");


                }
                recvncfree( hBuffer );

            }
        }

        else
        {
            while(j<10){
                sendto(s,InvStr,sizeof(InvStr),0,(PSA)&sin1,sizeof(sin1));
                //  System_printf("Packet Sent Containing Invalid Command\n");
                j++;
                break;
            }
            recvncfree(hBuffer);
        }


    }
    // Since the socket is still open, return "1"
    // (we need to leave UDP sockets open)
    return(1);
}

void AppDelay(unsigned int delayVal)
{
    while(delayVal)
    {
        delayVal--;
    }
}

