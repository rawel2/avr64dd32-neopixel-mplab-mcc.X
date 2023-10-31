/*
 * magic_hercules_drv.c		- warstwa FIZYCZNA biblioteki
 *
 *  Created on: 3 mar 2023
 *      Author: Miros³aw Kardaœ
 */
#include "../../mcc_generated_files/system/system.h"
#include <avr/io.h>
#include <avr/interrupt.h>
#include <stddef.h>
#include <util/delay.h>
#include "magic_hercules_drv.h"
#include "../magic_hercules_cfg.h"


// NZR Protocol
// 800 kHz
//
//			bit = 0							bit = 1
//	+-------+			|			+------------+		|
//	|		|			|			|			 |		|
//	|		|			|			|			 |		|
//	|		|			|			|			 |		|
//	|		|			|			|			 |		|
//	|		|			|			|			 |		|
//	|		+-----------+			|			 +------+
//	  400ns     850ns					850ns	   400ns
//
//  |<----1250ns------->|           |<--------1250ns--->|




void mk_hercules_init( uint32_t color ) {

	TMHRGB rstRGB;
#if USE_MHRGBW == 1
	rstRGB.w = color>>24;
#endif
	rstRGB.r = color >> 16;
	rstRGB.g = color >> 8;
	rstRGB.b = color >> 0;

	size_t rstlen;
	uint8_t *wsk;
	uint8_t i;

	// Dopiero TERAZ USTAWIAMY kolor dla liczby diod LED okreœlonej w LED_CNT
	// jeœli kolor bêdzie #000000 to gasimy wszystkie diody LED
	rstlen = 1024;
	uint8_t sreg = SREG;	// zapamiêtanie stanu przerwañ
	cli();			
    // wy³¹czenie przerwañ
    TCA0_Start();
	while( rstlen-- ) {
		i = sizeof(TMHRGB);
		wsk = (uint8_t*)&rstRGB;
        TCA0_Start();
		while( i-- ) SPI0_ByteExchange( *(wsk++) );
	}
    TCA0_Stop();
	SREG = sreg;			// przywrócenie przerwañ
	_delay_us(500);			// MAGIC LED - RESET
}









void mk_hercules_display( void ) {

	void * data = mh_led_buf_ptr;
	size_t size = MHMLED_BUF_SIZE;

	uint8_t sreg = SREG;	// zapamiêtanie stanu przerwañ
	cli();					// wy³¹czenie przerwañ
    
    TCA0_Start();
	while( size-- ) {
		uint8_t byte;
		byte = *((uint8_t*)data++);
		// mh_send_byte( byte );
        SPI0_ByteExchange(byte);

//		if( (PCIFR & (1 << PCIF3)) ) {		// reakcja na PCINT24 = PD0
//			break;
//		}

//		if( (UCSR0A & (1<<RXC0)) ) {		// reakcja na przerwanie odbiorcze UART
//			break;
//		}

//		else if( !(PIND & (1<<PD6)) ) {		// reakcja na zwarcie pinu PD6 do GND
//			break;
//		}

	}
    TCA0_Stop();
    
//	PCIFR = (1 << PCIF3);	// kasowanie sprzêtowej flagi przerwania jeœli nie jest u¿ywana procedura obs³ugi tego przerwania

	SREG = sreg;			// przywrócenie przerwañ

//	_delay_us(250);			// MAGIC LED - RESET
}








