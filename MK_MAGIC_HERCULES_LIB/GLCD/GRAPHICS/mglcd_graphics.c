/*
 * mlcd_graphics.c
 *
 *  Created on: 16 lis 2022
 *      Author: Miros³aw Kardaœ
 */


#include "..\..\magic_hercules_cfg.h"


#include "mglcd_graphics.h"


#if USE_MHGLCD_CNT > 0

TRGBGRADIENTCOLORS	rgb_gradient_colors;
THSVGRADIENTCOLORS  hsv_gradient_colors;



void mh_glcd_bitmap( int ax, int ay, const uint8_t * pic ) {

	uint32_t color = 0;

	const uint8_t * paleta = pic+6;

	int width = pgm_read_byte(pic) | ( pgm_read_byte(pic+1) << 8);
	pic += 2;
	int height = pgm_read_byte(pic) | ( pgm_read_byte(pic+1) << 8);
	pic += 2;

	uint16_t palette_bytes_count = pgm_read_byte(pic) | ( pgm_read_byte(pic+1) << 8);
	pic += 2;



	if( !palette_bytes_count ) {						// jeœli True Color
		for( int y=0; y<height; y++ ) {
			for( int x=0; x<width; x++ ) {
				uint8_t r = pgm_read_byte(pic++);
				uint8_t g = pgm_read_byte(pic++);
				uint8_t b = pgm_read_byte(pic++);
				color = ((uint32_t)r<<16) + ((uint32_t)g<<8) + (uint32_t)b;
				mh_glcd_set_pixel( x+ax,y+ay, color, cm_none );
			}
		}
	} else {								// jeœli Paleta 256 kolorów
		pic += palette_bytes_count;
		for( int y=0; y<height; y++ ) {
			for( int x=0; x<width; x++ ) {

				uint8_t idx = pgm_read_byte(pic++);
				uint8_t r = pgm_read_byte( (paleta+(idx*3)+0) );
				uint8_t g = pgm_read_byte( (paleta+(idx*3)+1) );
				uint8_t b = pgm_read_byte( (paleta+(idx*3)+2) );

				color = ((uint32_t)r<<16) + ((uint32_t)g<<8) + (uint32_t)b;
				mh_glcd_set_pixel( x+ax,y+ay, color, cm_none );
			}
		}
	}
}




static void mh_glcd_draw_XLine_gradient( uint8_t vertical, int x, int y, int length, uint32_t startColor, uint32_t endColor, TMHCOLOR_MODE mode) {

    // Rozdzielenie sk³adowych koloru startowego
    uint8_t startR = (startColor >> 16) & 0xFF;
    uint8_t startG = (startColor >> 8) & 0xFF;
    uint8_t startB = startColor & 0xFF;

    // Rozdzielenie sk³adowych koloru koñcowego
    uint8_t endR = (endColor >> 16) & 0xFF;
    uint8_t endG = (endColor >> 8) & 0xFF;
    uint8_t endB = endColor & 0xFF;

    // Obliczenie kroków zmiany wartoœci sk³adników R, G, B na podstawie d³ugoœci paska
    int32_t stepR = ((int32_t)endR - (int32_t)startR) * 256 / length;
    int32_t stepG = ((int32_t)endG - (int32_t)startG) * 256 / length;
    int32_t stepB = ((int32_t)endB - (int32_t)startB) * 256 / length;

    // Sprawdzenie, czy kroki s¹ ujemne dla odpowiednich sk³adowych
    uint8_t reverseR = (stepR < 0) ? 1 : 0;
    uint8_t reverseG = (stepG < 0) ? 1 : 0;
    uint8_t reverseB = (stepB < 0) ? 1 : 0;

    // Jeœli kroki s¹ ujemne, odwracamy kierunek gradientu
    if(reverseR) stepR = -stepR;
    if(reverseG) stepG = -stepG;
    if(reverseB) stepB = -stepB;

    // Rysowanie gradientu piksel po pikselu
    for (int i = 0; i < length; i++) {
        // Obliczenie aktualnych wartoœci sk³adników R, G, B
        uint8_t currentR = startR + (stepR * i / 256);
        uint8_t currentG = startG + (stepG * i / 256);
        uint8_t currentB = startB + (stepB * i / 256);

        // Jeœli kroki s¹ ujemne, odwracamy kolor
        if (reverseR) currentR = startR - (stepR * i / 256);
        if (reverseG) currentG = startG - (stepG * i / 256);
        if (reverseB) currentB = startB - (stepB * i / 256);

        // Rysowanie piksela o obliczonym kolorze
        uint32_t color = ((uint32_t)currentR << 16) | ((uint32_t)currentG << 8) | currentB;

        if( !mh_szachownica ) {
			if( !vertical ) mh_glcd_set_pixel(x + i, y, color, mode);	// horizontal
			else mh_glcd_set_pixel(x, y + i, color, mode);				// vertical
        }
        else if( mh_szachownica && !(i%mh_szachownica) ) {
			if( !vertical ) mh_glcd_set_pixel(x + i, y, color, mode);	// horizontal
			else mh_glcd_set_pixel(x, y + i, color, mode);				// vertical
        }
    }
}


