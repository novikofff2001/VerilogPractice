int main()
{
//	write_rst(1);
	long ara[4] = {1,2,3,4};
//	long ara1[2] = {0,1};
	write_data(&ara);
	write_req(1);
	write_req(0);
	while(1)
	{
	    if(is_valid()) {
	        write_ack(1);
		break;
	    }

	}


	return 0;

}
