/*
 * magic_hercules_cfg.h
 *
 *  Created on: 3 mar 2023
 *      Author: Miros³aw Kardaœ
 */

#ifndef MAGIC_HERCULES_CFG_H_
#define MAGIC_HERCULES_CFG_H_

#include "../mcc_generated_files/system/system.h"


/**********************************************************************************************************/
/*********************************** LIBRARY CONFIGURATION ************************************************/
/**********************************************************************************************************/

#define MHMLED_CNT						(1024)	// liczba diod na taœmie/wyœwietlaczu

#define USE_MHRGBW						0		// 0-use RGB, 1-use RGBW (W-additional white led)

#define USE_MHGAMMA_COLOR_CORRECTION	1		// 0-disabled, 1-enabled

#define USE_MHBRIGTNESS_ADJUSTMENT		1		// 0-disabled (always max bright), 1-enable brightness correction programatically

#define USE_MHBRIGTNESS_AS_PERCENT_VAL	1		// 0-fast brightness decrease 0-255, 1-slow (percentage 0-100) brightness decrease

#if USE_MHBRIGTNESS_ADJUSTMENT == 1
#define MHMAX_BRIGHT					20		// 0-255 brightness on start / or 0-100 if USE_BRIGTNESS_AS_PERCENT_VAL == 1
#endif


/*------------  soft SPI    -    pin definitions  -------------------------------*/

/***** change led color order as needed   ***  example for BGR   *************/
typedef struct {								// typedef struct {
	uint8_t g;									//	   uint8_t b;
	uint8_t r;									//	   uint8_t g;
	uint8_t b;									//	   uint8_t r;
#if USE_MHRGBW == 1								// #if USE_RGBW == 1
	uint8_t w;									//     uint8_t w;
#endif											// #endif
} TMHRGB;											// } TRGB;



#define USE_MHGLCD_CNT				3


/**********************************************************************************************************/
/*********************************** LIBRARY CONFIGURATION ************************************************/
/**********************************************************************************************************/


// zabezpieczenie jeœli ktoœ u¿ywa procentowego œciemniania to gdyby da³ wiêksz¹ wartoœæ ni¿ 100%
// to ustalamy j¹ na 100%
#if USE_MHBRIGTNESS_AS_PERCENT_VAL == 1
	#if MHMAX_BRIGHT > 100
		#undef MHMAX_BRIGHT
		#define MHMAX_BRIGHT	100
	#endif
#endif

#ifndef MHMAX_BRIGHT
#define MHMAX_BRIGHT 255
#endif



#include "mh.h"
#include "GLCD/mh_glcd_base.h"

#include "GLCD/FONTS/mk_fonts.h"



#endif /* MAGIC_HERCULES_CFG_H_ */

