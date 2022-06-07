`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2022 10:28:57
// Design Name: 
// Module Name: kuznechik_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module kuznechik_module(
    input           p_clk_i,
    input           p_rst_n_i,
    input [31:0]    p_addr_i,
    input           p_sel_i,
    input           p_enable_i,
    input           p_write_i,
    input [3:0]     p_strb_i,
    input [31:0]    p_wdata_i,
    output          p_slverr_o,
    output          p_ready_o,
    output [31:0]   p_rdata_o
);

localparam RST_ADDR = 5'd0;
localparam REQ_ACK_ADDR = 5'd1;
localparam VALID_ADDR = 5'd2;
localparam BUSY_ADDR = 5'd3;
localparam INPUT_DATA_ADDR = 5'd4;
localparam OUTPUT_DATA_ADDR = 5'd20;


reg slverr;
assign p_slverr_o = slverr;

reg [31:0] data_o;
assign p_rdata_o = data_o;

reg ready;
assign p_ready_o = ready;

reg [7:0] mem[0:35];
reg [5:0] i; //counter for reset

wire kuz_reset = mem[RST_ADDR] && p_rst_n_i;
wire kuz_request = mem[REQ_ACK_ADDR] && 2'b10;
wire kuz_ack = mem[REQ_ACK_ADDR] && 2'b01;
//�� ��� ������� �� �����������
wire [127:0] kuz_data_i = {mem[INPUT_DATA_ADDR + 15],mem[INPUT_DATA_ADDR + 14],
                           mem[INPUT_DATA_ADDR + 13],mem[INPUT_DATA_ADDR + 12],
                           mem[INPUT_DATA_ADDR + 11],mem[INPUT_DATA_ADDR + 10],
                           mem[INPUT_DATA_ADDR + 9], mem[INPUT_DATA_ADDR + 8],
                           mem[INPUT_DATA_ADDR + 7], mem[INPUT_DATA_ADDR + 6],
                           mem[INPUT_DATA_ADDR + 5], mem[INPUT_DATA_ADDR + 4],
                           mem[INPUT_DATA_ADDR + 3], mem[INPUT_DATA_ADDR + 2],
                           mem[INPUT_DATA_ADDR + 1], mem[INPUT_DATA_ADDR]};
wire [127:0] kuz_data_o;
wire kuz_busy;
wire kuz_valid;

//Data output registers
always @(posedge p_clk_i) begin
    if (mem[VALID_ADDR]) begin
        mem[OUTPUT_DATA_ADDR]      <= kuz_data_o[7:0];
        mem[OUTPUT_DATA_ADDR + 1]  <= kuz_data_o[15:8];
        mem[OUTPUT_DATA_ADDR + 2]  <= kuz_data_o[23:16];
        mem[OUTPUT_DATA_ADDR + 3]  <= kuz_data_o[31:24];
        mem[OUTPUT_DATA_ADDR + 4]  <= kuz_data_o[39:32];
        mem[OUTPUT_DATA_ADDR + 5]  <= kuz_data_o[47:40];
        mem[OUTPUT_DATA_ADDR + 6]  <= kuz_data_o[55:48];
        mem[OUTPUT_DATA_ADDR + 7]  <= kuz_data_o[63:56];
        mem[OUTPUT_DATA_ADDR + 8]  <= kuz_data_o[71:64];
        mem[OUTPUT_DATA_ADDR + 9]  <= kuz_data_o[79:72];
        mem[OUTPUT_DATA_ADDR + 10] <= kuz_data_o[87:80];
        mem[OUTPUT_DATA_ADDR + 11] <= kuz_data_o[95:88];
        mem[OUTPUT_DATA_ADDR + 12] <= kuz_data_o[103:96];
        mem[OUTPUT_DATA_ADDR + 13] <= kuz_data_o[111:104];
        mem[OUTPUT_DATA_ADDR + 14] <= kuz_data_o[119:112];
        mem[OUTPUT_DATA_ADDR + 15] <= kuz_data_o[127:120];
    end
end

//Busy and valid registers
always @* begin
    mem[BUSY_ADDR] <= kuz_busy;
    mem[VALID_ADDR] <= kuz_valid;
end

kuznechik_cipher kuznechik (.clk_i(p_clk_i),
                            .resetn_i(kuz_reset),
                            .request_i(kuz_request),
                            .ack_i(kuz_ack),
                            .data_i(kuz_data_i),
                            .busy_o(kuz_busy),
                            .valid_o(kuz_valid),
                            .data_o(kuz_data_o));

//Write block
always @(posedge p_clk_i) begin
    if (!(p_rst_n_i == 0 || mem[RST_ADDR] == 0)) begin
        if (p_enable_i && p_sel_i) begin
            //Write
            if (p_write_i) begin
                ready <= 1;
                //Check write in read cells
                if (0//(p_addr_i[5:2] == 4'd0 && (p_strb_i[3] == 1'b1 || p_strb_i[2] == 1'b1)) ||
                     //p_addr_i[5:2] == 4'd5 ||
                     //p_addr_i[5:2] == 4'd6 ||
                     //p_addr_i[5:2] == 4'd7 ||
                     //p_addr_i[5:2] == 4'd8 
                   ) begin
                    slverr <= 1;
                end
                else begin
                    if (p_strb_i[3]) begin
                        mem[(p_addr_i[6:2]) + 3] <= p_wdata_i[31:24];
                    end
                    if (p_strb_i[2]) begin
                        mem[(p_addr_i[6:2]) + 2] <= p_wdata_i[23:16];
                    end
                    if (p_strb_i[1]) begin
                        mem[(p_addr_i[6:2]) + 1] <= p_wdata_i[15:8];
                    end
                    if (p_strb_i[0]) begin
                        mem[(p_addr_i[6:2])   ] <= p_wdata_i[7:0];
                    end
                end
            end
        end
    end
end

//Read block
always @(posedge p_clk_i) begin
    if (!(p_rst_n_i == 0 || mem[RST_ADDR] == 0)) begin
        if (p_enable_i && p_sel_i) begin
            if (!p_write_i) begin
                if (p_strb_i == 0) begin
                    data_o <= {mem[(p_addr_i >> 2 << 2) + 3],
                               mem[(p_addr_i >> 2 << 2) + 2],
                               mem[(p_addr_i >> 2 << 2) + 1],
                               mem[(p_addr_i >> 2 << 2)    ]
                               };
                end
                else begin
                   // slverr <= 1;
                end
            end
        end
    end
end

//Ready block
always @(posedge p_clk_i) begin
    if (p_enable_i && p_sel_i) begin
        ready <= 1;
    end
    else begin
        ready <= 0;
    end
end

//Reset block
always @(posedge p_clk_i) begin
    if (!(p_rst_n_i && mem[RST_ADDR])) begin
        for (i = 0; i < 36; i = i + 1) begin
		 if (i == RST_ADDR)
		    mem[RST_ADDR] <= 1;
		 else
               mem[i] <= 0;
        end
        ready <= 0;
        slverr <= 0;
        data_o <= 0;
        
    end
end

endmodule
