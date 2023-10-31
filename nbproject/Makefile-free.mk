#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-free.mk)" "nbproject/Makefile-local-free.mk"
include nbproject/Makefile-local-free.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=free
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/avr64dd32-neopixel-mplab-mcc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/avr64dd32-neopixel-mplab-mcc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=mcc_generated_files/ccl/src/ccl.c mcc_generated_files/evsys/src/evsys.c mcc_generated_files/spi/src/spi0.c mcc_generated_files/system/src/config_bits.c mcc_generated_files/system/src/interrupt.c mcc_generated_files/system/src/protected_io.S mcc_generated_files/system/src/system.c mcc_generated_files/system/src/pins.c mcc_generated_files/system/src/clock.c mcc_generated_files/timer/src/tca0.c mcc_generated_files/uart/src/usart0.c MK_MAGIC_HERCULES_LIB/DRV/magic_hercules_drv.c MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DefaultFONT_5x8.c MK_MAGIC_HERCULES_LIB/GLCD/FONTS/Digits_4x8.c MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_5x8.c MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_v1_4x8.c MK_MAGIC_HERCULES_LIB/GLCD/FONTS/MkMINI3x6.c MK_MAGIC_HERCULES_LIB/GLCD/GRAPHICS/mglcd_graphics.c MK_MAGIC_HERCULES_LIB/GLCD/TEXT/mk_glcd_text.c MK_MAGIC_HERCULES_LIB/GLCD/mh_glcd_base.c MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_color_spaces.c MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_gradients.c MK_MAGIC_HERCULES_LIB/mh.c main.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/mcc_generated_files/ccl/src/ccl.o ${OBJECTDIR}/mcc_generated_files/evsys/src/evsys.o ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o ${OBJECTDIR}/mcc_generated_files/system/src/system.o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/DRV/magic_hercules_drv.o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DefaultFONT_5x8.o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/Digits_4x8.o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_5x8.o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_v1_4x8.o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/MkMINI3x6.o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/GRAPHICS/mglcd_graphics.o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/TEXT/mk_glcd_text.o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/mh_glcd_base.o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_color_spaces.o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_gradients.o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/mh.o ${OBJECTDIR}/main.o
POSSIBLE_DEPFILES=${OBJECTDIR}/mcc_generated_files/ccl/src/ccl.o.d ${OBJECTDIR}/mcc_generated_files/evsys/src/evsys.o.d ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o.d ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/DRV/magic_hercules_drv.o.d ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DefaultFONT_5x8.o.d ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/Digits_4x8.o.d ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_5x8.o.d ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_v1_4x8.o.d ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/MkMINI3x6.o.d ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/GRAPHICS/mglcd_graphics.o.d ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/TEXT/mk_glcd_text.o.d ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/mh_glcd_base.o.d ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_color_spaces.o.d ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_gradients.o.d ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/mh.o.d ${OBJECTDIR}/main.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/mcc_generated_files/ccl/src/ccl.o ${OBJECTDIR}/mcc_generated_files/evsys/src/evsys.o ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o ${OBJECTDIR}/mcc_generated_files/system/src/system.o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/DRV/magic_hercules_drv.o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DefaultFONT_5x8.o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/Digits_4x8.o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_5x8.o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_v1_4x8.o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/MkMINI3x6.o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/GRAPHICS/mglcd_graphics.o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/TEXT/mk_glcd_text.o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/mh_glcd_base.o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_color_spaces.o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_gradients.o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/mh.o ${OBJECTDIR}/main.o

