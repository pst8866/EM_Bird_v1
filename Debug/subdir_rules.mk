################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
I2C_soc.obj: ../I2C_soc.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/ccsv8/tools/compiler/ti-cgt-c6000_8.2.3/bin/cl6x" -mv6740 --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/transport/ndk/nimu" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/board" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/example/lcdkOMAPL138/include" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/example/include" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/include" --include_path="C:/Users/pagrawal/workspace_v8/EM_Bird_v1" --include_path="C:/ti/ccsv8/tools/compiler/ti-cgt-c6000_8.2.3/include" --define=LCDK_OMAPL138 --define=SOC_OMAPL138 --define=AIC_CODEC --define=DSP_MODE --define=BUILD_OIMAPL138_DSP --define=c6748 -g --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="I2C_soc.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

aic31.obj: ../aic31.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/ccsv8/tools/compiler/ti-cgt-c6000_8.2.3/bin/cl6x" -mv6740 --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/transport/ndk/nimu" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/board" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/example/lcdkOMAPL138/include" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/example/include" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/include" --include_path="C:/Users/pagrawal/workspace_v8/EM_Bird_v1" --include_path="C:/ti/ccsv8/tools/compiler/ti-cgt-c6000_8.2.3/include" --define=LCDK_OMAPL138 --define=SOC_OMAPL138 --define=AIC_CODEC --define=DSP_MODE --define=BUILD_OIMAPL138_DSP --define=c6748 -g --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="aic31.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

aic3106_if.obj: ../aic3106_if.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/ccsv8/tools/compiler/ti-cgt-c6000_8.2.3/bin/cl6x" -mv6740 --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/transport/ndk/nimu" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/board" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/example/lcdkOMAPL138/include" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/example/include" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/include" --include_path="C:/Users/pagrawal/workspace_v8/EM_Bird_v1" --include_path="C:/ti/ccsv8/tools/compiler/ti-cgt-c6000_8.2.3/include" --define=LCDK_OMAPL138 --define=SOC_OMAPL138 --define=AIC_CODEC --define=DSP_MODE --define=BUILD_OIMAPL138_DSP --define=c6748 -g --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="aic3106_if.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

audio_evminit.obj: ../audio_evminit.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/ccsv8/tools/compiler/ti-cgt-c6000_8.2.3/bin/cl6x" -mv6740 --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/transport/ndk/nimu" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/board" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/example/lcdkOMAPL138/include" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/example/include" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/include" --include_path="C:/Users/pagrawal/workspace_v8/EM_Bird_v1" --include_path="C:/ti/ccsv8/tools/compiler/ti-cgt-c6000_8.2.3/include" --define=LCDK_OMAPL138 --define=SOC_OMAPL138 --define=AIC_CODEC --define=DSP_MODE --define=BUILD_OIMAPL138_DSP --define=c6748 -g --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="audio_evminit.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

audio_sample_io.obj: ../audio_sample_io.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/ccsv8/tools/compiler/ti-cgt-c6000_8.2.3/bin/cl6x" -mv6740 --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/transport/ndk/nimu" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/board" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/example/lcdkOMAPL138/include" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/example/include" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/include" --include_path="C:/Users/pagrawal/workspace_v8/EM_Bird_v1" --include_path="C:/ti/ccsv8/tools/compiler/ti-cgt-c6000_8.2.3/include" --define=LCDK_OMAPL138 --define=SOC_OMAPL138 --define=AIC_CODEC --define=DSP_MODE --define=BUILD_OIMAPL138_DSP --define=c6748 -g --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="audio_sample_io.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

codec_if.obj: ../codec_if.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/ccsv8/tools/compiler/ti-cgt-c6000_8.2.3/bin/cl6x" -mv6740 --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/transport/ndk/nimu" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/board" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/example/lcdkOMAPL138/include" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/example/include" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/include" --include_path="C:/Users/pagrawal/workspace_v8/EM_Bird_v1" --include_path="C:/ti/ccsv8/tools/compiler/ti-cgt-c6000_8.2.3/include" --define=LCDK_OMAPL138 --define=SOC_OMAPL138 --define=AIC_CODEC --define=DSP_MODE --define=BUILD_OIMAPL138_DSP --define=c6748 -g --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="codec_if.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

helloWorld_omapl13x.obj: ../helloWorld_omapl13x.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/ccsv8/tools/compiler/ti-cgt-c6000_8.2.3/bin/cl6x" -mv6740 --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/transport/ndk/nimu" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/board" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/example/lcdkOMAPL138/include" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/example/include" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/include" --include_path="C:/Users/pagrawal/workspace_v8/EM_Bird_v1" --include_path="C:/ti/ccsv8/tools/compiler/ti-cgt-c6000_8.2.3/include" --define=LCDK_OMAPL138 --define=SOC_OMAPL138 --define=AIC_CODEC --define=DSP_MODE --define=BUILD_OIMAPL138_DSP --define=c6748 -g --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="helloWorld_omapl13x.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

