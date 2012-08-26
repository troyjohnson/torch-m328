
The configuration snippet in "avrdude-atmega328-no-p.conf" is to be
added to "/etc/avrdude.conf" right after the part id "m328p".

It fixes a signature problem for the ATMega328 (no pico power) part
so that an override is not needed.

