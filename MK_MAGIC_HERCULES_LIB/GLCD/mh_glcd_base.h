/*
 * mh_glcd_base.h
 *
 *  Created on: 9 cze 2023
 *      Author: Miros³aw Kardaœ
 */

#ifndef MK_MAGIC_HERCULES_LIB_GLCD_MH_GLCD_BASE_H_
#define MK_MAGIC_HERCULES_LIB_GLCD_MH_GLCD_BASE_H_





typedef struct {
	int x;
	int y;
} TMHCURSOR;



typedef struct {
	int			width;
	int			height;
	uint8_t		max_bright;
	TSTACK 		stacked;
	TMHCURSOR		cur;
	TMHORIGIN		origin;
	TWIRETYPE	wire_type;
	TMHTEXTALIGN	text_align;
} TMHGLCD;


typedef struct {
	uint8_t active;
	uint8_t left;
	uint8_t right;
	uint8_t top;
	uint8_t bottom;
} TMHVIEWPORT;



extern TMHVIEWPORT mh_viewport;











#endif /* MK_MAGIC_HERCULES_LIB_GLCD_MH_GLCD_BASE_H_ */
