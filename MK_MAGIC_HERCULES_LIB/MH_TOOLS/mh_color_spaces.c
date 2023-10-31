/*
 * color_spaces.c
 *
 *  Created on: 3 cze 2023
 *      Author: Miros³aw Kardaœ
 */


#include "../magic_hercules_cfg.h"




#if USE_MHGAMMA_COLOR_CORRECTION == 1
// ------ gamma correction = 2,2
const uint8_t mh_gamma_correction[] PROGMEM = {
	  0,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
	  1,  1,  1,  1,  1,  1,  1,  2,  2,  2,  2,  2,  2,  2,  3,  3,  3,  3,
	  3,  4,  4,  4,  4,  5,  5,  5,  5,  6,  6,  6,  6,  7,  7,  7,  8,  8,
	  8,  9,  9,  9, 10, 10, 11, 11, 11, 12, 12, 13, 13, 13, 14, 14, 15, 15,
	 16, 16, 17, 17, 18, 18, 19, 19, 20, 20, 21, 22, 22, 23, 23, 24, 25, 25,
	 26, 26, 27, 28, 28, 29, 30, 30, 31, 32, 33, 33, 34, 35, 35, 36, 37, 38,
	 39, 39, 40, 41, 42, 43, 43, 44, 45, 46, 47, 48, 49, 49, 50, 51, 52, 53,
	 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71,
	 73, 74, 75, 76, 77, 78, 79, 81, 82, 83, 84, 85, 87, 88, 89, 90, 91, 93,
	 94, 95, 97, 98, 99,100,102,103,105,106,107,109,110,111,113,114,116,117,
	119,120,121,123,124,126,127,129,130,132,133,135,137,138,140,141,143,145,
	146,148,149,151,153,154,156,158,159,161,163,165,166,168,170,172,173,175,
	177,179,181,182,184,186,188,190,192,194,196,197,199,201,203,205,207,209,
	211,213,215,217,219,221,223,225,227,229,231,234,236,238,240,242,244,246,
	248,251,253,255
};
#endif




/*
 *
 * Skalowanie wartoœci HSV:
 * H:      0-255, 0=Red, 42=Yellow, 85=Green, 128=Aqua, 171=Blue, 214=Magenta
 * S:      0-255, 0=tylko bia³a barwa, 255=pe³ne kolory
 * V:      0-255, 0=brak œwiat³a, 255=maksymalna jasnoœæ
 *
 * RETURN: color RGBW as uint32_t WRGB
 *
*/
uint32_t mh_hsv_to_rgb( uint8_t h, uint8_t s, uint8_t v ) {

	uint32_t color;
	register uint8_t r=0,g=0,b=0;


#if USE_MHRGBW == 1
	if( !s ) {
		color = (uint32_t)v<<24;
		return color;
	}
#endif

	uint16_t region, remainder, p, q, t;

    if (s == 0) r = g = b = v;
    else {
        region = h*6 / 256;
        remainder = (h*6)%256;

         p = (v * (255 - s)) / 256;
         q = (v * (255 - (s * remainder)/256)) / 256;
         t = (v * (255 - (s * (255 - remainder))/256)) / 256;

         switch (region) {

             case 0:
             	r = v; g = t; b = p;
                 break;
             case 1:
             	r = q; g = v; b = p;
                 break;
             case 2:
             	r = p; g = v; b = t;
                 break;
             case 3:
             	r = p; g = q; b = v;
                 break;
             case 4:
             	r = t; g = p; b = v;
                 break;
             case 5:
             	r = v; g = p; b = q;
                break;
         }
    }

	color = (uint32_t)r << 16;
	color |= (uint32_t)g << 8;
	color |= b;

	return color;
}
