mcasp_cfg.obj: ../mcasp_cfg.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/ccsv8/tools/compiler/ti-cgt-c6000_8.2.3/bin/cl6x" -mv6740 --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/transport/ndk/nimu" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/board" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/example/lcdkOMAPL138/include" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/example/include" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/include" --include_path="C:/Users/pagrawal/workspace_v8/EM_Bird_v1" --include_path="C:/ti/ccsv8/tools/compiler/ti-cgt-c6000_8.2.3/include" --define=LCDK_OMAPL138 --define=SOC_OMAPL138 --define=AIC_CODEC --define=DSP_MODE --define=BUILD_OIMAPL138_DSP --define=c6748 -g --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="mcasp_cfg.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

build-1537331727:
	@$(MAKE) --no-print-directory -Onone -f subdir_rules.mk build-1537331727-inproc

build-1537331727-inproc: ../mcasp_ethernet.cfg
	@echo 'Building file: "$<"'
	@echo 'Invoking: XDCtools'
	"C:/ti/xdctools_3_50_07_20_core/xs" --xdcpath="C:/ti/bios_6_52_00_12/packages;C:/ti/ndk_2_26_00_08/packages;C:/ti/nsp_1_10_03_15/packages;C:/ti/pdk_omapl138_1_0_4/packages;C:/ti/edma3_lld_2_12_05_30C/packages;C:/ti/mathlib_c674x_3_1_1_0/packages;C:/ti/dsplib_c674x_3_4_0_0/packages;C:/ti/uia_2_21_02_07/packages;C:/ti/xdais_7_24_00_04/packages;C:/ti/xdais_7_24_00_04/examples;C:/ti/ipc_3_47_01_00/packages;C:/ti/ccsv8/ccs_base;" xdc.tools.configuro -o configPkg -t ti.targets.elf.C674 -p ti.platforms.evmOMAPL138 -r release -c "C:/ti/ccsv8/tools/compiler/ti-cgt-c6000_8.2.3" --compileOptions "-g --optimize_with_debug" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

configPkg/linker.cmd: build-1537331727 ../mcasp_ethernet.cfg
configPkg/compiler.opt: build-1537331727
configPkg/: build-1537331727

mcasp_soc.obj: ../mcasp_soc.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/ccsv8/tools/compiler/ti-cgt-c6000_8.2.3/bin/cl6x" -mv6740 --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/transport/ndk/nimu" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/board" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/example/lcdkOMAPL138/include" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/example/include" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/include" --include_path="C:/Users/pagrawal/workspace_v8/EM_Bird_v1" --include_path="C:/ti/ccsv8/tools/compiler/ti-cgt-c6000_8.2.3/include" --define=LCDK_OMAPL138 --define=SOC_OMAPL138 --define=AIC_CODEC --define=DSP_MODE --define=BUILD_OIMAPL138_DSP --define=c6748 -g --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="mcasp_soc.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

nimu_osal_omapl13x.obj: ../nimu_osal_omapl13x.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/ccsv8/tools/compiler/ti-cgt-c6000_8.2.3/bin/cl6x" -mv6740 --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/transport/ndk/nimu" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/board" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/example/lcdkOMAPL138/include" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/example/include" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/include" --include_path="C:/Users/pagrawal/workspace_v8/EM_Bird_v1" --include_path="C:/ti/ccsv8/tools/compiler/ti-cgt-c6000_8.2.3/include" --define=LCDK_OMAPL138 --define=SOC_OMAPL138 --define=AIC_CODEC --define=DSP_MODE --define=BUILD_OIMAPL138_DSP --define=c6748 -g --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="nimu_osal_omapl13x.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

udp_hello.obj: ../udp_hello.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C6000 Compiler'
	"C:/ti/ccsv8/tools/compiler/ti-cgt-c6000_8.2.3/bin/cl6x" -mv6740 --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/transport/ndk/nimu" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/board" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/example/lcdkOMAPL138/include" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/example/include" --include_path="C:/ti/pdk_omapl138_1_0_4/packages/ti/drv/mcasp/include" --include_path="C:/Users/pagrawal/workspace_v8/EM_Bird_v1" --include_path="C:/ti/ccsv8/tools/compiler/ti-cgt-c6000_8.2.3/include" --define=LCDK_OMAPL138 --define=SOC_OMAPL138 --define=AIC_CODEC --define=DSP_MODE --define=BUILD_OIMAPL138_DSP --define=c6748 -g --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="udp_hello.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '


