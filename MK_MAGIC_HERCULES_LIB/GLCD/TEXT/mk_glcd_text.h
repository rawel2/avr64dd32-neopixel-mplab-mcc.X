/*
 * mk_glcd_text.h
 *
 *		Created on: 10 lis 2022
 *      Author: Miros³aw Kardaœ
 *         web: www.atnel.pl
 *
 *	Library: MK GLCD  ver: 1.1a

 * 	
 * 	 Uwaga! przed kompilacj¹ nale¿y dodaæ opcjê w ustawieniach toolchaina
 * 	 C/C++ Build/Settings/AVR C Linker/General/Other Arguments
 * 	 -Wl,-gc-sections
 * 	
 *
 *
 */

#include "../FONTS/mk_fonts.h"



#ifndef MK_GLCD_TEXT_MK_GLCD_TEXT_H_
#define MK_GLCD_TEXT_MK_GLCD_TEXT_H_







// u¿ywaj obs³ugi fontów w dwóch orientacjach T2B i R2L - wiêksze zu¿ycie Flash i czasu
#define USE_MHTWO_FONTS_BITORIENT			0		//0-disabled, 1-enabled


extern TMHGLCD * act_glcd_ptr;

extern MHFONT_INFO mh_currentFont;

void mh_setCurrentFont( const MHFONT_INFO * font );




void mh_glcd_locate( int x, int y );

//void glcd_put_char( int x, int y, char c, uint8_t mode );
void mh_glcd_put_char( int x, int y, char c, uint32_t color, TMHCOLOR_MODE mode );


void mh_glcd_put_char1( char c, uint32_t color, TMHCOLOR_MODE mode   );

void mh_glcd_puts( int x, int y, char * s, uint32_t color, TMHCOLOR_MODE mode );
void mh_glcd_puts1( char * s, uint32_t color, TMHCOLOR_MODE mode );

void mh_glcd_puts_P( int x, int y, const char * s, uint32_t color, TMHCOLOR_MODE mode );
void mh_glcd_puts1_P( const char * s, uint32_t color, TMHCOLOR_MODE mode );

void mh_glcd_int( int x, int y, int32_t val, uint32_t color, TMHCOLOR_MODE mode );
void mh_glcd_int1( int32_t val, uint32_t color, TMHCOLOR_MODE mode );

void mh_glcd_uint( int x, int y, uint32_t val, uint32_t color, TMHCOLOR_MODE mode );
void mh_glcd_uint1( uint32_t val, uint32_t color, TMHCOLOR_MODE mode );

void mh_glcd_hex( int x, int y, uint32_t val, uint32_t color, TMHCOLOR_MODE mode );
void mh_glcd_hex1( uint32_t val, uint32_t color, TMHCOLOR_MODE mode );

void mh_glcd_bin( int x, int y, uint32_t val, uint8_t len, uint32_t color, TMHCOLOR_MODE mode );
void mh_glcd_bin1( uint32_t val, uint8_t len, uint32_t color, TMHCOLOR_MODE mode );

int mh_text_len( char *s );
uint8_t mh_char_len( char c );
int mh_text_len_P( const char *s );

#endif /* MK_GLCD_TEXT_MK_GLCD_TEXT_H_ */















