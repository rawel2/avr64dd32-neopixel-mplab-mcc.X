/*
 * 	 DIGITS_v1_4x8.c
 *
 * Font generated by ATNEL - SFG (part of PixelFactory)
 * http://atnel.pl/pixel-factory.html
 * (C) 2015 by Atnel. Miros�aw Karda�
 */
#include <avr/io.h>
#include <avr/pgmspace.h>

#include "mk_fonts.h"


//  Font data for DIGITS_v1_4x8


// Character bitmaps for DIGITS_v1_4x8
const uint8_t DIGITS_v1_4x8Bitmaps[] PROGMEM = {
	0x60,                                          // char .  (46)
	0x20, 0x10, 0x08, 0x04, 0x02,                      // char /  (47)
	0x7E, 0x81, 0x81, 0x7E,                           // char 0  (48)
	0x00, 0x82, 0xFF, 0x80,                           // char 1  (49)
	0xE2, 0x91, 0x91, 0x8E,                           // char 2  (50)
	0x42, 0x89, 0x89, 0x76,                           // char 3  (51)
	0x3F, 0x20, 0x20, 0xFC,                           // char 4  (52)
	0x4F, 0x89, 0x89, 0x71,                           // char 5  (53)
	0x7E, 0x89, 0x89, 0x72,                           // char 6  (54)
	0x03, 0xF1, 0x09, 0x07,                           // char 7  (55)
	0x76, 0x89, 0x89, 0x76,                           // char 8  (56)
	0x4E, 0x91, 0x91, 0x7E,                           // char 9  (57)
	0x24,                                          // char :  (58)
	0x42,                                          // char ;  (59)
};

// descriptors
const MHFONT_CHAR_INFO DIGITS_v1_4x8Descriptors[] PROGMEM = {
	{ 1,0 },	// char .  (46)
	{ 5,1 },	// char /  (47)
	{ 4,6 },	// char 0  (48)
	{ 4,10 },	// char 1  (49)
	{ 4,14 },	// char 2  (50)
	{ 4,18 },	// char 3  (51)
	{ 4,22 },	// char 4  (52)
	{ 4,26 },	// char 5  (53)
	{ 4,30 },	// char 6  (54)
	{ 4,34 },	// char 7  (55)
	{ 4,38 },	// char 8  (56)
	{ 4,42 },	// char 9  (57)
	{ 1,46 },	// char :  (58)
	{ 1,47 },	// char ;  (59)
};

// Font information
const MHFONT_INFO DIGITS_v1_4x8 PROGMEM = {
	0,	// Down Space in pixels
	8,	// Caracter height
	'.',	// Start character
	2,	// number of pixels of interspace between characters
	2,	// number of pixels of space character
	DIGITS_v1_4x8Descriptors,	// number of pixels of space character
	DIGITS_v1_4x8Bitmaps,	// number of pixels of space character
	0,	// (Pointer) Font filename saved on SD card or 0 (null) otherwise  )
	0,	// bits and byte orientation 0-T2B, 1-L2R
};
