/*
 * Do not modify this file; it is automatically generated from the template
 * linkcmd.xdt in the ti.targets.elf package and will be overwritten.
 */

/*
 * put '"'s around paths because, without this, the linker
 * considers '-' as minus operator, not a file name character.
 */


-l"C:\Users\pagrawal\workspace_v8\EM_Bird_v1\Debug\configPkg\package\cfg\mcasp_ethernet_pe674.oe674"
-l"C:\ti\ndk_2_26_00_08\packages\ti\ndk\hal\timer_bios\lib\hal_timer_bios.ae674"
-l"C:\ti\ndk_2_26_00_08\packages\ti\ndk\os\lib\os.ae674"
-l"C:\ti\ndk_2_26_00_08\packages\ti\ndk\hal\userled_stub\lib\hal_userled_stub.ae674"
-l"C:\ti\ndk_2_26_00_08\packages\ti\ndk\hal\eth_stub\lib\hal_eth_stub.ae674"
-l"C:\ti\ndk_2_26_00_08\packages\ti\ndk\tools\cgi\lib\cgi.ae674"
-l"C:\ti\ndk_2_26_00_08\packages\ti\ndk\tools\hdlc\lib\hdlc.ae674"
-l"C:\ti\ndk_2_26_00_08\packages\ti\ndk\tools\console\lib\console_min.ae674"
-l"C:\ti\ndk_2_26_00_08\packages\ti\ndk\netctrl\lib\netctrl.ae674"
-l"C:\ti\ndk_2_26_00_08\packages\ti\ndk\nettools\lib\nettool.ae674"
-l"C:\ti\ndk_2_26_00_08\packages\ti\ndk\hal\ser_stub\lib\hal_ser_stub.ae674"
-l"C:\ti\ndk_2_26_00_08\packages\ti\ndk\tools\servers\lib\servers_min.ae674"
-l"C:\ti\ndk_2_26_00_08\packages\ti\ndk\stack\lib\stk6_ppp_pppoe.ae674"
-l"C:\ti\edma3_lld_2_12_05_30C\packages\ti\sdo\edma3\drv\sample\lib\omapl138-evm\674\release\edma3_lld_drv_sample.ae674"
-l"C:\Users\pagrawal\workspace_v8\EM_Bird_v1\src\sysbios\sysbios.ae674"
-l"C:\ti\pdk_omapl138_1_0_4\packages\ti\osal\lib\tirtos\omapl138\c674\release\ti.osal.ae674"
-l"C:\ti\pdk_omapl138_1_0_4\packages\ti\transport\ndk\nimu\lib\omapl138\c674\release\ti.transport.ndk.nimu.ae674"
-l"C:\ti\pdk_omapl138_1_0_4\packages\ti\drv\emac\lib\omapl138\c674\release\ti.drv.emac.ae674"
-l"C:\ti\pdk_omapl138_1_0_4\packages\ti\board\lib\lcdkOMAPL138\c674\release\ti.board.ae674"
-l"C:\ti\pdk_omapl138_1_0_4\packages\ti\drv\uart\lib\omapl138\c674\release\ti.drv.uart.ae674"
-l"C:\ti\pdk_omapl138_1_0_4\packages\ti\drv\i2c\lib\omapl138\c674\release\ti.drv.i2c.ae674"
-l"C:\ti\pdk_omapl138_1_0_4\packages\ti\drv\mcasp\lib\omapl138\c674\release\ti.drv.mcasp.ae674"
-l"C:\ti\pdk_omapl138_1_0_4\packages\ti\csl\lib\omapl138\c674\release\ti.csl.ae674"
-l"C:\ti\pdk_omapl138_1_0_4\packages\ti\csl\lib\omapl138\c674\release\ti.csl.intc.ae674"
-l"C:\ti\edma3_lld_2_12_05_30C\packages\ti\sdo\edma3\drv\lib\674\release\edma3_lld_drv.ae674"
-l"C:\ti\edma3_lld_2_12_05_30C\packages\ti\sdo\edma3\rm\lib\omapl138-evm\674\release\edma3_lld_rm.ae674"
-l"C:\ti\bios_6_52_00_12\packages\ti\targets\rts6000\lib\ti.targets.rts6000.ae674"
-l"C:\ti\bios_6_52_00_12\packages\ti\targets\rts6000\lib\boot.ae674"

--retain="*(xdc.meta)"


--args 0x0
-heap  0x0
-stack 0x20000

MEMORY
{
    IROM (RX) : org = 0x11700000, len = 0x100000
    IRAM (RWX) : org = 0x11800000, len = 0x40000
    L3_CBA_RAM (RWX) : org = 0x80000000, len = 0x20000
    DDR : org = 0xc3000000, len = 0x1000000
}

/*
 * Linker command file contributions from all loaded packages:
 */

/* Content from xdc.services.global (null): */

/* Content from xdc (null): */

/* Content from xdc.corevers (null): */

/* Content from xdc.shelf (null): */

/* Content from xdc.services.spec (null): */

