/*
 * mh.h
 *
 *  Created on: 1 cze 2023
 *      Author: Miros³aw Kardaœ
 */

#ifndef MK_MAGIC_HERCULES_LIB_MH_H_
#define MK_MAGIC_HERCULES_LIB_MH_H_


#define MHMLED_BUF_SIZE			(MHMLED_CNT*sizeof(TMHRGB))			// LED buffer size in bytes ! don't change this line, use it in your code

#if USE_MHGAMMA_COLOR_CORRECTION == 1
	#define MHGAMMA(a) 		(pgm_read_byte(&mh_gamma_correction[a]))
#endif


typedef enum { 	cm_none=0x00, cm_mix=0x01, cm_add=0x02,
				cm_gradient_rgb=0x10, cm_gradient_rgb_mix=0x11, cm_gradient_rgb_add=0x12,
				cm_gradient_hsv=0x20, cm_gradient_hsv_mix=0x21, cm_gradient_hsv_add=0x22,
} TMHCOLOR_MODE;

typedef enum { wt_L2R, wt_L2R_zigzag, wt_T2B, wt_T2B_zigzag } TWIRETYPE;

typedef enum { al_left, al_center, al_right } TMHTEXTALIGN;

typedef enum { mh_glcd_not_stacked, mh_glcd_stacked } TSTACK;


typedef struct {
	int x;
	size_t len;
} TMHORIGIN;


typedef struct {
	uint32_t start;
	uint32_t end;
} TRGBGRADIENTCOLORS;

typedef struct {
	uint8_t startH;
	uint8_t startS;
	uint8_t startV;
	uint8_t endH;
	uint8_t endS;
	uint8_t endV;
} THSVGRADIENTCOLORS;



/*...........  global variables declarations  ...........................*/

extern TMHRGB mh_led_buf[];
extern uint8_t * const mh_led_buf_ptr;


extern const uint8_t mh_gamma_correction[];


extern uint8_t mh_szachownica;

extern TRGBGRADIENTCOLORS	rgb_gradient_colors;
extern THSVGRADIENTCOLORS	hsv_gradient_colors;




/* nag³ówki funkcji */


/* ........... ABSTRACT LAYER ................................ */

/*  mh.c   */
extern void mh_init( uint32_t color );
extern void mh_display( void );

extern void mh_origin_set( int x, int len );
extern void mh_origin_clear( void );


extern void mh_cls( void );
extern void mh_set_pixel( int x, uint32_t color, TMHCOLOR_MODE mode );
extern void mh_set_pixel_hsv( int x, uint8_t h, uint8_t s, uint8_t v, TMHCOLOR_MODE mode );
extern void mh_draw_line( int x, int len, uint32_t color, TMHCOLOR_MODE mode );
extern void mh_draw_line_hsv( int x, int len, uint8_t h, uint8_t s, uint8_t v, TMHCOLOR_MODE mode );

#if USE_MHBRIGTNESS_ADJUSTMENT == 1
	extern void mh_set_max_bright( uint8_t mbright, uint8_t force_now );
	extern uint8_t mh_get_max_bright( void );
#endif


/*  mh_color_spaces.c   */
extern uint32_t mh_hsv_to_rgb( uint8_t h, uint8_t s, uint8_t v);


/*  mh_gradients.c   */
extern void mh_draw_rgb_gradient(int x, int length, uint32_t startColor, uint32_t endColor, TMHCOLOR_MODE mode);
extern void mh_draw_hsv_gradient(int x, int length, uint8_t startH, uint8_t startS, uint8_t startV,
													uint8_t endH, uint8_t endS, uint8_t endV, TMHCOLOR_MODE mode);

/* mh_glcd_base.c */
extern void mh_glcd_set_pixel( int x, int y, uint32_t color, TMHCOLOR_MODE mode );

extern void mh_glcd_init( uint8_t mh_glcd_idx, size_t origin_x, size_t width, size_t height,
		 TWIRETYPE wire_type, uint8_t max_bri, TSTACK stacked );
extern void mh_glcd_activate_display( uint8_t mh_glcd_idx );
extern void mh_glcd_deactivate_display( void );


extern void mh_glcd_set_max_bright( uint8_t bri );
extern uint8_t mh_glcd_get_max_bright( void );

