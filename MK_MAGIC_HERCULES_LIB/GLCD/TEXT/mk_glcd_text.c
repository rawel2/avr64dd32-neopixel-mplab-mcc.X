/*
 * mk_glcd_text.c
 *
 *		Created on: 10 lis 2022
 *      Author: Miros³aw Kardaœ
 *         web: www.atnel.pl
 *
 *	Library: MK GLCD  ver: 1.1a

 * 	
 * 	 use: -Wl,--gc-sections   (in AVR C Linker general -> Other Arguments)
 * 	
 *
 *
 */
#include "../../../mcc_generated_files/system/system.h"
#include <avr/io.h>
#include <avr/pgmspace.h>
#include <util/delay.h>
#include <string.h>
#include <stdlib.h>

#include "..\..\magic_hercules_cfg.h"


#if USE_MHGLCD_CNT > 0

#include  "mk_glcd_text.h"

#include "../FONTS/mk_fonts.h"










MHFONT_INFO mh_currentFont;

void mh_setCurrentFont( const MHFONT_INFO * font ) {
	mh_currentFont.down_space			= pgm_read_byte(&font->down_space);
	mh_currentFont.heightPixels 		= pgm_read_byte(&font->heightPixels);
	mh_currentFont.startChar 			= pgm_read_byte(&font->startChar);
	mh_currentFont.interspacePixels	= pgm_read_byte(&font->interspacePixels);
	mh_currentFont.spacePixels 		= pgm_read_byte(&font->spacePixels);
	mh_currentFont.charInfo 			= (MHFONT_CHAR_INFO*)pgm_read_word(&font->charInfo);
	mh_currentFont.data 				= (uint8_t*)pgm_read_word(&font->data);
	mh_currentFont.FontFileName		= (char*)pgm_read_word(&font->FontFileName);
#if USE_MHTWO_FONTS_BITORIENT == 1
	mh_currentFont.bitOrientation		= pgm_read_byte(&font->bitOrientation);
#endif
}








//static void send_glyph_byte( int x, int y, uint8_t bajt, uint8_t height, uint8_t mode ) {
//
//	for( uint8_t i=0; i<height; i++ ) {
//		if( bajt & 0x01 ) glcd_setPixel( x,y, mode );
////		else {
////			set_background_pixel( x, y, mode );
////		}
//		bajt>>=1;
//		y++;
//	}
//}


#if USE_MHTWO_FONTS_BITORIENT == 1
static void mh_send_glyph_byteB( int x, int y, uint8_t bajt, uint8_t width, uint8_t mode ) {

	for( uint8_t i=0; i<width; i++ ) {
		if( bajt & 0x80 ) glcd_setPixel( x,y, mode );
//		else {
//			set_background_pixel( x, y, mode );
//		}
		bajt<<=1;
		x++;
	}
}


static void mh_send_font_bitmapB( int x, int y, const uint8_t *glyph, int glyphHeight, int glyphWidth, uint8_t mode ) {

	uint8_t i, j, k, bajt;
	uint16_t p=0;


	for( i=0; i<glyphHeight; i++ ) {
		for( j=0, k=0; j<glyphWidth; j+=8, k++ ) {
			bajt = pgm_read_byte( &glyph[ p++ ] );
			if( ((k+1)*8)<=glyphWidth ) send_glyph_byteB( x+(k*8), y, bajt, 8, mode );
			else send_glyph_byteB( x+(k*8), y, bajt, glyphWidth-(k*8), mode );
		}
		y++;
	}

}
#endif




//static void send_font_bitmap( int x, int y, uint8_t *glyph, int glyphHeight, int glyphWidth, uint32_t color, TMHCOLOR_MODE mode  ) {
//
//	uint8_t ix, bajt;
//	uint16_t p=0;
//
//	for(ix=0; ix<glyphWidth; ix++ ) {
//		bajt = pgm_read_byte( &glyph[ p++ ] );
//
//		for( uint8_t iy=0; iy<glyphHeight; iy++ ) {
//
//			if( !(mode & 0xF0) ) {
//				if( bajt & 0x01 ) glcd_set_pixel( x+ix,y+iy, color, mode );
//			} else {
//				if( !(bajt & 0x01) ) glcd_set_pixel( x+ix,y+iy, color, 0 );
//			}
//
//
//
//			bajt >>= 1;
//		}
//	}
//}

// poprawka Adiunkta PawelR z discorda ;)
// https://discord.com/channels/900330552492711946/1093091501350850620/1122464847280492604
static void mh_send_font_bitmap( int x, int y, uint8_t *glyph, int glyphHeight, int glyphWidth, uint32_t color, TMHCOLOR_MODE mode  ) {

    uint8_t ix, bajt =0;
    uint16_t p=0;

    for(ix=0; ix<glyphWidth; ix++ ) {

        for( uint8_t iy=0; iy<glyphHeight; iy++ ) {
            if ((iy % 8) == 0) {
                bajt = pgm_read_byte( &glyph[ p++ ] );
            }
            if( !(mode & 0xF0) ) {
                if( bajt & 0x01 ) mh_glcd_set_pixel( x+ix,y+iy, color, mode );
            } else {
                if( !(bajt & 0x01) ) mh_glcd_set_pixel( x+ix,y+iy, 0, 0 );
            }

            bajt >>= 1;
        }
    }
}




