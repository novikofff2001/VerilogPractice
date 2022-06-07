#define FOO_H
#define BASE_ADDRESS_CHIPER 0x1A118000
#include <stdint.h>
int8_t* reset_ptr =       BASE_ADDRESS_CHIPER + 0x00;
int8_t* ack_ptr =         BASE_ADDRESS_CHIPER + 0x04;
int8_t* req_ptr =         BASE_ADDRESS_CHIPER + 0x04;
int8_t* valid_ptr =       BASE_ADDRESS_CHIPER + 0x08;
int8_t* busy_ptr =        BASE_ADDRESS_CHIPER + 0x09;
int8_t* input_data_ptr =  BASE_ADDRESS_CHIPER + 0x10;
int8_t* output_data_ptr = BASE_ADDRESS_CHIPER + 0x14;

void write_ack(int value);

void write_req(int value);

void write_rst(int value);

void write_valid(int value);

void write_busy(int value);

void reset();

int is_valid();

int is_busy();

void get_data(int * array);

void write_data(const int * array);
