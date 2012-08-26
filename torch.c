
#include <avr/io.h>
#include <avr/eeprom.h>
#include <util/delay.h>

#define shortdelay();	asm("nop\n\t" \
"nop\n\t");

//uint16_t eepromWord __attribute__((section(".eeprom")));

/* Assumptions:
 * 	- LED connected to PORTB
 * 	- F_CPU is defined to be your cpu speed (preprocessor define)
 */

#define OFF 0x00
#define L0 0x01
#define L1 0x02
#define L2 0x04
#define L3 0x08
#define L4 0x10
#define L5 0x20
#define L6 0x40
#define L7 0x80
#define D 20 /* ms */

int main (void)
{
	/* set PORTB, PORTC, and PORTD for output*/
	DDRB = 0xFF;
	DDRC = 0xFF;
	DDRD = 0xFF;

	while (1) {
		PORTB = L0;
		_delay_ms(D);
		PORTB = L1;
		_delay_ms(D);
		PORTB = L2;
		_delay_ms(D);
		PORTB = L3;
		_delay_ms(D);
		PORTB = L4;
		_delay_ms(D);
		PORTB = L5;
		_delay_ms(D);
		PORTB = L6;
		_delay_ms(D);
		PORTB = L7;
		_delay_ms(D);
		PORTB = OFF;
		PORTC = L0;
		_delay_ms(D);
		PORTC = L1;
		_delay_ms(D);
		PORTC = L2;
		_delay_ms(D);
		PORTC = L3;
		_delay_ms(D);
		PORTC = L4;
		_delay_ms(D);
		PORTC = L5;
		_delay_ms(D);
		PORTC = OFF;
		PORTD = L0;
		_delay_ms(D);
		PORTD = L1;
		_delay_ms(D);
		PORTD = L2;
		_delay_ms(D);
		PORTD = L3;
		_delay_ms(D);
		PORTD = L4;
		_delay_ms(D);
		PORTD = L5;
		_delay_ms(D);
		PORTD = L6;
		_delay_ms(D);
		PORTD = L7;
		_delay_ms(D);
		PORTD = OFF;
	}
	return 0;
}