void mh_glcd_draw_HLine_gradient(int x, int y, int length, uint32_t startColor, uint32_t endColor, TMHCOLOR_MODE mode) {

	mh_glcd_draw_XLine_gradient( 0, x, y, length, startColor, endColor, mode );
}



void mh_glcd_draw_VLine_gradient(int x, int y, int length, uint32_t startColor, uint32_t endColor, TMHCOLOR_MODE mode) {

	mh_glcd_draw_XLine_gradient( 1, x, y, length, startColor, endColor, mode );
}




static void mh_draw_XLine_gradientHSV( uint8_t vertical, int x, int y, int length, uint8_t startH, uint8_t startS, uint8_t startV,
											 uint8_t endH, uint8_t endS, uint8_t endV, TMHCOLOR_MODE mode ) {

    uint8_t swapH = 0, swapS = 0, swapV = 0;

    // Sprawdzenie, czy kolor pocz¹tkowy jest wiêkszy ni¿ kolor koñcowy dla sk³adników H, S, V
    if (startH > endH) {
        swapH = 1;
        uint8_t tempH = startH;
        startH = endH;
        endH = tempH;
    }
    if (startS > endS) {
        swapS = 1;
        uint8_t tempS = startS;
        startS = endS;
        endS = tempS;
    }
    if (startV > endV) {
        swapV = 1;
        uint8_t tempV = startV;
        startV = endV;
        endV = tempV;
    }

    // Obliczenie kroków zmiany wartoœci sk³adników H, S, V na podstawie d³ugoœci paska
    int16_t stepH = ((int32_t)endH - (int32_t)startH) * 256 / length;
    int16_t stepS = ((int32_t)endS - (int32_t)startS) * 256 / length;
    int16_t stepV = ((int32_t)endV - (int32_t)startV) * 256 / length;

    // Rysowanie gradientu piksel po pikselu
    for (int i = 0; i < length; i++) {
        // Obliczenie aktualnych wartoœci sk³adników H, S, V
        uint8_t currentH = startH + (stepH * i >> 8);
        uint8_t currentS = startS + (stepS * i >> 8);
        uint8_t currentV = startV + (stepV * i >> 8);

        // Odwrócenie gradientu, jeœli kolor pocz¹tkowy jest wiêkszy od koñcowego
        if (swapH) currentH = endH - (stepH * i >> 8);
        if (swapS) currentS = endS - (stepS * i >> 8);
        if (swapV) currentV = endV - (stepV * i >> 8);


        // Rysowanie piksela o obliczonym kolorze w przestrzeni HSV
        uint32_t color = mh_hsv_to_rgb(currentH, currentS, currentV);

        if( !mh_szachownica ) {
			if( !vertical ) mh_glcd_set_pixel(x + i, y, color, mode);	// horizontal
			else mh_glcd_set_pixel(x, y + i, color, mode);				// vertical
        }
        else if( mh_szachownica && !(i%mh_szachownica) ) {
			if( !vertical ) mh_glcd_set_pixel(x + i, y, color, mode);	// horizontal
			else mh_glcd_set_pixel(x, y + i, color, mode);				// vertical
        }
    }
}



