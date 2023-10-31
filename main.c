/*
    (c) 2023 Microchip Technology Inc. and its subsidiaries.

    Subject to your compliance with these terms, you may use Microchip software and any
    derivatives exclusively with Microchip products. It is your responsibility to comply with third party
    license terms applicable to your use of third party software (including open source software) that
    may accompany Microchip software.

    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY
    IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS
    FOR A PARTICULAR PURPOSE.

    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP
    HAS BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO
    THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL
    CLAIMS IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT
    OF FEES, IF ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS
    SOFTWARE.
*/

#include "mcc_generated_files/system/system.h"

#include <util/delay.h>

#include <string.h>

#include "MK_MAGIC_HERCULES_LIB/magic_hercules_cfg.h"

#define RX_MAX_BUFFER     ( 255 )

static volatile uint8_t receiveBuffer[RX_MAX_BUFFER + 1];
static volatile bool receiveFlag;

// Rozdzielczo?? obrazka: 8x8    8-bit color/256 color palette
const uint8_t PR[79] PROGMEM = {
    0x08, 0x00, 0x08, 0x00, // Rozdzielczo??
    0x09, 0x00, // Liczba bajtów palety = 9. Liczba kolorów = 3
    0x00, 0x00, 0x00, 0x00, 0xFE, 0x00, 0xFF, 0x00, 0xFF, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x02, 
    0x02, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x01, 0x00, 0x02, 0x00, 
    0x00, 0x01, 0x00, 0x02, 0x01, 0x00, 0x02, 0x00, 0x00, 0x01, 0x01, 0x02, 
    0x02, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x02, 0x00, 0x00, 
    0x00, 0x01, 0x00, 0x02, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 
};  

static void ReceiveHandler(void)
{
    static uint8_t rxIndex = 0;
    uint8_t rxData = USART0_Read();
    USART0_Write(rxData);
    if (receiveFlag == true) 
    {
        // Ignore all data if parsing is still in progress
        return;
    }

    if (rxIndex < RX_MAX_BUFFER)
    {
        receiveBuffer[rxIndex++] = rxData;
        if ((rxData == '\n') || (rxData == '\r'))
        {
            rxIndex = 0;
            receiveFlag = true;
        }
    }
    else
    {
        rxIndex = 0;
        receiveFlag = true;
    }
}

int main(void)
{
   SYSTEM_Initialize();

    // Initialize serial reception
    memset((void *) receiveBuffer, 0, sizeof(receiveBuffer));
    receiveFlag = false;
    USART0_RxCompleteCallbackRegister(ReceiveHandler);
    
    // Initialize Neopixel LEDs
    _delay_ms(1000);
  
    printf("\n\rPlease enter the new configuration for LEDs:\n\r");
    
    
    mh_init(0x000A0A);
    _delay_ms( 1500 );
    
    mh_glcd_init( 0, 0, 8, 8, wt_L2R, MHMAX_BRIGHT, mh_glcd_not_stacked );
	mh_glcd_activate_display(0);


	mh_glcd_set_pixel( 0,0, 0xffff00, cm_none );
	mh_glcd_set_pixel( 7,0, 0x00ff00, cm_none );
	mh_glcd_set_pixel( 0,7, 0x0044ff, cm_none );
	mh_glcd_set_pixel( 7,7, 0xff00ff, cm_none );
            
    mh_display();
	_delay_ms( 1500 );  
    
   
    while (true)
    {
        for( int i=-8; i<8; i++ ) {
			mh_glcd_bitmap( i, 0, PR );
			mh_display();
			_delay_ms( 500 );
		}
        
        for( int i=-8; i<8; i++ ) {
			mh_glcd_bitmap( 0, i, PR );
			mh_display();
			_delay_ms( 500 );
		}
        
        for( int i=8; i>-8; i-- ) {
			mh_glcd_bitmap( i, 0, PR );
			mh_display();
			_delay_ms( 500 );
		}
        
        for( int i=8; i>-8; i-- ) {
			mh_glcd_bitmap( 0, i, PR );
			mh_display();
			_delay_ms( 500 );
		}
        
        
        
        if (receiveFlag == true)
        {
            printf("\n\rGot new input string\n\r");
            printf("%s", (char *) receiveBuffer);
                       
            // Prepare the reception for a new session
            memset((void *) receiveBuffer, 0, sizeof(receiveBuffer));
            receiveFlag = false;
            printf("\n\rPlease enter the new configuration for LEDs:\n\r");
        }
    }   
}
