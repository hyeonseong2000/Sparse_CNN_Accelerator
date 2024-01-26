module CSR_encoder(data_in, enable, clk, row_size, index_pointer, row, data, store, done);
    input [8* 6 * 6 - 1 : 0] data_in;
    input enable, clk;
    input [3:0] row_size;
    output [8 * 7 - 1 : 0] index_pointer;
    output [7 : 0] data;
    output [3 : 0]row;
    output reg store;
    output reg done;
    
    localparam SET = 0;
    localparam DATA_SET = 1;
    localparam DATA_COUNT = 2;
    localparam DATA_OUT = 3;
    
    reg [1 : 0] state;
    reg [7 : 0] data_reg[0 : 5][0 : 5];
    reg [3 : 0] row_count[0 : 5];
    reg [11 : 0] data_buf[0 : 5][0 : 5];
    reg [11 : 0] out_buf;
    reg [3 : 0] count;
    reg [3 : 0] index_count, column_count;
    reg [4 : 0] data_count;
    
    wire data_valid[0 : 5][0 : 5];
    wire [7 : 0] index_amount[0 : 5];
        
    always@(posedge clk)begin
        case(state)
            SET: begin
                if(enable) state <= DATA_SET;
                else state <= SET;
                done <= 0;
            end
            
            DATA_SET : begin
                data_reg[0][0] <= data_in[287:280];
                data_reg[0][1] <= data_in[279:272];
                data_reg[0][2] <= data_in[271:264];
                data_reg[0][3] <= data_in[263:256];
                data_reg[0][4] <= data_in[255:248];
                data_reg[0][5] <= data_in[247:240];
                data_reg[1][0] <= data_in[239:232];
                data_reg[1][1] <= data_in[231:224];
                data_reg[1][2] <= data_in[223:216];
                data_reg[1][3] <= data_in[215:208];
                data_reg[1][4] <= data_in[207:200];
                data_reg[1][5] <= data_in[199:192];
                data_reg[2][0] <= data_in[191:184];
                data_reg[2][1] <= data_in[183:176];
                data_reg[2][2] <= data_in[175:168];
                data_reg[2][3] <= data_in[167:160];
                data_reg[2][4] <= data_in[159:152];
                data_reg[2][5] <= data_in[151:144];
                data_reg[3][0] <= data_in[143:136];
                data_reg[3][1] <= data_in[135:128];
                data_reg[3][2] <= data_in[127:120];
                data_reg[3][3] <= data_in[119:112];
                data_reg[3][4] <= data_in[111:104];
                data_reg[3][5] <= data_in[103:96];
                data_reg[4][0] <= data_in[95:88];
                data_reg[4][1] <= data_in[87:80];
                data_reg[4][2] <= data_in[79:72];
                data_reg[4][3] <= data_in[71:64];
                data_reg[4][4] <= data_in[63:56];
                data_reg[4][5] <= data_in[55:48];
                data_reg[5][0] <= data_in[47:40];
                data_reg[5][1] <= data_in[39:32];
                data_reg[5][2] <= data_in[31:24];
                data_reg[5][3] <= data_in[23:16];
                data_reg[5][4] <= data_in[15:8];
                data_reg[5][5] <= data_in[7:0];
                state <= DATA_COUNT;
            end
            
            DATA_COUNT : begin
                if(count == row_size) state <= DATA_OUT;
                else state <= DATA_COUNT;
            end
            
            DATA_OUT : begin
                if(data_count == (index_amount[row_size - 1]))begin
                    state <= SET;
                    done <= 1;
                end
                else state <= DATA_OUT;
            end
            
            default state <= SET;
        endcase
    end
    
    assign data_valid[0][0] = (data_reg[0][0] != 0);
    assign data_valid[0][1] = (data_reg[0][1] != 0);
    assign data_valid[0][2] = (data_reg[0][2] != 0);
    assign data_valid[0][3] = (data_reg[0][3] != 0);
    assign data_valid[0][4] = (data_reg[0][4] != 0);
    assign data_valid[0][5] = (data_reg[0][5] != 0);
    assign data_valid[1][0] = (data_reg[1][0] != 0);
    assign data_valid[1][1] = (data_reg[1][1] != 0);
    assign data_valid[1][2] = (data_reg[1][2] != 0);
    assign data_valid[1][3] = (data_reg[1][3] != 0);
    assign data_valid[1][4] = (data_reg[1][4] != 0);
    assign data_valid[1][5] = (data_reg[1][5] != 0);
    assign data_valid[2][0] = (data_reg[2][0] != 0);
    assign data_valid[2][1] = (data_reg[2][1] != 0);
    assign data_valid[2][2] = (data_reg[2][2] != 0);
    assign data_valid[2][3] = (data_reg[2][3] != 0);
    assign data_valid[2][4] = (data_reg[2][4] != 0);
    assign data_valid[2][5] = (data_reg[2][5] != 0);
    assign data_valid[3][0] = (data_reg[3][0] != 0);
    assign data_valid[3][1] = (data_reg[3][1] != 0);
    assign data_valid[3][2] = (data_reg[3][2] != 0);
    assign data_valid[3][3] = (data_reg[3][3] != 0);
    assign data_valid[3][4] = (data_reg[3][4] != 0);
    assign data_valid[3][5] = (data_reg[3][5] != 0);
    assign data_valid[4][0] = (data_reg[4][0] != 0);
    assign data_valid[4][1] = (data_reg[4][1] != 0);
    assign data_valid[4][2] = (data_reg[4][2] != 0);
    assign data_valid[4][3] = (data_reg[4][3] != 0);
    assign data_valid[4][4] = (data_reg[4][4] != 0);
    assign data_valid[4][5] = (data_reg[4][5] != 0);
    assign data_valid[5][0] = (data_reg[5][0] != 0);
    assign data_valid[5][1] = (data_reg[5][1] != 0);
    assign data_valid[5][2] = (data_reg[5][2] != 0);
    assign data_valid[5][3] = (data_reg[5][3] != 0);
    assign data_valid[5][4] = (data_reg[5][4] != 0);
    assign data_valid[5][5] = (data_reg[5][5] != 0);    
    
    always@(posedge clk)begin
        case(state)
            SET : begin
                row_count[0] <= 0;
                row_count[1] <= 0;
                row_count[2] <= 0;
                row_count[3] <= 0;
                row_count[4] <= 0;
                row_count[5] <= 0;
                
                count <= 0;
                
                data_buf[0][0] <= 0;
                data_buf[0][1] <= 0;
                data_buf[0][2] <= 0;
                data_buf[0][3] <= 0;
                data_buf[0][4] <= 0;
                data_buf[0][5] <= 0;
                data_buf[1][0] <= 0;
                data_buf[1][1] <= 0;
                data_buf[1][2] <= 0;
                data_buf[1][3] <= 0;
                data_buf[1][4] <= 0;
                data_buf[1][5] <= 0;
                data_buf[2][0] <= 0;
                data_buf[2][1] <= 0;
                data_buf[2][2] <= 0;
                data_buf[2][3] <= 0;
                data_buf[2][4] <= 0;
                data_buf[2][5] <= 0;
                data_buf[3][0] <= 0;
                data_buf[3][1] <= 0;
                data_buf[3][2] <= 0;
                data_buf[3][3] <= 0;
                data_buf[3][4] <= 0;
                data_buf[3][5] <= 0;
                data_buf[4][0] <= 0;
                data_buf[4][1] <= 0;
                data_buf[4][2] <= 0;
                data_buf[4][3] <= 0;
                data_buf[4][4] <= 0;
                data_buf[4][5] <= 0;
                data_buf[5][0] <= 0;
                data_buf[5][1] <= 0;
                data_buf[5][2] <= 0;
                data_buf[5][3] <= 0;
                data_buf[5][4] <= 0;
                data_buf[5][5] <= 0;
                
                index_count <= 0;
                column_count <= 0;
                out_buf <= 0;
                
                store <= 0;
                data_count <= 0;
            end
            
            DATA_COUNT : begin
                if(data_valid[0][count] == 1) begin
                    row_count[0] <= row_count[0] + 1;
                    data_buf[0][row_count[0]] <= {data_reg[0][count], count};
                end
                else begin
                    row_count[0] <= row_count[0];
                end
                
                if(data_valid[1][count] == 1) begin
                    row_count[1] <= row_count[1] + 1;
                    data_buf[1][row_count[1]] <= {data_reg[1][count], count};
                end
                else begin
                    row_count[1] <= row_count[1];
                end
                
                if(data_valid[2][count] == 1) begin
                    row_count[2] <= row_count[2] + 1;
                    data_buf[2][row_count[2]] <= {data_reg[2][count], count};
                end
                else begin
                    row_count[2] <= row_count[2];
                end
                
                if(data_valid[3][count] == 1) begin
                    row_count[3] <= row_count[3] + 1;
                    data_buf[3][row_count[3]] <= {data_reg[3][count], count};
                end
                else begin
                    row_count[3] <= row_count[3];
                end
                
                if(data_valid[4][count] == 1) begin
                    row_count[4] <= row_count[4] + 1;
                    data_buf[4][row_count[4]] <= {data_reg[4][count], count};
                end
                else begin
                    row_count[4] <= row_count[4];
                end
                
                if(data_valid[5][count] == 1) begin
                    row_count[5] <= row_count[5] + 1;
                    data_buf[5][row_count[5]] <= {data_reg[5][count], count};
                end
                else begin
                    row_count[5] <= row_count[5];
                end
                
                count <= count + 1;
            end
            
            DATA_OUT: begin
                if(data_buf[column_count][index_count] != 0)begin
                    out_buf <= data_buf[column_count][index_count];
                    store <= 1;
                    data_count <= data_count + 1;
                    if(index_count == row_size - 1) begin
                        column_count <= column_count + 1;
                        index_count <= 0;
                    end
                    else begin
                        column_count <= column_count;
                        index_count <= index_count + 1;
                    end
                end
                else begin
                    out_buf <= 0;
                    column_count <= column_count + 1;
                    index_count <= 0;
                    if((data_valid[0][0] || data_valid[0][1] || data_valid[0][2] || data_valid[0][3] || data_valid[0][4] || data_valid[0][5] || data_valid[1][0] || data_valid[1][1] || data_valid[1][2] || data_valid[1][3] || data_valid[1][4] || data_valid[1][5] || data_valid[2][0] || data_valid[2][1] || data_valid[2][2] || data_valid[2][3] || data_valid[2][4] || data_valid[2][5] || data_valid[3][0] || data_valid[3][1] || data_valid[3][2] || data_valid[3][3] || data_valid[3][4] || data_valid[3][5] || data_valid[4][0] || data_valid[4][1] || data_valid[4][2] || data_valid[4][3] || data_valid[4][4] || data_valid[4][5] || data_valid[5][0] || data_valid[5][1] || data_valid[5][2] || data_valid[5][3] || data_valid[5][4] || data_valid[5][5]) == 0) store <= 1;
                    else store <= 0;
                end
            end
        endcase
    end
    
    assign index_amount[0] = row_count[0];
    assign index_amount[1] = row_count[0] + row_count[1];
    assign index_amount[2] = row_count[0] + row_count[1] + row_count[2];
    assign index_amount[3] = row_count[0] + row_count[1] + row_count[2] + row_count[3];
    assign index_amount[4] = row_count[0] + row_count[1] + row_count[2] + row_count[3] + row_count[4];
    assign index_amount[5] = row_count[0] + row_count[1] + row_count[2] + row_count[3] + row_count[4] + row_count[5];
    assign index_pointer = ((data_valid[0][0] || data_valid[0][1] || data_valid[0][2] || data_valid[0][3] || data_valid[0][4] || data_valid[0][5] || data_valid[1][0] || data_valid[1][1] || data_valid[1][2] || data_valid[1][3] || data_valid[1][4] || data_valid[1][5] || data_valid[2][0] || data_valid[2][1] || data_valid[2][2] || data_valid[2][3] || data_valid[2][4] || data_valid[2][5] || data_valid[3][0] || data_valid[3][1] || data_valid[3][2] || data_valid[3][3] || data_valid[3][4] || data_valid[3][5] || data_valid[4][0] || data_valid[4][1] || data_valid[4][2] || data_valid[4][3] || data_valid[4][4] || data_valid[4][5] || data_valid[5][0] || data_valid[5][1] || data_valid[5][2] || data_valid[5][3] || data_valid[5][4] || data_valid[5][5]) == 0)? 56'h01_01_01_01_01_01_01 :{8'b0, index_amount[0], index_amount[1], index_amount[2], index_amount[3], index_amount[4], index_amount[5]};
    assign data = ((data_valid[0][0] || data_valid[0][1] || data_valid[0][2] || data_valid[0][3] || data_valid[0][4] || data_valid[0][5] || data_valid[1][0] || data_valid[1][1] || data_valid[1][2] || data_valid[1][3] || data_valid[1][4] || data_valid[1][5] || data_valid[2][0] || data_valid[2][1] || data_valid[2][2] || data_valid[2][3] || data_valid[2][4] || data_valid[2][5] || data_valid[3][0] || data_valid[3][1] || data_valid[3][2] || data_valid[3][3] || data_valid[3][4] || data_valid[3][5] || data_valid[4][0] || data_valid[4][1] || data_valid[4][2] || data_valid[4][3] || data_valid[4][4] || data_valid[4][5] || data_valid[5][0] || data_valid[5][1] || data_valid[5][2] || data_valid[5][3] || data_valid[5][4] || data_valid[5][5]) == 0)? 0:out_buf[11 : 4];
    assign row = ((data_valid[0][0] || data_valid[0][1] || data_valid[0][2] || data_valid[0][3] || data_valid[0][4] || data_valid[0][5] || data_valid[1][0] || data_valid[1][1] || data_valid[1][2] || data_valid[1][3] || data_valid[1][4] || data_valid[1][5] || data_valid[2][0] || data_valid[2][1] || data_valid[2][2] || data_valid[2][3] || data_valid[2][4] || data_valid[2][5] || data_valid[3][0] || data_valid[3][1] || data_valid[3][2] || data_valid[3][3] || data_valid[3][4] || data_valid[3][5] || data_valid[4][0] || data_valid[4][1] || data_valid[4][2] || data_valid[4][3] || data_valid[4][4] || data_valid[4][5] || data_valid[5][0] || data_valid[5][1] || data_valid[5][2] || data_valid[5][3] || data_valid[5][4] || data_valid[5][5]) == 0)? 0:out_buf[3 : 0];
endmodule