void mh_glcd_draw_HLine_gradientHSV(int x, int y, int length, uint8_t startH, uint8_t startS, uint8_t startV,
		 uint8_t endH, uint8_t endS, uint8_t endV, TMHCOLOR_MODE mode ) {

	mh_draw_XLine_gradientHSV( 0, x,y, length, startH,startS,startV, endH,endS,endV, mode );
}



void mh_glcd_draw_VLine_gradientHSV(int x, int y, int length, uint8_t startH, uint8_t startS, uint8_t startV,
		 uint8_t endH, uint8_t endS, uint8_t endV, TMHCOLOR_MODE mode ) {

	mh_draw_XLine_gradientHSV( 1, x,y, length, startH,startS,startV, endH,endS,endV, mode );
}



// Bresenham's algorithm - thx wikpedia
void mh_glcd_drawLine( int x0, int y0, int x1, int y1, uint32_t color, TMHCOLOR_MODE mode ) {

	if( !mh_szachownica ) {
	   int dx =  abs(x1-x0), sx = x0<x1 ? 1 : -1;
	   int dy = -abs(y1-y0), sy = y0<y1 ? 1 : -1;
	   int err = dx+dy, e2; /* error value e_xy */

	   for(;;){  /* loop */
		   mh_glcd_set_pixel(x0,y0,color,mode);
	      if (x0==x1 && y0==y1) break;
	      e2 = 2*err;
	      if (e2 >= dy) { err += dy; x0 += sx; } /* e_xy+e_x > 0 */
	      if (e2 <= dx) { err += dx; y0 += sy; } /* e_xy+e_y < 0 */
	   }
	} else {

		int steep = abs(y1 - y0) > abs(x1 - x0);
		if (steep) {
			swap(x0, y0);
			swap(x1, y1);
		}

		if (x0 > x1) {
			swap(x0, x1);
			swap(y0, y1);
		}

		int dx, dy;
		dx = x1 - x0;
		dy = abs(y1 - y0);

		int err = dx / 2;
		int ystep;

		if (y0 < y1) {
			ystep = 1;
		} else {
			ystep = -1;
		}

		for (; x0 <= x1; x0++) {
			// xxx
			if( 0 == mh_szachownica ) {
				if (steep) {
					mh_glcd_set_pixel(y0, x0, color,mode);
				} else {
					mh_glcd_set_pixel(x0, y0, color,mode);
				}
			} else
			if( (mh_szachownica == 0x01) ) {
				if( !(x0%2) ) {
					if (steep) {
						mh_glcd_set_pixel(y0, x0, color,mode);
					} else {
						mh_glcd_set_pixel(x0, y0, color,mode);
					}
				}
			} else
			if( (mh_szachownica == 0x02) ) {
				if( (x0%2) ) {
					if (steep) {
						mh_glcd_set_pixel(y0, x0, color,mode);
					} else {
						mh_glcd_set_pixel(x0, y0, color,mode);
					}
				}
			}

			else if( (mh_szachownica > 3) ) {
				uint8_t ax = (mh_szachownica/2)-1;
				if( (x0%mh_szachownica)<ax ) {
					if (steep) {
						mh_glcd_set_pixel(y0, x0, color,mode);
					} else {
						mh_glcd_set_pixel(x0, y0, color,mode);
					}
				}
			}

			err -= dy;
			if (err < 0) {
				y0 += ystep;
				err += dx;
			}
		}

	}

}