extern void mh_glcd_text_align( TMHTEXTALIGN align );

extern void mh_glcd_viewport_cls( void );
extern void mh_glcd_viewport_reset( void );
extern void mh_glcd_viewport_set( int x, int y, int width, int height );





/* mmh_glcd_graphics.c */

extern void mh_glcd_bitmap( int ax, int ay, const uint8_t * pic );

extern void mh_glcd_drawLine( int x0, int y0, int x1, int y1, uint32_t color, TMHCOLOR_MODE mode );
extern void mh_glcd_drawFastVLine( int x, int y, int h, uint32_t color, TMHCOLOR_MODE mode );
extern void mh_glcd_drawFastHLine(int x, int y, int w, uint32_t color, TMHCOLOR_MODE mode);
extern void mh_glcd_drawRect( int x, int y, int w, int h, uint32_t color, TMHCOLOR_MODE mode );
extern void mh_glcd_fillRect( int x, int y, int w, int h, uint32_t color, TMHCOLOR_MODE mode );
extern void mh_glcd_drawRoundRect( int x, int y, int w, int h, uint8_t r, uint32_t color, TMHCOLOR_MODE mode);
extern void mh_glcd_fillRoundRect( int x, int y, int w, int h, uint8_t r, uint32_t color, TMHCOLOR_MODE mode);
extern void mh_glcd_circle( int x, int y, uint8_t r, uint32_t color, TMHCOLOR_MODE mode );
extern void mh_glcd_fillCircle( int x, int y, uint8_t r, uint32_t color, TMHCOLOR_MODE mode );



#include "GLCD/FONTS/mk_fonts.h"

/* mk_mh_glcd_text.c */
extern void mh_setCurrentFont( const MHFONT_INFO * font );
extern void mh_glcd_locate( int x, int y );
extern uint8_t mh_char_len( char c );
extern int mh_text_len( char *s );
extern int mh_text_len_P( const char *s );
extern void mh_glcd_put_char( int x, int y, char c, uint32_t color, TMHCOLOR_MODE mode  );
extern void mh_glcd_put_char1( char c, uint32_t color, TMHCOLOR_MODE mode );
extern void mh_glcd_puts( int x, int y, char * s, uint32_t color, TMHCOLOR_MODE mode );
extern void mh_glcd_puts1( char * s, uint32_t color, TMHCOLOR_MODE mode );
extern void mh_glcd_puts_P( int x, int y, const char * s, uint32_t color, TMHCOLOR_MODE mode );
extern void mh_glcd_puts1_P( const char * s, uint32_t color, TMHCOLOR_MODE mode );
extern void mh_glcd_int( int x, int y, int32_t val, uint32_t color, TMHCOLOR_MODE mode );
extern void mh_glcd_int1( int32_t val, uint32_t color, TMHCOLOR_MODE mode );
extern void mh_glcd_hex( int x, int y, uint32_t val, uint32_t color, TMHCOLOR_MODE mode );
extern void mh_glcd_hex1( uint32_t val, uint32_t color, TMHCOLOR_MODE mode );
extern void mh_glcd_bin( int x, int y, uint32_t val, uint8_t len, uint32_t color, TMHCOLOR_MODE mode );
extern void mh_glcd_bin1( uint32_t val, uint8_t len, uint32_t color, TMHCOLOR_MODE mode );

//----------------------- podstawowe gradienty dla glcd -------------------------------------------------------------------
extern void mh_glcd_draw_HLine_gradient(int x, int y, int length, uint32_t startColor, uint32_t endColor, TMHCOLOR_MODE mode);
extern void mh_glcd_draw_VLine_gradient(int x, int y, int length, uint32_t startColor, uint32_t endColor, TMHCOLOR_MODE mode);

extern void mh_glcd_draw_HLine_gradientHSV(int x, int y, int length, uint8_t startH, uint8_t startS, uint8_t startV,
		 uint8_t endH, uint8_t endS, uint8_t endV, TMHCOLOR_MODE mode );
extern void mh_glcd_draw_VLine_gradientHSV(int x, int y, int length, uint8_t startH, uint8_t startS, uint8_t startV,
		 uint8_t endH, uint8_t endS, uint8_t endV, TMHCOLOR_MODE mode );



#endif /* MK_MAGIC_HERCULES_LIB_MH_H_ */
