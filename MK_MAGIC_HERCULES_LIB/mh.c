/*
 * mh.c		- warstwa ABSTRAKCYJNA biblioteki
 *
 *  Created on: 1 cze 2023
 *      Author: Miros³aw Kardaœ
 */
#include "../mcc_generated_files/system/system.h"

#include <util/delay.h>
#include <string.h>

#include "magic_hercules_cfg.h"

#include "DRV/magic_hercules_drv.h"




static TMHORIGIN mh_origin;

TMHRGB mh_led_buf[ MHMLED_CNT ];
uint8_t * const mh_led_buf_ptr = (uint8_t*)mh_led_buf;

static uint8_t mh_can_display;



uint8_t mh_szachownica;






#if USE_MHBRIGTNESS_ADJUSTMENT == 1
	static uint8_t mh_max_bright = MHMAX_BRIGHT;
#endif



void mh_init( uint32_t color ) {

	mh_origin.x = -1;
	mh_origin.len = 0;

	mk_hercules_init( color );

}


void mh_display( void ) {

	if( !mh_can_display ) return;

	mk_hercules_display();

	mh_can_display = 0;
}

void mh_cls( void ) {


	if( mh_origin.len ) {
		memset( &mh_led_buf[ mh_origin.x ], 0, mh_origin.len * sizeof( TMHRGB ) );
	} else {
		memset( mh_led_buf, 0, MHMLED_BUF_SIZE );
	}


	mh_can_display = 1;
}


#if USE_MHBRIGTNESS_ADJUSTMENT == 1

void mh_set_max_bright( uint8_t mbright, uint8_t force_now ) {

	mh_max_bright = mbright;

	if( force_now ) {

		int ax = mh_origin.x * sizeof(TMHRGB);
		int alen = mh_origin.len * sizeof(TMHRGB);
		uint8_t * ptr = mh_led_buf_ptr+ax;

#if USE_MHBRIGTNESS_AS_PERCENT_VAL == 1
		uint16_t scale = (mh_max_bright * 255) / 100;
#endif

		for( int x=ax; x < ((ax+alen))-1; x++ ) {


#if USE_MHBRIGTNESS_AS_PERCENT_VAL == 0
			uint16_t tmp = *(ptr);
			if( tmp > mbright ) {
				*(ptr) = mbright;
			}
			ptr++;
#else
			uint8_t w = *(ptr);
			w = (w * scale)/255;
			*(ptr++) = w;
#endif
		}
		mh_can_display = 1;
		mh_display();
	}
}

uint8_t mh_get_max_bright( void ) {
	return mh_max_bright;
}

#endif


void mh_origin_set( int x, int len ) {
	mh_origin.x = x;
	if( len > (MHMLED_CNT - x) ) len = MHMLED_CNT - x;
	mh_origin.len = len;
}

void mh_origin_clear( void ) {
	mh_origin.x = -1;
	mh_origin.len = 0;
}