# Source Files
SOURCEFILES=mcc_generated_files/ccl/src/ccl.c mcc_generated_files/evsys/src/evsys.c mcc_generated_files/spi/src/spi0.c mcc_generated_files/system/src/config_bits.c mcc_generated_files/system/src/interrupt.c mcc_generated_files/system/src/protected_io.S mcc_generated_files/system/src/system.c mcc_generated_files/system/src/pins.c mcc_generated_files/system/src/clock.c mcc_generated_files/timer/src/tca0.c mcc_generated_files/uart/src/usart0.c MK_MAGIC_HERCULES_LIB/DRV/magic_hercules_drv.c MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DefaultFONT_5x8.c MK_MAGIC_HERCULES_LIB/GLCD/FONTS/Digits_4x8.c MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_5x8.c MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_v1_4x8.c MK_MAGIC_HERCULES_LIB/GLCD/FONTS/MkMINI3x6.c MK_MAGIC_HERCULES_LIB/GLCD/GRAPHICS/mglcd_graphics.c MK_MAGIC_HERCULES_LIB/GLCD/TEXT/mk_glcd_text.c MK_MAGIC_HERCULES_LIB/GLCD/mh_glcd_base.c MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_color_spaces.c MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_gradients.c MK_MAGIC_HERCULES_LIB/mh.c main.c