/* Content from xdc.services.intern.xsr (null): */

/* Content from xdc.services.intern.gen (null): */

/* Content from xdc.services.intern.cmd (null): */

/* Content from xdc.bld (null): */

/* Content from ti.targets (null): */

/* Content from ti.targets.elf (null): */

/* Content from xdc.rov (null): */

/* Content from xdc.runtime (null): */

/* Content from ti.targets.rts6000 (null): */

/* Content from xdc.runtime.knl (null): */

/* Content from ti.sysbios.interfaces (null): */

/* Content from ti.sysbios.family (null): */

/* Content from xdc.services.getset (null): */

/* Content from ti.sdo.edma3.rm (null): */

/* Content from ti.sdo.edma3.drv (null): */

/* Content from ti.csl (null): */

/* Content from ti.drv.mcasp (null): */

/* Content from ti.drv.i2c (null): */

/* Content from ti.drv.uart (null): */

/* Content from ti.board (null): */

/* Content from ti.drv.emac (null): */

/* Content from ti.transport.ndk.nimu (null): */

/* Content from ti.ndk.rov (null): */

/* Content from ti.osal (null): */

/* Content from ti.sysbios.family.c62 (null): */

/* Content from ti.ndk (null): */

/* Content from ti.ndk.hal.timer_bios (null): */

/* Content from ti.ndk.os (null): */

/* Content from ti.ndk.hal.userled_stub (null): */

/* Content from ti.ndk.hal.eth_stub (null): */

/* Content from ti.ndk.tools.cgi (null): */

/* Content from ti.ndk.tools.hdlc (null): */

/* Content from ti.ndk.stack (null): */

/* Content from ti.ndk.tools.console (null): */

/* Content from ti.ndk.netctrl (null): */

/* Content from ti.ndk.nettools (null): */

/* Content from ti.ndk.hal.ser_stub (null): */

/* Content from ti.ndk.tools.servers (null): */

/* Content from ti.sysbios.family.c64p.primus (null): */

/* Content from ti.catalog.c6000 (null): */

/* Content from ti.catalog (null): */

/* Content from ti.catalog.peripherals.hdvicp2 (null): */

/* Content from xdc.platform (null): */

/* Content from xdc.cfg (null): */

/* Content from ti.catalog.arm.peripherals.timers (null): */

/* Content from ti.catalog.arm (null): */

/* Content from ti.platforms.evmOMAPL138 (null): */

/* Content from ti.sysbios.hal (null): */

/* Content from ti.sysbios.family.c64p (ti/sysbios/family/c64p/linkcmd.xdt): */
ti_sysbios_family_c64p_Cache_l1dSize = 32768;
ti_sysbios_family_c64p_Cache_l1pSize = 32768;
ti_sysbios_family_c64p_Cache_l2Size = 0;

/* Content from ti.sysbios.knl (null): */

/* Content from ti.sysbios.timers.timer64 (null): */

/* Content from ti.sysbios (null): */

/* Content from ti.sysbios.rts (ti/sysbios/rts/linkcmd.xdt): */

/* Content from ti.sysbios.rts.ti (ti/sysbios/rts/ti/linkcmd.xdt): */

/* Content from ti.sysbios.io (null): */

/* Content from ti.sdo.edma3.drv.sample (null): */

/* Content from ti.ndk.config (null): */

/* Content from ti.sysbios.gates (null): */

/* Content from ti.sysbios.heaps (null): */

/* Content from ti.sysbios.xdcruntime (null): */

/* Content from ti.sysbios.utils (null): */

/* Content from configPkg (null): */

/* Content from xdc.services.io (null): */


/*
 * symbolic aliases for static instance objects
 */
xdc_runtime_Startup__EXECFXN__C = 1;
xdc_runtime_Startup__RESETFXN__C = 1;

SECTIONS
{
    .text: load >> DDR
    .ti.decompress: load > DDR
    .stack: load > DDR
    GROUP: load > DDR
    {
        .bss:
        .neardata:
        .rodata:
    }
    .cinit: load > DDR
    .pinit: load >> DDR
    .init_array: load > DDR
    .const: load >> DDR
    .data: load >> DDR
    .fardata: load >> DDR
    .switch: load >> DDR
    .sysmem: load > DDR
    .far: load >> DDR
    .args: load > DDR align = 0x4, fill = 0 {_argsize = 0x0; }
    .cio: load >> DDR
    .ti.handler_table: load > DDR
    .c6xabi.exidx: load > DDR
    .c6xabi.extab: load >> DDR
    sharedL2: load > DDR
    systemHeap: load > DDR
    .cppi: load > DDR
    .qmss: load > DDR
    .code: load > DDR
    .vecs: load > DDR
    emacComm: load > DDR
    .far:taskStackSection: load > DDR
    .far:IMAGEDATA: load > DDR align = 0x8
    .far:NDK_OBJMEM: load > DDR align = 0x8
    .far:NDK_PACKETMEM: load > DDR align = 0x80
    app_heap: load > DDR
    xdc.meta: load > DDR, type = COPY

}
