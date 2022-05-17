    `timescale 1ns / 1ps

module tb_kuznechik_module();
    
parameter CLK_PERIOD = 1;
parameter PERIOD = 2;

reg clk;
reg rst_n;
reg [31:0] addr;
reg sel;
reg enable;
reg write;
reg [3:0] strob;
reg [31:0] wdata;
wire slverr;
wire ready;
wire [31:0] rdata;
reg [31:0] rdatatb_o;

reg [127:0] data_to_cipher;
reg [127:0] data_from_cipher;
integer i;
integer j;

kuznechik_module DUT (  .p_clk_i(clk),
                        .p_rst_n_i(rst_n),
                        .p_addr_i(addr),
                        .p_sel_i(sel),
                        .p_enable_i(enable),
                        .p_write_i(write),
                        .p_strb_i(strob),
                        .p_wdata_i(wdata),
                        .p_slverr_o(slverr),
                        .p_ready_o(ready),
                        .p_rdata_o(rdata)
                        );

initial begin
    clk <= 0;
    rst_n <= 1;
    addr <= 0;
    sel <= 0;
    enable <= 0;
    write <= 0;
    strob <= 0;
    wdata <= 0;
end

always @* begin
    while(1) begin
        #CLK_PERIOD;
        clk <= !clk;
    end
end 

task write_data(input [31:0] addr_tb, input [3:0] strb_tb, input [31:0] wdata_tb); 
begin
    sel <= 1;
    addr <= addr_tb;
    wdata <= wdata_tb;
    strob <= strb_tb;
    write <= 1;
    sel <= 1;
    #PERIOD;
    enable <= 1;
    #PERIOD;  
    enable <= 0;
    #PERIOD;
end
endtask

task read_data(input [31:0] addr_tb, output [31:0] rdata_tb); 
begin   
    sel <= 1;
    addr <= addr_tb;
    strob <= 0;
    write <= 0;
    sel <= 1;
    #PERIOD;
    enable <= 1;
    #PERIOD;  
    rdata_tb <= rdata;
    enable <= 0;
    #PERIOD;
end
endtask
initial begin
    #22;
    $stop;
end
initial begin
    //reset
    //data_to_cipher[00] <= 128'h3ee5c99f9a41c389ac17b4fe99c72ae4;
    
    rst_n <= 0;
    #5;
    rst_n <= 1;
    
    write_data(4, 4'b1111,  32'h99c72ae4);
    write_data(8, 4'b1111,  32'hac17b4fe);
    write_data(12, 4'b1111, 32'h9a41c389);
    write_data(32'h10, 4'b1111, 32'h3ee5c99f);
        
        
    write_data(0, 4'b0010, 32'b10<<8); 
    #PERIOD;
    write_data(0, 4'b0010, 32'b00<<8); 
    #PERIOD;
    read_data(0, rdatatb_o);
    while ((rdatatb_o & 32'b0000_0000_0000_0001_0000000000000000) == 0) begin
        read_data(0, rdatatb_o);
        #PERIOD;
    end
    read_data(20, rdatatb_o);
    data_from_cipher[31:0] <= rdatatb_o;
    read_data(24, rdatatb_o);
    data_from_cipher[63:32] <= rdatatb_o;
    read_data(28, rdatatb_o);
    data_from_cipher[95:64] <= rdatatb_o;
    read_data(32, rdatatb_o);
    data_from_cipher[127:96] <= rdatatb_o;
    // 4e6576657220676f6e6e612067697665 - right result
    // 4e 65 76 65 72 20 67 6f 6e 6e 61 20 67 69 76 65
    // 4e 65 76 01 72 20 67 89 6e 6e 61 fe 67 69 76 e4
    write_data(0, 4'b0010, 32'b1<<8); 
    
    $display("%s", data_from_cipher);
    
    #500;
    $finish;
end

endmodule