# Pack Options 
PACK_COMPILER_OPTIONS=-I "${DFP_DIR}/include"
PACK_COMMON_OPTIONS=-B "${DFP_DIR}/gcc/dev/avr64dd32"



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-free.mk ${DISTDIR}/avr64dd32-neopixel-mplab-mcc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=AVR64DD32
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o: mcc_generated_files/system/src/protected_io.S  .generated_files/flags/free/fbc7bad71492a2aaa6d23fa257732d19a535289d .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.ok ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.err 
	 ${MP_CC} $(MP_EXTRA_AS_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -DDEBUG  -x assembler-with-cpp -c -D__$(MP_PROCESSOR_OPTION)__  -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o -o ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o mcc_generated_files/system/src/protected_io.S  -DXPRJ_free=$(CND_CONF)  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1
	
else
${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o: mcc_generated_files/system/src/protected_io.S  .generated_files/flags/free/2ad691256493020e9893141d24da112faa5e021c .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.ok ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.err 
	 ${MP_CC} $(MP_EXTRA_AS_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x assembler-with-cpp -c -D__$(MP_PROCESSOR_OPTION)__  -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o -o ${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o mcc_generated_files/system/src/protected_io.S  -DXPRJ_free=$(CND_CONF)  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/mcc_generated_files/system/src/protected_io.o.asm.d"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/ccl/src/ccl.o: mcc_generated_files/ccl/src/ccl.c  .generated_files/flags/free/a34f2eb621bee440fb6505b0b8c50cea3a938e37 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/ccl/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ccl/src/ccl.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ccl/src/ccl.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/ccl/src/ccl.o.d" -MT "${OBJECTDIR}/mcc_generated_files/ccl/src/ccl.o.d" -MT ${OBJECTDIR}/mcc_generated_files/ccl/src/ccl.o  -o ${OBJECTDIR}/mcc_generated_files/ccl/src/ccl.o mcc_generated_files/ccl/src/ccl.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/evsys/src/evsys.o: mcc_generated_files/evsys/src/evsys.c  .generated_files/flags/free/c4115ad034cc6b2b43143df5fced62dbb08f7d08 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/evsys/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/evsys/src/evsys.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/evsys/src/evsys.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/evsys/src/evsys.o.d" -MT "${OBJECTDIR}/mcc_generated_files/evsys/src/evsys.o.d" -MT ${OBJECTDIR}/mcc_generated_files/evsys/src/evsys.o  -o ${OBJECTDIR}/mcc_generated_files/evsys/src/evsys.o mcc_generated_files/evsys/src/evsys.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o: mcc_generated_files/spi/src/spi0.c  .generated_files/flags/free/22e6488b54b9dda9e4cc07c42ce90e50bc3bca9f .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/spi/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o  -o ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o mcc_generated_files/spi/src/spi0.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o: mcc_generated_files/system/src/config_bits.c  .generated_files/flags/free/c8340068ee3680ace439da70a2b97a3a0daf016e .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o  -o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o mcc_generated_files/system/src/config_bits.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o: mcc_generated_files/system/src/interrupt.c  .generated_files/flags/free/c6384e3976aca8446c09d28ca318746eacdd6a7d .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o  -o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o mcc_generated_files/system/src/interrupt.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/system/src/system.o: mcc_generated_files/system/src/system.c  .generated_files/flags/free/fee1d0d94b4675f6e015a203ea6f866c6f35b8b0 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/system.o  -o ${OBJECTDIR}/mcc_generated_files/system/src/system.o mcc_generated_files/system/src/system.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/system/src/pins.o: mcc_generated_files/system/src/pins.c  .generated_files/flags/free/5e02e0c7455b981f76c66c447eee7b33c0cae9f7 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/pins.o  -o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o mcc_generated_files/system/src/pins.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/system/src/clock.o: mcc_generated_files/system/src/clock.c  .generated_files/flags/free/830801d30827a996e1066e6052cce74dbaaa52a0 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/clock.o  -o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o mcc_generated_files/system/src/clock.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o: mcc_generated_files/timer/src/tca0.c  .generated_files/flags/free/f3807417d41fbf5704812bd8a39c0500895665ee .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o  -o ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o mcc_generated_files/timer/src/tca0.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o: mcc_generated_files/uart/src/usart0.c  .generated_files/flags/free/eef05f63b4412db1d955c40b1b9f081a7c5b8c3f .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/uart/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o  -o ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o mcc_generated_files/uart/src/usart0.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/DRV/magic_hercules_drv.o: MK_MAGIC_HERCULES_LIB/DRV/magic_hercules_drv.c  .generated_files/flags/free/fc2fa5da678392072512f7159cac1456aa7f8fe7 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/DRV" 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/DRV/magic_hercules_drv.o.d 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/DRV/magic_hercules_drv.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/DRV/magic_hercules_drv.o.d" -MT "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/DRV/magic_hercules_drv.o.d" -MT ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/DRV/magic_hercules_drv.o  -o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/DRV/magic_hercules_drv.o MK_MAGIC_HERCULES_LIB/DRV/magic_hercules_drv.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DefaultFONT_5x8.o: MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DefaultFONT_5x8.c  .generated_files/flags/free/97990a306c19ef490dcb61815f18e5d9a8b47033 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS" 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DefaultFONT_5x8.o.d 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DefaultFONT_5x8.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DefaultFONT_5x8.o.d" -MT "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DefaultFONT_5x8.o.d" -MT ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DefaultFONT_5x8.o  -o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DefaultFONT_5x8.o MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DefaultFONT_5x8.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/Digits_4x8.o: MK_MAGIC_HERCULES_LIB/GLCD/FONTS/Digits_4x8.c  .generated_files/flags/free/6a0192cd67f0ab0474f42668415bfec96a2e1a70 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS" 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/Digits_4x8.o.d 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/Digits_4x8.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/Digits_4x8.o.d" -MT "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/Digits_4x8.o.d" -MT ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/Digits_4x8.o  -o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/Digits_4x8.o MK_MAGIC_HERCULES_LIB/GLCD/FONTS/Digits_4x8.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_5x8.o: MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_5x8.c  .generated_files/flags/free/2da1ab6c5554cddd6f498d4bb504b43de0315b4a .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS" 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_5x8.o.d 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_5x8.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_5x8.o.d" -MT "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_5x8.o.d" -MT ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_5x8.o  -o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_5x8.o MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_5x8.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_v1_4x8.o: MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_v1_4x8.c  .generated_files/flags/free/cfeba6e5cf1f7599cc78571e2086942e9002573a .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS" 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_v1_4x8.o.d 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_v1_4x8.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_v1_4x8.o.d" -MT "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_v1_4x8.o.d" -MT ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_v1_4x8.o  -o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_v1_4x8.o MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_v1_4x8.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/MkMINI3x6.o: MK_MAGIC_HERCULES_LIB/GLCD/FONTS/MkMINI3x6.c  .generated_files/flags/free/6d652d36c4b2f0182b7797b283345d78cbf3fa9b .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS" 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/MkMINI3x6.o.d 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/MkMINI3x6.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/MkMINI3x6.o.d" -MT "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/MkMINI3x6.o.d" -MT ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/MkMINI3x6.o  -o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/MkMINI3x6.o MK_MAGIC_HERCULES_LIB/GLCD/FONTS/MkMINI3x6.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/GRAPHICS/mglcd_graphics.o: MK_MAGIC_HERCULES_LIB/GLCD/GRAPHICS/mglcd_graphics.c  .generated_files/flags/free/954823963200c4c22fd9a0288959efdcae631718 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/GRAPHICS" 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/GRAPHICS/mglcd_graphics.o.d 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/GRAPHICS/mglcd_graphics.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/GRAPHICS/mglcd_graphics.o.d" -MT "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/GRAPHICS/mglcd_graphics.o.d" -MT ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/GRAPHICS/mglcd_graphics.o  -o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/GRAPHICS/mglcd_graphics.o MK_MAGIC_HERCULES_LIB/GLCD/GRAPHICS/mglcd_graphics.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/TEXT/mk_glcd_text.o: MK_MAGIC_HERCULES_LIB/GLCD/TEXT/mk_glcd_text.c  .generated_files/flags/free/5c7fc87daac5c3742c5feadf1edf23240ad434d9 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/TEXT" 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/TEXT/mk_glcd_text.o.d 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/TEXT/mk_glcd_text.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/TEXT/mk_glcd_text.o.d" -MT "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/TEXT/mk_glcd_text.o.d" -MT ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/TEXT/mk_glcd_text.o  -o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/TEXT/mk_glcd_text.o MK_MAGIC_HERCULES_LIB/GLCD/TEXT/mk_glcd_text.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/mh_glcd_base.o: MK_MAGIC_HERCULES_LIB/GLCD/mh_glcd_base.c  .generated_files/flags/free/4bfccda3de7d82d10c54d19ccf735cd9de7d894e .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD" 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/mh_glcd_base.o.d 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/mh_glcd_base.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/mh_glcd_base.o.d" -MT "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/mh_glcd_base.o.d" -MT ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/mh_glcd_base.o  -o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/mh_glcd_base.o MK_MAGIC_HERCULES_LIB/GLCD/mh_glcd_base.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_color_spaces.o: MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_color_spaces.c  .generated_files/flags/free/5272b82aec57978f71d2f845541675e27f25b645 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS" 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_color_spaces.o.d 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_color_spaces.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_color_spaces.o.d" -MT "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_color_spaces.o.d" -MT ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_color_spaces.o  -o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_color_spaces.o MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_color_spaces.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_gradients.o: MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_gradients.c  .generated_files/flags/free/722361ea914bf253c28012d9a77a1ca347614407 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS" 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_gradients.o.d 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_gradients.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_gradients.o.d" -MT "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_gradients.o.d" -MT ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_gradients.o  -o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_gradients.o MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_gradients.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/mh.o: MK_MAGIC_HERCULES_LIB/mh.c  .generated_files/flags/free/69fc35eb31e10da2b714a25ebe08a1f3477d73c6 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB" 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/mh.o.d 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/mh.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/mh.o.d" -MT "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/mh.o.d" -MT ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/mh.o  -o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/mh.o MK_MAGIC_HERCULES_LIB/mh.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/free/6c249e8fe03127da3b9d67d95ab71b13c8811735 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS} -g -DDEBUG  -gdwarf-2  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o  -o ${OBJECTDIR}/main.o main.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
else
${OBJECTDIR}/mcc_generated_files/ccl/src/ccl.o: mcc_generated_files/ccl/src/ccl.c  .generated_files/flags/free/e29d8ae2134f2080dc62cfcebe1de1c7084cdb8d .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/ccl/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ccl/src/ccl.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/ccl/src/ccl.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/ccl/src/ccl.o.d" -MT "${OBJECTDIR}/mcc_generated_files/ccl/src/ccl.o.d" -MT ${OBJECTDIR}/mcc_generated_files/ccl/src/ccl.o  -o ${OBJECTDIR}/mcc_generated_files/ccl/src/ccl.o mcc_generated_files/ccl/src/ccl.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/evsys/src/evsys.o: mcc_generated_files/evsys/src/evsys.c  .generated_files/flags/free/79490d646e429c39a3b5fded1ec6c3e04a402939 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/evsys/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/evsys/src/evsys.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/evsys/src/evsys.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/evsys/src/evsys.o.d" -MT "${OBJECTDIR}/mcc_generated_files/evsys/src/evsys.o.d" -MT ${OBJECTDIR}/mcc_generated_files/evsys/src/evsys.o  -o ${OBJECTDIR}/mcc_generated_files/evsys/src/evsys.o mcc_generated_files/evsys/src/evsys.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o: mcc_generated_files/spi/src/spi0.c  .generated_files/flags/free/2d27f52a5a84162bc839f8738733b18cdf71d95 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/spi/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o  -o ${OBJECTDIR}/mcc_generated_files/spi/src/spi0.o mcc_generated_files/spi/src/spi0.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o: mcc_generated_files/system/src/config_bits.c  .generated_files/flags/free/67ac53fca6bb4ac0c513635bef1ed21406e518ba .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o  -o ${OBJECTDIR}/mcc_generated_files/system/src/config_bits.o mcc_generated_files/system/src/config_bits.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o: mcc_generated_files/system/src/interrupt.c  .generated_files/flags/free/f1cfa4ef695b0c119c1c6102b1d65af37a2ad30c .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o  -o ${OBJECTDIR}/mcc_generated_files/system/src/interrupt.o mcc_generated_files/system/src/interrupt.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/system/src/system.o: mcc_generated_files/system/src/system.c  .generated_files/flags/free/2f9f2c8d21e7ba79abc1025ee6fb2d6b44437ff5 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/system.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/system.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/system.o  -o ${OBJECTDIR}/mcc_generated_files/system/src/system.o mcc_generated_files/system/src/system.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/system/src/pins.o: mcc_generated_files/system/src/pins.c  .generated_files/flags/free/5ba61f7b0dcde19be033a487d0d39dc43078c137 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/pins.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/pins.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/pins.o  -o ${OBJECTDIR}/mcc_generated_files/system/src/pins.o mcc_generated_files/system/src/pins.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/system/src/clock.o: mcc_generated_files/system/src/clock.c  .generated_files/flags/free/ca4d708a776ae74e858ac253961c4f73a894527e .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/system/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system/src/clock.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d" -MT "${OBJECTDIR}/mcc_generated_files/system/src/clock.o.d" -MT ${OBJECTDIR}/mcc_generated_files/system/src/clock.o  -o ${OBJECTDIR}/mcc_generated_files/system/src/clock.o mcc_generated_files/system/src/clock.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o: mcc_generated_files/timer/src/tca0.c  .generated_files/flags/free/3ec65717c60df6c63aaf1e2db8d83a3edde76ba8 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/timer/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o  -o ${OBJECTDIR}/mcc_generated_files/timer/src/tca0.o mcc_generated_files/timer/src/tca0.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o: mcc_generated_files/uart/src/usart0.c  .generated_files/flags/free/c7689fdb52c3de4882160d8bcb63c417aa80b643 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/uart/src" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o.d" -MT "${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o.d" -MT ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o  -o ${OBJECTDIR}/mcc_generated_files/uart/src/usart0.o mcc_generated_files/uart/src/usart0.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/DRV/magic_hercules_drv.o: MK_MAGIC_HERCULES_LIB/DRV/magic_hercules_drv.c  .generated_files/flags/free/ad2f3ecc45d4af8ed3b520ca698520bbabbc5954 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/DRV" 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/DRV/magic_hercules_drv.o.d 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/DRV/magic_hercules_drv.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/DRV/magic_hercules_drv.o.d" -MT "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/DRV/magic_hercules_drv.o.d" -MT ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/DRV/magic_hercules_drv.o  -o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/DRV/magic_hercules_drv.o MK_MAGIC_HERCULES_LIB/DRV/magic_hercules_drv.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DefaultFONT_5x8.o: MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DefaultFONT_5x8.c  .generated_files/flags/free/58fe408e333a36fef0d4db7765e3c80d234621a2 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS" 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DefaultFONT_5x8.o.d 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DefaultFONT_5x8.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DefaultFONT_5x8.o.d" -MT "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DefaultFONT_5x8.o.d" -MT ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DefaultFONT_5x8.o  -o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DefaultFONT_5x8.o MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DefaultFONT_5x8.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/Digits_4x8.o: MK_MAGIC_HERCULES_LIB/GLCD/FONTS/Digits_4x8.c  .generated_files/flags/free/4ed1b03514320d0699752007a877a3fd88b794f7 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS" 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/Digits_4x8.o.d 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/Digits_4x8.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/Digits_4x8.o.d" -MT "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/Digits_4x8.o.d" -MT ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/Digits_4x8.o  -o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/Digits_4x8.o MK_MAGIC_HERCULES_LIB/GLCD/FONTS/Digits_4x8.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_5x8.o: MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_5x8.c  .generated_files/flags/free/eb8cb5baac28086f367c454a97533b015d4c4e9b .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS" 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_5x8.o.d 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_5x8.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_5x8.o.d" -MT "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_5x8.o.d" -MT ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_5x8.o  -o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_5x8.o MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_5x8.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_v1_4x8.o: MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_v1_4x8.c  .generated_files/flags/free/191d3e3716be8b81fca75c81811b59dd2d3024e4 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS" 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_v1_4x8.o.d 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_v1_4x8.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_v1_4x8.o.d" -MT "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_v1_4x8.o.d" -MT ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_v1_4x8.o  -o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_v1_4x8.o MK_MAGIC_HERCULES_LIB/GLCD/FONTS/DIGITS_v1_4x8.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/MkMINI3x6.o: MK_MAGIC_HERCULES_LIB/GLCD/FONTS/MkMINI3x6.c  .generated_files/flags/free/eea9629255ead165befee7d67bdfafc057244127 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS" 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/MkMINI3x6.o.d 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/MkMINI3x6.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/MkMINI3x6.o.d" -MT "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/MkMINI3x6.o.d" -MT ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/MkMINI3x6.o  -o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/FONTS/MkMINI3x6.o MK_MAGIC_HERCULES_LIB/GLCD/FONTS/MkMINI3x6.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/GRAPHICS/mglcd_graphics.o: MK_MAGIC_HERCULES_LIB/GLCD/GRAPHICS/mglcd_graphics.c  .generated_files/flags/free/2874c111817f0ab3d453d2d4fc8a5a4e9207de4a .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/GRAPHICS" 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/GRAPHICS/mglcd_graphics.o.d 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/GRAPHICS/mglcd_graphics.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/GRAPHICS/mglcd_graphics.o.d" -MT "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/GRAPHICS/mglcd_graphics.o.d" -MT ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/GRAPHICS/mglcd_graphics.o  -o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/GRAPHICS/mglcd_graphics.o MK_MAGIC_HERCULES_LIB/GLCD/GRAPHICS/mglcd_graphics.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/TEXT/mk_glcd_text.o: MK_MAGIC_HERCULES_LIB/GLCD/TEXT/mk_glcd_text.c  .generated_files/flags/free/e670826ff2d7284981f02affc90f0ff900739050 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/TEXT" 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/TEXT/mk_glcd_text.o.d 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/TEXT/mk_glcd_text.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/TEXT/mk_glcd_text.o.d" -MT "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/TEXT/mk_glcd_text.o.d" -MT ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/TEXT/mk_glcd_text.o  -o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/TEXT/mk_glcd_text.o MK_MAGIC_HERCULES_LIB/GLCD/TEXT/mk_glcd_text.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/mh_glcd_base.o: MK_MAGIC_HERCULES_LIB/GLCD/mh_glcd_base.c  .generated_files/flags/free/dc05315a1274eb9fdcfe5ba0b23fc727b4c111a1 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD" 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/mh_glcd_base.o.d 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/mh_glcd_base.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/mh_glcd_base.o.d" -MT "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/mh_glcd_base.o.d" -MT ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/mh_glcd_base.o  -o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/GLCD/mh_glcd_base.o MK_MAGIC_HERCULES_LIB/GLCD/mh_glcd_base.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_color_spaces.o: MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_color_spaces.c  .generated_files/flags/free/81aba7fd251fa3f4ea44eba7a7f7a3581a050afa .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS" 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_color_spaces.o.d 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_color_spaces.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_color_spaces.o.d" -MT "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_color_spaces.o.d" -MT ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_color_spaces.o  -o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_color_spaces.o MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_color_spaces.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_gradients.o: MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_gradients.c  .generated_files/flags/free/475c6524a8a43af069c4a424241c2d4c386f723c .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS" 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_gradients.o.d 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_gradients.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_gradients.o.d" -MT "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_gradients.o.d" -MT ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_gradients.o  -o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_gradients.o MK_MAGIC_HERCULES_LIB/MH_TOOLS/mh_gradients.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/mh.o: MK_MAGIC_HERCULES_LIB/mh.c  .generated_files/flags/free/5ce9dac6cccd22625202fe269f2103c2f037a970 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB" 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/mh.o.d 
	@${RM} ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/mh.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/mh.o.d" -MT "${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/mh.o.d" -MT ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/mh.o  -o ${OBJECTDIR}/MK_MAGIC_HERCULES_LIB/mh.o MK_MAGIC_HERCULES_LIB/mh.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/free/2a2b5f3f50d0736733e37e8d83cc0969d3847c12 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	 ${MP_CC}  $(MP_EXTRA_CC_PRE) -mmcu=avr64dd32 ${PACK_COMPILER_OPTIONS} ${PACK_COMMON_OPTIONS}  -x c -c -D__$(MP_PROCESSOR_OPTION)__  -funsigned-char -funsigned-bitfields -O1 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -Wall -MD -MP -MF "${OBJECTDIR}/main.o.d" -MT "${OBJECTDIR}/main.o.d" -MT ${OBJECTDIR}/main.o  -o ${OBJECTDIR}/main.o main.c  -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD) 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/avr64dd32-neopixel-mplab-mcc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mmcu=avr64dd32 ${PACK_COMMON_OPTIONS}   -gdwarf-2 -D__$(MP_PROCESSOR_OPTION)__  -Wl,-Map="${DISTDIR}\avr64dd32-neopixel-mplab-mcc.X.${IMAGE_TYPE}.map"    -o ${DISTDIR}/avr64dd32-neopixel-mplab-mcc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1 -Wl,--gc-sections -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	
	
	
	
	
	
else
${DISTDIR}/avr64dd32-neopixel-mplab-mcc.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mmcu=avr64dd32 ${PACK_COMMON_OPTIONS}  -D__$(MP_PROCESSOR_OPTION)__  -Wl,-Map="${DISTDIR}\avr64dd32-neopixel-mplab-mcc.X.${IMAGE_TYPE}.map"    -o ${DISTDIR}/avr64dd32-neopixel-mplab-mcc.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}      -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION) -Wl,--gc-sections -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	${MP_CC_DIR}\\avr-objcopy -O ihex "${DISTDIR}/avr64dd32-neopixel-mplab-mcc.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "${DISTDIR}/avr64dd32-neopixel-mplab-mcc.X.${IMAGE_TYPE}.hex"
	
	
	
	
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