void mh_glcd_drawFastVLine( int x, int y, int h, uint32_t color, TMHCOLOR_MODE mode ) {

	if( !(mode & 0xF0) ) mh_glcd_drawLine(x, y, x, y+h-1, color, mode);
	else if( (mode & 0x10) ) mh_glcd_draw_VLine_gradient( x, y, h, rgb_gradient_colors.start, rgb_gradient_colors.end, mode & 0x0F );
	else if( (mode & 0x20) ) mh_glcd_draw_VLine_gradientHSV( x, y, h, 	hsv_gradient_colors.startH,
																	hsv_gradient_colors.startS,
																	hsv_gradient_colors.startV,
																	hsv_gradient_colors.endH,
																	hsv_gradient_colors.endS,
																	hsv_gradient_colors.endV,
																	mode & 0x0F );

}

void mh_glcd_drawFastHLine(int x, int y, int w, uint32_t color, TMHCOLOR_MODE mode) {

	if( !(mode & 0xF0) ) mh_glcd_drawLine(x, y, x+w-1, y, color, mode);
	else if( (mode & 0x10) ) mh_glcd_draw_HLine_gradient( x, y, w, rgb_gradient_colors.start, rgb_gradient_colors.end, mode & 0x0F );
	else if( (mode & 0x20) ) mh_glcd_draw_HLine_gradientHSV( x, y, w, 	hsv_gradient_colors.startH,
																	hsv_gradient_colors.startS,
																	hsv_gradient_colors.startV,
																	hsv_gradient_colors.endH,
																	hsv_gradient_colors.endS,
																	hsv_gradient_colors.endV,
																	mode & 0x0F );

}


void mh_glcd_drawRect( int x, int y, int w, int h, uint32_t color, TMHCOLOR_MODE mode ) {

	h -= 1;

	mh_glcd_drawFastHLine(x, y, w, color, mode);
	mh_glcd_drawFastHLine(x, y+h, w, color, mode);

	mh_glcd_drawFastVLine(x, y, h, color, mode);
	mh_glcd_drawFastVLine(x+w-1, y, h, color, mode);

}



void mh_glcd_fillRect( int x, int y, int w, int h, uint32_t color, TMHCOLOR_MODE mode ) {

	uint8_t am = mh_szachownica;
	if( 3 == mode ) mh_szachownica = 2;

	for( int ay = y; ay<y+h; ay++ ) {
		mh_glcd_drawFastHLine(x, ay, w, color, mode);
	 }
	mh_szachownica = am;
}




static void mh_glcd_drawCircleHelper( int x0, int y0, int8_t r, uint8_t cornername, uint32_t color, TMHCOLOR_MODE mode) {
	int f     = 1 - r;
	int ddF_x = 1;
	int ddF_y = -2 * r;
	int x     = 0;
	int y     = r;

  while (x<y) {
    if (f >= 0) {
      y--;
      ddF_y += 2;
      f     += ddF_y;
    }
    x++;
    ddF_x += 2;
    f     += ddF_x;
    if (cornername & 0x4) {
    	mh_glcd_set_pixel(x0 + x, y0 + y, color, mode);
    	mh_glcd_set_pixel(x0 + y, y0 + x, color, mode);
    }
    if (cornername & 0x2) {
    	mh_glcd_set_pixel(x0 + x, y0 - y, color, mode);
    	mh_glcd_set_pixel(x0 + y, y0 - x, color, mode);
    }
    if (cornername & 0x8) {
    	mh_glcd_set_pixel(x0 - y, y0 + x, color, mode);
    	mh_glcd_set_pixel(x0 - x, y0 + y, color, mode);
    }
    if (cornername & 0x1) {
    	mh_glcd_set_pixel(x0 - y, y0 - x, color, mode);
    	mh_glcd_set_pixel(x0 - x, y0 - y, color, mode);
    }
  }
}


