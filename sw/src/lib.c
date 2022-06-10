#include "../inc/lib.h"

void write_ack(int value) {
	*ack_ptr = value;
}

void write_req(int value) {
	*req_ptr = value;
}

void write_rst(int value) {
	*req_ptr = value;
}

void write_valid(int value) {
	*valid_ptr = value;
}

void write_busy(int value) {
	*req_ptr = value;
}

void reset() {
	*reset_ptr = 0;
}

int is_valid() {
	return *valid_ptr;
}


int is_busy() {
	return *busy_ptr;
}

void get_data(int * array) {
	array[0] = *(output_data_ptr  + 0x00);
	array[1] = *(output_data_ptr  + 0x04);
	array[2] = *(output_data_ptr  + 0x08);
	array[3] = *(output_data_ptr  + 0x0c);
}

void write_data(const int * array) {
	*(input_data_ptr + 0x00) = array[0];
	*(input_data_ptr + 0x04) = array[1];
	*(input_data_ptr + 0x08) = array[2];
	*(input_data_ptr + 0x0c) = array[3];
}