void mh_glcd_text_align( TMHTEXTALIGN align ) {
	act_glcd_ptr->text_align = align;
}




void mh_glcd_put_char( int x, int y, char c, uint32_t color, TMHCOLOR_MODE mode  ) {

	uint8_t gH, gW, gS, gIS;
	uint16_t offset;
	uint8_t startChar = mh_currentFont.startChar;
	uint8_t * glyph = (uint8_t*)mh_currentFont.data;

	gH = mh_currentFont.heightPixels;
	gIS = mh_currentFont.interspacePixels;
	gS = mh_currentFont.spacePixels;

	uint8_t cm = mode & 0xF0;

		if( c > ' ') {
			gW = pgm_read_byte( &mh_currentFont.charInfo[ c - startChar  ].widthBits );

			offset = pgm_read_word( &mh_currentFont.charInfo[ c - startChar  ].offset);

			mh_send_font_bitmap(x, y, glyph+offset, gH, gW, color, mode );


			if( !cm ) x = x + gW + gIS;
			else {
				x = x + gW;
				for( int g=0; g<gIS; g++ ) {
					mh_glcd_drawFastVLine(  x++, y, gH, color, 0 );
				}
			}

		} else {

			if( !cm ) x+=gS+gIS;
			else {
				for( int g=0; g<(gS+gIS); g++ ) {
					mh_glcd_drawFastVLine(  x++, y, gH, color, 0 );
				}
			}

		}


	act_glcd_ptr->cur.x = x;
	act_glcd_ptr->cur.y = y;
}


void mh_glcd_put_char1( char c, uint32_t color, TMHCOLOR_MODE mode ) {
	mh_glcd_put_char( act_glcd_ptr->cur.x, act_glcd_ptr->cur.y, c, color, mode );
}


void mh_glcd_puts( int x, int y, char * s, uint32_t color, TMHCOLOR_MODE mode ) {

	if( act_glcd_ptr->text_align ) {
		int tl = mh_text_len(s);
		int width = act_glcd_ptr->width;
		uint8_t ip = ( (mh_currentFont.interspacePixels==1)?1:mh_currentFont.interspacePixels/2);

		if( al_center == act_glcd_ptr->text_align ) x = x + (width-x)/2 - tl/2 + ip;
		else if( al_right == act_glcd_ptr->text_align ) x = width - tl + ip;
	}

	uint8_t mm = mode & 0xF0;
	if( mm ) {
		int ay = y;
		uint8_t h = mh_currentFont.heightPixels;
		int w = mh_text_len(s);
		for( int i = 0; i<w; i++ ) {
			if( mm == 0x10 ) mh_glcd_draw_VLine_gradient( x+i, ay, h, rgb_gradient_colors.start, rgb_gradient_colors.end, mode & 0x0F );
			else mh_glcd_draw_VLine_gradientHSV( x+i, ay, h, 	hsv_gradient_colors.startH,
															hsv_gradient_colors.startS,
															hsv_gradient_colors.startV,
															hsv_gradient_colors.endH,
															hsv_gradient_colors.endS,
															hsv_gradient_colors.endV,
															mode & 0x0F );
		}
	}





	act_glcd_ptr->cur.x = x;
	act_glcd_ptr->cur.y = y;


	while( *s ) mh_glcd_put_char( act_glcd_ptr->cur.x, act_glcd_ptr->cur.y, *s++, color, mode );
}

void mh_glcd_puts1( char * s, uint32_t color, TMHCOLOR_MODE mode ) {

	mh_glcd_puts( act_glcd_ptr->cur.x, act_glcd_ptr->cur.y, s, color, mode );
}

void mh_glcd_puts_P( int x, int y, const char * s, uint32_t color, TMHCOLOR_MODE mode ) {

	if( act_glcd_ptr->text_align ) {
		int tl = mh_text_len_P(s);
		int width = act_glcd_ptr->width;
		uint8_t ip = ( (mh_currentFont.interspacePixels==1)?1:mh_currentFont.interspacePixels/2);

		if( al_center == act_glcd_ptr->text_align ) x = x + (width-x)/2 - tl/2 + ip;
		else if( al_right == act_glcd_ptr->text_align ) x = width - tl + ip;
	}

	uint8_t mm = mode & 0xF0;
	if( mm ) {
		int ay = y;
		uint8_t h = mh_currentFont.heightPixels;
		int w = mh_text_len_P(s);
		for( int i = 0; i<w; i++ ) {
			if( mm == 0x10 ) mh_glcd_draw_VLine_gradient( x+i, ay, h, rgb_gradient_colors.start, rgb_gradient_colors.end, mode & 0x0F );
			else mh_glcd_draw_VLine_gradientHSV( x+i, ay, h, 	hsv_gradient_colors.startH,
															hsv_gradient_colors.startS,
															hsv_gradient_colors.startV,
															hsv_gradient_colors.endH,
															hsv_gradient_colors.endS,
															hsv_gradient_colors.endV,
															mode & 0x0F );
		}
	}



	act_glcd_ptr->cur.x = x;
	act_glcd_ptr->cur.y = y;


	char c;
	while( ( c = pgm_read_byte(s++) ) ) mh_glcd_put_char( act_glcd_ptr->cur.x, act_glcd_ptr->cur.y, c, color, mode );
}