// Used to do circles and roundrects
static void mh_glcd_fillCircleHelper( int x0, int y0, int r, uint8_t cornername, int delta, uint32_t color, TMHCOLOR_MODE mode ) {

	int f     = 1 - r;
	int ddF_x = 1;
	int ddF_y = -2 * r;
	int x     = 0;
	int y     = r;

  while (x<y) {
    if (f >= 0) {
      y--;
      ddF_y += 2;
      f     += ddF_y;
    }
    x++;
    ddF_x += 2;
    f     += ddF_x;

    if (cornername & 0x1) {
    	mh_glcd_drawFastVLine(x0+x, y0-y, 2*y+1+delta, color, mode);
    	mh_glcd_drawFastVLine(x0+y, y0-x, 2*x+1+delta, color, mode);
    }
    if (cornername & 0x2) {
    	mh_glcd_drawFastVLine(x0-x, y0-y, 2*y+1+delta, color, mode);
    	mh_glcd_drawFastVLine(x0-y, y0-x, 2*x+1+delta, color, mode);
    }
  }

}


void mh_glcd_fillCircle( int x, int y, uint8_t r, uint32_t color, TMHCOLOR_MODE mode ) {
	mh_glcd_drawFastVLine( x, y-r, 2*r+1, color, mode);
	mh_glcd_fillCircleHelper( x, y, r, 3, 0, color, mode);

}


void mh_glcd_fillRoundRect( int x, int y, int w, int h, uint8_t r, uint32_t color, TMHCOLOR_MODE mode) {
	mh_glcd_fillRect(x+r, y, w-2*r, h, color, mode);

	mh_glcd_fillCircleHelper(x+w-r-1, y+r, r, 1, h-2*r-1, color, mode);
	mh_glcd_fillCircleHelper(x+r    , y+r, r, 2, h-2*r-1, color, mode);
}


void mh_glcd_drawRoundRect( int x, int y, int w, int h, uint8_t r, uint32_t color, TMHCOLOR_MODE mode) {

	mh_glcd_drawFastHLine(x+r  , y    , w-2*r, color, mode);
	mh_glcd_drawFastHLine(x+r  , y+h-1, w-2*r, color, mode);
	mh_glcd_drawFastVLine(x    , y+r  , h-2*r, color, mode);
	mh_glcd_drawFastVLine(x+w-1, y+r  , h-2*r, color, mode);

	mh_glcd_drawCircleHelper(x+r    , y+r    , r, 1, color, mode);
	mh_glcd_drawCircleHelper(x+w-r-1, y+r    , r, 2, color, mode);
	mh_glcd_drawCircleHelper(x+w-r-1, y+h-r-1, r, 4, color, mode);
	mh_glcd_drawCircleHelper(x+r    , y+h-r-1, r, 8, color, mode);

}



void mh_glcd_circle( int x, int y, uint8_t r, uint32_t color, TMHCOLOR_MODE mode ) {
	int f = 1 - r;
	int ddF_x = 1;
	int ddF_y = -2 * r;
	int xa = 0;
	int ya = r;

	mh_glcd_set_pixel(x, y + r, color, mode);
	mh_glcd_set_pixel(x, y - r, color, mode);
	mh_glcd_set_pixel(x + r, y, color, mode);
	mh_glcd_set_pixel(x - r, y, color, mode);

	while (xa < ya) {
		if (f >= 0) {
			ya--;
			ddF_y += 2;
			f += ddF_y;
		}
		xa++;
		ddF_x += 2;
		f += ddF_x;

		mh_glcd_set_pixel(x + xa, y + ya, color, mode);
		mh_glcd_set_pixel(x - xa, y + ya, color, mode);
		mh_glcd_set_pixel(x + xa, y - ya, color, mode);
		mh_glcd_set_pixel(x - xa, y - ya, color, mode);
		mh_glcd_set_pixel(x + ya, y + xa, color, mode);
		mh_glcd_set_pixel(x - ya, y + xa, color, mode);
		mh_glcd_set_pixel(x + ya, y - xa, color, mode);
		mh_glcd_set_pixel(x - ya, y - xa, color, mode);
  }

}


#endif 	// #if USE_GLCD_CNT > 0