void mh_set_pixel( int x, uint32_t color, TMHCOLOR_MODE mode ) {

	if( mh_origin.len ) {
		x += mh_origin.x;
		int alen = mh_origin.x+mh_origin.len-1;
		if( x < mh_origin.x || x > alen ) return;
	} else {
		if( x<0 || x>(MHMLED_CNT-1) ) return;
	}

	#if USE_MHRGBW == 1
		register uint8_t w = color>>24;
	#endif
	register uint8_t r = color>>16;
	register uint8_t g = color>>8;
	register uint8_t b = color>>0;


#if USE_MHBRIGTNESS_ADJUSTMENT == 1
#if USE_MHBRIGTNESS_AS_PERCENT_VAL == 0
	#if USE_MHRGBW == 1
	if( w > mh_max_bright ) w = mh_max_bright;
	#endif
	if( r > mh_max_bright ) r = mh_max_bright;
	if( g > mh_max_bright ) g = mh_max_bright;
	if( b > mh_max_bright ) b = mh_max_bright;

#else
	if( mh_max_bright < 100 ) {
		uint16_t scale = (mh_max_bright * 255) / 100;
		#if USE_MHRGBW == 1
		w = (w * scale)/255;
		#endif
		r = (r * scale)/255;
		g = (g * scale)/255;
		b = (b * scale)/255;


//        r = (r * 20 ) >> 8 ;
//        g = (g * 20 ) >> 8 ;
//        b = (b * 20 ) >> 8 ;

	}
#endif
#endif

//xxx - do sprawdzenia proporcjonalna zmiana jasnoœci wg JacekS50 z discorda
//     trzeba jakby napisaæ jeszcze swoj¹ funkcjê do ustawiania mh_bright_value
//	 w zakresie od 0-255, ale wg Jacka:
//	 "mh_bright_value ustawiana jest na wartoœæ o 1 wiêksz¹ ni¿ argument funkcji j¹ ustawiaj¹c¹."
//#if USE_BRIGTNESS_VARIABLE == 1
//    if (mh_bright_value) {
//        #if USE_RGBW == 1
//            w = ( w * mh_bright_value ) >> 8 ;
//        #endif
//        r = (r * mh_bright_value ) >> 8 ;
//        g = (g * mh_bright_value ) >> 8 ;
//        b = (b * mh_bright_value ) >> 8 ;
//    }
//#endif

#if USE_MHGAMMA_COLOR_CORRECTION == 1
	#if USE_MHRGBW == 1
		w = MHGAMMA(w);
	#endif
	r = MHGAMMA(r);
	g = MHGAMMA(g);
	b = MHGAMMA(b);
#endif



	if( mode == cm_add ) {
		#if USE_MHRGBW == 1
		uint16_t temp_w = mh_led_buf[x].w + w;
		if( temp_w > 255 ) w = 255; else w = temp_w;
		#endif
		uint16_t temp_r, temp_g, temp_b;
		temp_r = mh_led_buf[x].r + r;
		if( temp_r > 255 ) r = 255; else r = temp_r;
		temp_g = mh_led_buf[x].g + g;
		if( temp_g > 255 ) g = 255; else g = temp_g;
		temp_b = mh_led_buf[x].b + b;
		if( temp_b > 255 ) b = 255; else b = temp_b;
	}
	else if( mode == cm_mix ) {
		#if USE_MHRGBW == 1
		w |= mh_led_buf[x].w;
		#endif
		r |= mh_led_buf[x].r;
		g |= mh_led_buf[x].g;
		b |= mh_led_buf[x].b;
	}

//#if USE_BRIGTNESS_ADJUSTMENT == 1
//#if USE_BRIGTNESS_AS_PERCENT_VAL == 0
//	#if USE_RGBW == 1
//	if( w > mh_max_bright ) w = mh_max_bright;
//	#endif
//	if( r > mh_max_bright ) r = mh_max_bright;
//	if( g > mh_max_bright ) g = mh_max_bright;
//	if( b > mh_max_bright ) b = mh_max_bright;
//
//#else
//	if( mh_max_bright < 100 ) {
//		uint16_t scale = (mh_max_bright * 255) / 100;
//		#if USE_RGBW == 1
//		w = (w * scale)/255;
//		#endif
//		r = (r * scale)/255;
//		g = (g * scale)/255;
//		b = (b * scale)/255;
//	}
//#endif
//#endif



	#if USE_MHRGBW == 1
		mh_led_buf[x].w = w;
	#endif
	mh_led_buf[x].r = r;
	mh_led_buf[x].g = g;
	mh_led_buf[x].b = b;

	mh_can_display = 1;
}




void mh_set_pixel_hsv( int x, uint8_t h, uint8_t s, uint8_t v, TMHCOLOR_MODE mode ) {

	uint32_t color = mh_hsv_to_rgb( h, s, v );

	mh_set_pixel( x, color, mode );
}






void mh_draw_line( int x, int len, uint32_t color, TMHCOLOR_MODE mode ) {

	for( int i=x; i<(x+len); i++ ) {
		mh_set_pixel( i, color, mode );
	}
}


void mh_draw_line_hsv( int x, int len, uint8_t h, uint8_t s, uint8_t v, TMHCOLOR_MODE mode ) {

	uint32_t color = mh_hsv_to_rgb( h, s, v );

	for( int i=x; i<(x+len); i++ ) {
		mh_set_pixel( i, color, mode );
	}
}










































