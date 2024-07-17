module CSR_decoder(index_pointer, data, row, indexed_data, clk, rst, read, write, enable, nz_count);
    input [8 * 17 - 1 : 0] index_pointer;
    input [7:0] data;
    input [3:0] row;
    input [7:0] nz_count;
    input clk, rst, enable;
    output reg read, write;
    output [4 + 4 + 8 - 1 : 0] indexed_data;
    
    localparam SET = 0;
    localparam INDEX_SET = 1;
    localparam DATA_SET = 2;
    localparam DATA_OUT = 3;
    
    wire [7 : 0] index_point[0:15];
    reg [3 : 0] column;
    reg [4 + 4 + 8 - 1 : 0] out_buf;
    reg [1 : 0] state;
    reg [7 : 0] count;
    reg [3 : 0] column_reg[0:255];
    reg [7 : 0] data_count;
    reg [3 : 0] column_count;
    reg [7 : 0] count1;

     
    always@(posedge clk) begin
        if(rst == 0) state <= SET;
        else begin
            case(state)
                SET :
                    if(enable) state <= INDEX_SET;
                    else state <= SET;
                
                INDEX_SET: begin
                    if(data_count == nz_count) state <= DATA_SET;
                    else state <= INDEX_SET;
                end
                
                DATA_SET: state <= DATA_OUT;
                
                DATA_OUT: 
                    if(count == nz_count)state <= SET;
                    else state <= DATA_SET;
                default : state<= SET;
            endcase
        end
    end

    assign index_point[0] = index_pointer[127:120];
    assign index_point[1] = index_pointer[119:112] - index_pointer[127:120];
    assign index_point[2] = index_pointer[111:104] - index_pointer[119:112];
    assign index_point[3] = index_pointer[103:96] - index_pointer[111:104];
    assign index_point[4] = index_pointer[95:88] - index_pointer[103:96];
    assign index_point[5] = index_pointer[87:80] - index_pointer[95:88];
    assign index_point[6] = index_pointer[79:72] - index_pointer[87:80];
    assign index_point[7] = index_pointer[71:64] - index_pointer[79:72];
    assign index_point[8] = index_pointer[63:56] - index_pointer[71:64];
    assign index_point[9] = index_pointer[55:48] - index_pointer[63:56];
    assign index_point[10] = index_pointer[47:40] - index_pointer[55:48];
    assign index_point[11] = index_pointer[39:32] - index_pointer[47:40];
    assign index_point[12] = index_pointer[31:24] - index_pointer[39:32];
    assign index_point[13] = index_pointer[23:16] - index_pointer[31:24];
    assign index_point[14] = index_pointer[15:8] - index_pointer[23:16];
    assign index_point[15] = index_pointer[7:0] - index_pointer[15:8];



    always@(posedge clk) begin
        case(state)
            SET : begin
                count <= 0;
                write <= 0;
                column <= 0;
                out_buf <= 0;
                read <= 0;
                data_count <= 0;
                column_count <= 0;
                column_reg[0] <= 0;
                column_reg[1] <= 0;
                column_reg[2] <= 0;
                column_reg[3] <= 0;
                column_reg[4] <= 0;
                column_reg[5] <= 0;
                column_reg[6] <= 0;
                column_reg[7] <= 0;
                column_reg[8] <= 0;
                column_reg[9] <= 0;
                column_reg[10] <= 0;
                column_reg[11] <= 0;
                column_reg[12] <= 0;
                column_reg[13] <= 0;
                column_reg[14] <= 0;
                column_reg[15] <= 0;
                column_reg[16] <= 0;
                column_reg[17] <= 0;
                column_reg[18] <= 0;
                column_reg[19] <= 0;
                column_reg[20] <= 0;
                column_reg[21] <= 0;
                column_reg[22] <= 0;
                column_reg[23] <= 0;
                column_reg[24] <= 0;
                column_reg[25] <= 0;
                column_reg[26] <= 0;
                column_reg[27] <= 0;
                column_reg[28] <= 0;
                column_reg[29] <= 0;
                column_reg[30] <= 0;
                column_reg[31] <= 0;
                column_reg[32] <= 0;
                column_reg[33] <= 0;
                column_reg[34] <= 0;
                column_reg[35] <= 0;
                column_reg[36] <= 0;
                column_reg[37] <= 0;
                column_reg[38] <= 0;
                column_reg[39] <= 0;
                column_reg[40] <= 0;
                column_reg[41] <= 0;
                column_reg[42] <= 0;
                column_reg[43] <= 0;
                column_reg[44] <= 0;
                column_reg[45] <= 0;
                column_reg[46] <= 0;
                column_reg[47] <= 0;
                column_reg[48] <= 0;
                column_reg[49] <= 0;
                column_reg[50] <= 0;
                column_reg[51] <= 0;
                column_reg[52] <= 0;
                column_reg[53] <= 0;
                column_reg[54] <= 0;
                column_reg[55] <= 0;
                column_reg[56] <= 0;
                column_reg[57] <= 0;
                column_reg[58] <= 0;
                column_reg[59] <= 0;
                column_reg[60] <= 0;
                column_reg[61] <= 0;
                column_reg[62] <= 0;
                column_reg[63] <= 0;
                column_reg[64] <= 0;
                column_reg[65] <= 0;
                column_reg[66] <= 0;
                column_reg[67] <= 0;
                column_reg[68] <= 0;
                column_reg[69] <= 0;
                column_reg[70] <= 0;
                column_reg[71] <= 0;
                column_reg[72] <= 0;
                column_reg[73] <= 0;
                column_reg[74] <= 0;
                column_reg[75] <= 0;
                column_reg[76] <= 0;
                column_reg[77] <= 0;
                column_reg[78] <= 0;
                column_reg[79] <= 0;
                column_reg[80] <= 0;
                column_reg[81] <= 0;
                column_reg[82] <= 0;
                column_reg[83] <= 0;
                column_reg[84] <= 0;
                column_reg[85] <= 0;
                column_reg[86] <= 0;
                column_reg[87] <= 0;
                column_reg[88] <= 0;
                column_reg[89] <= 0;
                column_reg[90] <= 0;
                column_reg[91] <= 0;
                column_reg[92] <= 0;
                column_reg[93] <= 0;
                column_reg[94] <= 0;
                column_reg[95] <= 0;
                column_reg[96] <= 0;
                column_reg[97] <= 0;
                column_reg[98] <= 0;
                column_reg[99] <= 0;
                column_reg[100] <= 0;
                column_reg[101] <= 0;
                column_reg[102] <= 0;
                column_reg[103] <= 0;
                column_reg[104] <= 0;
                column_reg[105] <= 0;
                column_reg[106] <= 0;
                column_reg[107] <= 0;
                column_reg[108] <= 0;
                column_reg[109] <= 0;
                column_reg[110] <= 0;
                column_reg[111] <= 0;
                column_reg[112] <= 0;
                column_reg[113] <= 0;
                column_reg[114] <= 0;
                column_reg[115] <= 0;
                column_reg[116] <= 0;
                column_reg[117] <= 0;
                column_reg[118] <= 0;
                column_reg[119] <= 0;
                column_reg[120] <= 0;
                column_reg[121] <= 0;
                column_reg[122] <= 0;
                column_reg[123] <= 0;
                column_reg[124] <= 0;
                column_reg[125] <= 0;
                column_reg[126] <= 0;
                column_reg[127] <= 0;
                column_reg[128] <= 0;
                column_reg[129] <= 0;
                column_reg[130] <= 0;
                column_reg[131] <= 0;
                column_reg[132] <= 0;
                column_reg[133] <= 0;
                column_reg[134] <= 0;
                column_reg[135] <= 0;
                column_reg[136] <= 0;
                column_reg[137] <= 0;
                column_reg[138] <= 0;
                column_reg[139] <= 0;
                column_reg[140] <= 0;
                column_reg[141] <= 0;
                column_reg[142] <= 0;
                column_reg[143] <= 0;
                column_reg[144] <= 0;
                column_reg[145] <= 0;
                column_reg[146] <= 0;
                column_reg[147] <= 0;
                column_reg[148] <= 0;
                column_reg[149] <= 0;
                column_reg[150] <= 0;
                column_reg[151] <= 0;
                column_reg[152] <= 0;
                column_reg[153] <= 0;
                column_reg[154] <= 0;
                column_reg[155] <= 0;
                column_reg[156] <= 0;
                column_reg[157] <= 0;
                column_reg[158] <= 0;
                column_reg[159] <= 0;
                column_reg[160] <= 0;
                column_reg[161] <= 0;
                column_reg[162] <= 0;
                column_reg[163] <= 0;
                column_reg[164] <= 0;
                column_reg[165] <= 0;
                column_reg[166] <= 0;
                column_reg[167] <= 0;
                column_reg[168] <= 0;
                column_reg[169] <= 0;
                column_reg[170] <= 0;
                column_reg[171] <= 0;
                column_reg[172] <= 0;
                column_reg[173] <= 0;
                column_reg[174] <= 0;
                column_reg[175] <= 0;
                column_reg[176] <= 0;
                column_reg[177] <= 0;
                column_reg[178] <= 0;
                column_reg[179] <= 0;
                column_reg[180] <= 0;
                column_reg[181] <= 0;
                column_reg[182] <= 0;
                column_reg[183] <= 0;
                column_reg[184] <= 0;
                column_reg[185] <= 0;
                column_reg[186] <= 0;
                column_reg[187] <= 0;
                column_reg[188] <= 0;
                column_reg[189] <= 0;
                column_reg[190] <= 0;
                column_reg[191] <= 0;
                column_reg[192] <= 0;
                column_reg[193] <= 0;
                column_reg[194] <= 0;
                column_reg[195] <= 0;
                column_reg[196] <= 0;
                column_reg[197] <= 0;
                column_reg[198] <= 0;
                column_reg[199] <= 0;
                column_reg[200] <= 0;
                column_reg[201] <= 0;
                column_reg[202] <= 0;
                column_reg[203] <= 0;
                column_reg[204] <= 0;
                column_reg[205] <= 0;
                column_reg[206] <= 0;
                column_reg[207] <= 0;
                column_reg[208] <= 0;
                column_reg[209] <= 0;
                column_reg[210] <= 0;
                column_reg[211] <= 0;
                column_reg[212] <= 0;
                column_reg[213] <= 0;
                column_reg[214] <= 0;
                column_reg[215] <= 0;
                column_reg[216] <= 0;
                column_reg[217] <= 0;
                column_reg[218] <= 0;
                column_reg[219] <= 0;
                column_reg[220] <= 0;
                column_reg[221] <= 0;
                column_reg[222] <= 0;
                column_reg[223] <= 0;
                column_reg[224] <= 0;
                column_reg[225] <= 0;
                column_reg[226] <= 0;
                column_reg[227] <= 0;
                column_reg[228] <= 0;
                column_reg[229] <= 0;
                column_reg[230] <= 0;
                column_reg[231] <= 0;
                column_reg[232] <= 0;
                column_reg[233] <= 0;
                column_reg[234] <= 0;
                column_reg[235] <= 0;
                column_reg[236] <= 0;
                column_reg[237] <= 0;
                column_reg[238] <= 0;
                column_reg[239] <= 0;
                column_reg[240] <= 0;
                column_reg[241] <= 0;
                column_reg[242] <= 0;
                column_reg[243] <= 0;
                column_reg[244] <= 0;
                column_reg[245] <= 0;
                column_reg[246] <= 0;
                column_reg[247] <= 0;
                column_reg[248] <= 0;
                column_reg[249] <= 0;
                column_reg[250] <= 0;
                column_reg[251] <= 0;
                column_reg[252] <= 0;
                column_reg[253] <= 0;
                column_reg[254] <= 0;
                column_reg[255] <= 0;
                count1 <= 0;
            end
            
            INDEX_SET: begin

                if(index_point[column_count] == count1)begin
                    column_count <= column_count + 1;
                    count1 <= 0;
                end
                else begin
                    column_reg[data_count] <= column_count;
                    data_count = data_count + 1;
                    count1 = count1 + 1;
                end


            end
            
            DATA_SET: begin
                column <= column_reg[count];
                count <= count + 1;
                read <= 1;
                write <= 0;
            end
            DATA_OUT:begin
                out_buf <= {row, column, data};
                write <= 1;
                read <= 0;
            end
        endcase
    end
    
    assign indexed_data = out_buf;
endmodule