void mh_glcd_puts1_P( const char * s, uint32_t color, TMHCOLOR_MODE mode ) {
	mh_glcd_puts_P( act_glcd_ptr->cur.x, act_glcd_ptr->cur.y, s, color, mode );
}


void mh_glcd_int( int x, int y, int32_t val, uint32_t color, TMHCOLOR_MODE mode ) {
	char buf[17];
	ltoa(val, buf, 10 );

	act_glcd_ptr->cur.x = x;
	act_glcd_ptr->cur.y = y;

	mh_glcd_puts( x, y, buf, color, mode );
}

void mh_glcd_int1( int32_t val, uint32_t color, TMHCOLOR_MODE mode ) {
	mh_glcd_int( act_glcd_ptr->cur.x, act_glcd_ptr->cur.y, val, color, mode );
}

void mh_glcd_uint( int x, int y, uint32_t val, uint32_t color, TMHCOLOR_MODE mode ) {
	char buf[17];
	ultoa(val, buf, 10 );
	mh_glcd_puts( x, y, buf, color, mode );
}

void mh_glcd_uint1( uint32_t val, uint32_t color, TMHCOLOR_MODE mode ) {
	mh_glcd_uint( act_glcd_ptr->cur.x, act_glcd_ptr->cur.y, val, color, mode );
}


void mh_glcd_hex( int x, int y, uint32_t val, uint32_t color, TMHCOLOR_MODE mode ) {
	char buf[10], bf[10] = {};
	ultoa(val, buf, 16 );
	strcat_P(bf,PSTR("0x"));
	strcat(bf,buf);
	char * wsk = strupr(bf);
	wsk[1] = 'x';
	mh_glcd_puts( x, y, wsk, color, mode );
}

void mh_glcd_hex1( uint32_t val, uint32_t color, TMHCOLOR_MODE mode ) {
	mh_glcd_hex( act_glcd_ptr->cur.x, act_glcd_ptr->cur.y, val, color, mode );
}


// konwersja do postaci binarnej liczb max 32-bitowych
// ARG:
// val - liczba do konwersji
// len - iloœæ znaków postaci binarnej z zerami nieznacz¹cymi
void mh_glcd_bin( int x, int y, uint32_t val, uint8_t len, uint32_t color, TMHCOLOR_MODE mode ) {
	char str[len+1];
	memset( str, 0, len+1 );
	for( int8_t i=0, k=len-1; i<len; i++ ) {
		uint32_t a = val >> k;
		if( a & 0x0001 ) str[k]='1'; else str[k]='0';
		k--;
	}
	strrev( str );
	mh_glcd_puts( x, y, str, color, mode );
}

void mh_glcd_bin1( uint32_t val, uint8_t len, uint32_t color, TMHCOLOR_MODE mode ) {
	mh_glcd_bin( act_glcd_ptr->cur.x, act_glcd_ptr->cur.y, val, len, color, mode );
}


void mh_glcd_locate( int x, int y ) {

	act_glcd_ptr->cur.x = x;
	act_glcd_ptr->cur.y = y;
}


uint8_t mh_char_len( char c ) {
	int x=0;
	uint8_t gW, gS, gIS;
	uint8_t startChar = mh_currentFont.startChar;

	gIS = mh_currentFont.interspacePixels;
	gS = mh_currentFont.spacePixels;

	if( c > ' ') {
		gW = pgm_read_byte( &mh_currentFont.charInfo[ c - startChar  ].widthBits );
		x = x + gW + gIS;
	} else x=gS+gIS;


	return x;
}

int mh_text_len( char *s ) {

	int x=0;
	uint8_t gW, gS, gIS;
	uint8_t startChar = mh_currentFont.startChar;

	gIS = mh_currentFont.interspacePixels;
	gS = mh_currentFont.spacePixels;

	while( *s ) {
		if( *s > ' ') {
			gW = pgm_read_byte( &mh_currentFont.charInfo[ *s - startChar  ].widthBits );
			x = x + gW + gIS;
		} else x+=gS+gIS;
		s++;
	}

	return x;
}


int mh_text_len_P( const char *s ) {

	char c;
	int x=0;
	uint8_t gW, gS, gIS;
	uint8_t startChar = mh_currentFont.startChar;

	gIS = mh_currentFont.interspacePixels;
	gS = mh_currentFont.spacePixels;

	while( (c=pgm_read_byte(s)) ) {
		if( c > ' ') {
			gW = pgm_read_byte( &mh_currentFont.charInfo[ c - startChar  ].widthBits );
			x = x + gW + gIS;
		} else x+=gS+gIS;
		s++;
	}

	return x;
}


#endif		// #if USE_GLCD_CNT > 0












