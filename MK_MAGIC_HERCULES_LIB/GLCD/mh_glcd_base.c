/*
 * mh_glcd_base.c
 *
 *  Created on: 9 cze 2023
 *      Author: Miros³aw Kardaœ
 */



#include "..\magic_hercules_cfg.h"


#if USE_MHGLCD_CNT > 0

#if USE_MHBRIGTNESS_ADJUSTMENT == 1
static uint8_t max_bright_copy;
#endif

static TMHGLCD	mh_glcd[ USE_MHGLCD_CNT ];

TMHGLCD * act_glcd_ptr = mh_glcd;

static uint8_t 	mh_glcd_display_active;


TMHVIEWPORT mh_viewport;


#if USE_MHBRIGTNESS_ADJUSTMENT == 1
void mh_glcd_set_max_bright( uint8_t bri ) {
	#if USE_MHBRIGTNESS_AS_PERCENT_VAL == 1
		if( bri > 100 ) bri = 100;
	#endif
	act_glcd_ptr->max_bright = bri;
	mh_set_max_bright( bri, 0 );

}

uint8_t mh_glcd_get_max_bright( void ) {
	return act_glcd_ptr->max_bright;
}
#endif


void mh_glcd_activate_display( uint8_t glcd_idx ) {

	act_glcd_ptr = &mh_glcd[ glcd_idx ];
	mh_origin_set( mh_glcd[ glcd_idx ].origin.x, mh_glcd[ glcd_idx ].origin.len );

#if USE_MHBRIGTNESS_ADJUSTMENT == 1
	max_bright_copy = mh_get_max_bright();
	mh_set_max_bright( mh_glcd[ glcd_idx ].max_bright, 0 );
#endif

	mh_glcd_display_active = 1;
}


void mh_glcd_deactivate_display( void ) {

	mh_glcd_viewport_reset();
#if USE_MHBRIGTNESS_ADJUSTMENT == 1
	mh_set_max_bright( max_bright_copy, 0 );
#endif
	mh_glcd_display_active = 0;
	mh_origin_clear();
}



void mh_glcd_init( uint8_t glcd_idx, size_t origin_x, size_t width, size_t height,
				 TWIRETYPE wire_type, uint8_t max_bri, TSTACK stacked ) {

	mh_glcd[ glcd_idx ].origin.x 	= origin_x;
	mh_glcd[ glcd_idx ].origin.len 	= width * height;
	mh_glcd[ glcd_idx ].width 		= width;
	mh_glcd[ glcd_idx ].height 		= height;
	mh_glcd[ glcd_idx ].wire_type	= wire_type;

#if USE_MHBRIGTNESS_AS_PERCENT_VAL == 1
	if( max_bri > 100 ) max_bri = 100;
#endif

	mh_glcd[ glcd_idx ].max_bright 	= max_bri;
	mh_glcd[ glcd_idx ].stacked 	= stacked;

	mh_glcd_activate_display( glcd_idx );
}





void mh_glcd_viewport_cls( void ) {
	mh_glcd_fillRect( mh_viewport.left, mh_viewport.top, mh_viewport.right-mh_viewport.left+1, mh_viewport.bottom-mh_viewport.top+1, 0, 0 );
}


void mh_glcd_viewport_reset( void ) {
	mh_viewport.active = 0;
	mh_viewport.left = 0;
	mh_viewport.right = act_glcd_ptr->width-1;
	mh_viewport.top = 0;
	mh_viewport.bottom = act_glcd_ptr->height-1;
}


void mh_glcd_viewport_set( int x, int y, int width, int height ) {
	mh_viewport.left = x;
	mh_viewport.right = x+width-1;
	mh_viewport.top = y;
	mh_viewport.bottom = y+height-1;
	mh_viewport.active = 1;
}



void mh_glcd_set_pixel( int x, int y, uint32_t color, TMHCOLOR_MODE mode ) {

	if( !mh_glcd_display_active ) return;

	if( !mh_viewport.active ) {
		if( x<0 || x>(act_glcd_ptr->width-1) || y<0 || y>(act_glcd_ptr->height-1)  ) return;
	} else {
		if ((x < mh_viewport.left) || (x > mh_viewport.right) || (y < mh_viewport.top) || (y > mh_viewport.bottom ))
			return;
	}

	size_t led_nr = 0;

	int ah = act_glcd_ptr->height;
	int aw = act_glcd_ptr->width;

	if( act_glcd_ptr->wire_type == wt_T2B_zigzag ) {
		if( !act_glcd_ptr->stacked ) {					// dwa lub wiêcej wyœwietlaczy po³¹czone jeden za drugim - not stacked
			if( !(x%2) ) led_nr = y + (x * ah);
			else led_nr = ( (ah-1) - y ) + (x * ah);
		} else {
			int my = y % 8;								// dwa wyœwietlacze jeden pod drugim - stacked
			int mh = ((act_glcd_ptr->height) / 8);		//
			int ah1 = act_glcd_ptr->height / mh;		//
			int ledadd = ah1 * aw;						//
			if( !(x%2) ) led_nr = my + (x * ah1);		//
			else led_nr = ( (ah1-1) - my ) + (x * ah1);	//
			if( act_glcd_ptr->height > 8 && y > 7 ) {	//
				led_nr += (ledadd * (mh-1) );			//
			}											//
		}
	}
	else if( act_glcd_ptr->wire_type == wt_T2B ) {
		if( !act_glcd_ptr->stacked ) {					// dwa lub wiêcej wyœwietlaczy po³¹czone jeden za drugim - not stacked
			led_nr = (x * ah) + y;
		} else {										// dwa wyœwietlacze jeden pod drugim - stacked
			int my = y % 8;								//
			int mh = ((act_glcd_ptr->height) / 8);		//
			int ah1 = act_glcd_ptr->height / mh;		//
			int ledadd = ah1 * aw;						//
			led_nr = (x * ah1) + my;					//
			if( act_glcd_ptr->height > 8 && y > 7 ) {	//
				led_nr += (ledadd * (mh-1) );			//
			}											//
		}
	}
	else if( act_glcd_ptr->wire_type == wt_L2R ) {
		led_nr = x + (y * aw);
	}
	else if( act_glcd_ptr->wire_type == wt_L2R_zigzag ) {
		if( (y%2) ) led_nr = ((aw-1)-x)+ (y*aw);
		else led_nr = x + (y * aw);
	}

	mh_set_pixel( led_nr , color, mode );
}





















#endif	/* #if USE_GLCD_CNT > 0 */
