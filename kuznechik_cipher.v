

module kuznechik_cipher(
    input               clk_i,      // Тактовый сигнал
                        resetn_i,   // Синхронный сигнал сброса с активным уровнем LOW
                        request_i,  // Сигнал запроса на начало шифрования
                        ack_i,      // Сигнал подтверждения приема зашифрованных данных
                [127:0] data_i,     // Шифруемые данные

    output              busy_o,     // Сигнал, сообщающий о невозможности приёма
                                    // очередного запроса на шифрование, поскольку
                                    // модуль в процессе шифрования предыдущего
                                    // запроса
           reg          valid_o,    // Сигнал готовности зашифрованных данных
           reg  [127:0] data_o      // Зашифрованные данные
);

localparam [2:0]    IDLE = 3'd0, 
                    K_PHASE = 3'd1, 
                    S_PHASE = 3'd2, 
                    L_PHASE = 3'd3, 
                    FINISH = 3'd4;
                    
reg [127:0] key_mem [0:9];

reg [7:0] S_box_mem [0:255];

reg [7:0] L_mul_16_mem  [0:255];
reg [7:0] L_mul_32_mem  [0:255];
reg [7:0] L_mul_133_mem [0:255]; 
reg [7:0] L_mul_148_mem [0:255];
reg [7:0] L_mul_192_mem [0:255];
reg [7:0] L_mul_194_mem [0:255];
reg [7:0] L_mul_251_mem [0:255];

reg [4:0] L_counter;
reg [2:0] state;
reg [3:0] round_counter;
reg [7:0] summ;

initial begin
    $readmemh("keys.mem",key_mem );
    $readmemh("S_box.mem",S_box_mem );

    $readmemh("L_16.mem", L_mul_16_mem );
    $readmemh("L_32.mem", L_mul_32_mem );
    $readmemh("L_133.mem",L_mul_133_mem);
    $readmemh("L_148.mem",L_mul_148_mem);
    $readmemh("L_192.mem",L_mul_192_mem);
    $readmemh("L_194.mem",L_mul_194_mem);
    $readmemh("L_251.mem",L_mul_251_mem);
end

assign busy_o = !(state == IDLE || state == FINISH);



//�����
always @(posedge clk_i) begin
    if (!resetn_i) begin
        L_counter <= 0;
        state <= IDLE;
        round_counter <= 0;
        summ <= 0;
        data_o <= 0;
        valid_o <= 0;
    end
end
 
//���������� ����������
always @(posedge clk_i) begin
    if (resetn_i) begin
        case (state)
            IDLE: begin
                if (request_i) begin
                    data_o <= data_i;
                    state <= K_PHASE;
                end
            end
            K_PHASE: begin
                begin
                    if (round_counter == 4'd9) begin
                        valid_o <= 1'b1;
                        round_counter <= 0;
                        state <= FINISH;
                    end
                    else
                        state <= S_PHASE;
                end
            end
            S_PHASE: begin
                state <= L_PHASE;
            end
            L_PHASE: begin
                if (L_counter == 5'd15) begin
                    L_counter <= 0;
                    state <= K_PHASE;
                    round_counter <= round_counter + 1'b1;
                    summ <= 0;
                end
                else
                    L_counter <= L_counter + 1;
            end
            FINISH: begin
                if (request_i) begin
                    data_o <= data_i;
                    state <= K_PHASE;
                    valid_o <= 1'b0;
                end
                else begin
                    if (ack_i) begin
                        state <= IDLE;
                        valid_o <= 1'b0;
                    end
                end
            end
        endcase
    end
end

//Key phase
always @(posedge clk_i) begin
    if (resetn_i) begin
        if (state == K_PHASE) begin
            data_o <= data_o ^ key_mem[round_counter];
        end
    end
end

//S phase
always @(posedge clk_i) begin
    if (resetn_i) begin
        if (state == S_PHASE) begin
            data_o[127:120] <= S_box_mem[data_o[127:120]];
            data_o[119:112] <= S_box_mem [data_o[119:112]];
            data_o[111:104] <= S_box_mem[data_o[111:104]];
            data_o[103:96]  <= S_box_mem[data_o[103:96]];
            data_o[95:88]   <= S_box_mem[data_o[95:88]];
            data_o[87:80]   <= S_box_mem[data_o[87:80]];
            data_o[79:72]   <= S_box_mem[data_o[79:72]];
            data_o[71:64]   <= S_box_mem[data_o[71:64]];
            data_o[63:56]   <= S_box_mem[data_o[63:56]];
            data_o[55:48]   <= S_box_mem[data_o[55:48]];
            data_o[47:40]   <= S_box_mem[data_o[47:40]];
            data_o[39:32]   <= S_box_mem[data_o[39:32]];
            data_o[31:24]   <= S_box_mem[data_o[31:24]];
            data_o[23:16]   <= S_box_mem[data_o[23:16]];
            data_o[15:8]    <= S_box_mem[data_o[15:8]];
            data_o[7:0]     <= S_box_mem[data_o[7:0]];
        end
    end
end

//L phase
always @(posedge clk_i) begin
    if (resetn_i) begin
        if (state == L_PHASE) begin
            summ = summ ^ L_mul_148_mem[data_o[127:120]];
            summ = summ ^ L_mul_32_mem [data_o[119:112]];
            summ = summ ^ L_mul_133_mem[data_o[111:104]];
            summ = summ ^ L_mul_16_mem [data_o[103:96]];
            summ = summ ^ L_mul_194_mem[data_o[95:88]];
            summ = summ ^ L_mul_192_mem[data_o[87:80]];
            summ = summ ^               data_o[79:72];
            summ = summ ^ L_mul_251_mem[data_o[71:64]];
            summ = summ ^               data_o[63:56];
            summ = summ ^ L_mul_192_mem[data_o[55:48]];
            summ = summ ^ L_mul_194_mem[data_o[47:40]];
            summ = summ ^ L_mul_16_mem [data_o[39:32]];
            summ = summ ^ L_mul_133_mem[data_o[31:24]];
            summ = summ ^ L_mul_32_mem [data_o[23:16]];
            summ = summ ^ L_mul_148_mem[data_o[15:8]];
            summ = summ ^               data_o[7:0];
            data_o = data_o >> 8;
            data_o[127:120] = summ;
            summ = 0;
        end
    end
end

endmodule