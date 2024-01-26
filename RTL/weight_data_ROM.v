// ROMs Using Block RAM Resources.
// File: rams_sp_rom_1.v
//
module weight_data_ROM (clk, en, addr, dout);
    input clk;
    input en;
    input [9:0] addr;
    output [11:0] dout;

(*rom_style = "block" *) reg [11:0] data;

    always @(posedge clk) begin
        if (en)
            case(addr)
            10'b0000000000: data <= 12'b000011000010;
            10'b0000000001: data <= 12'b000110110000;
            10'b0000000010: data <= 12'b001010110011;
            10'b0000000011: data <= 12'b010010111111;
            10'b0000000100: data <= 12'b000100111000;
            10'b0000000101: data <= 12'b000010111101;
            10'b0000000110: data <= 12'b000101001000;
            10'b0000000111: data <= 12'b001110111111;
            10'b0000001000: data <= 12'b001110000001;
            10'b0000001001: data <= 12'b000101001110;
            10'b0000001010: data <= 12'b010001000000;
            10'b0000001011: data <= 12'b000000111010;
            10'b0000001100: data <= 12'b000011001010;
            10'b0000001101: data <= 12'b000110100001;
            10'b0000001110: data <= 12'b001010101000;
            10'b0000001111: data <= 12'b001110110011;
            10'b0000010000: data <= 12'b010011000010;
            10'b0000010001: data <= 12'b010010111010;
            10'b0000010010: data <= 12'b010011001001;
            10'b0000010011: data <= 12'b010000111010;
            10'b0000010100: data <= 12'b001101111111;
            10'b0000010101: data <= 12'b001010100100;
            10'b0000010110: data <= 12'b001110001101;
            10'b0000010111: data <= 12'b010010101110;
            10'b0000011000: data <= 12'b000011000011;
            10'b0000011001: data <= 12'b001101001100;
            10'b0000011010: data <= 12'b000111000111;
            10'b0000011011: data <= 12'b010001100010;
            10'b0000011100: data <= 12'b000110101100;
            10'b0000011101: data <= 12'b001010101010;
            10'b0000011110: data <= 12'b001110101001;
            10'b0000011111: data <= 12'b010010111011;
            
            10'b0000100000: data <= 12'b000111101100;
            10'b0000100001: data <= 12'b000000010101;
            10'b0000100010: data <= 12'b001011101011;
            10'b0000100011: data <= 12'b000000010101;
            10'b0000100100: data <= 12'b001011100010;
            10'b0000100101: data <= 12'b001011101011;
            10'b0000100110: data <= 12'b001111011110;
            10'b0000100111: data <= 12'b000111100111;
            10'b0000101000: data <= 12'b001111100000;
            10'b0000101001: data <= 12'b010011100001;
            10'b0000101010: data <= 12'b010011100011;
            10'b0000101011: data <= 12'b010011101010;
            10'b0000101100: data <= 12'b000011101000;
            10'b0000101101: data <= 12'b001011101011;
            10'b0000101110: data <= 12'b000000010110;
            10'b0000101111: data <= 12'b000111101010;
            10'b0000110000: data <= 12'b010011101000;
            10'b0000110001: data <= 12'b001111101100;
            10'b0000110010: data <= 12'b001111101000;
            10'b0000110011: data <= 12'b000111100111;
            10'b0000110100: data <= 12'b001111101000;
            10'b0000110101: data <= 12'b001111101000;
            10'b0000110110: data <= 12'b000011101010;
            10'b0000110111: data <= 12'b001100010101;
            10'b0000111000: data <= 12'b001000011001;
            10'b0000111001: data <= 12'b001111101010;
            10'b0000111010: data <= 12'b010011100100;
            10'b0000111011: data <= 12'b000000100011;
            10'b0000111100: data <= 12'b010000011101;
            10'b0000111101: data <= 12'b000011100100;
            10'b0000111110: data <= 12'b000111101001;
            10'b0000111111: data <= 12'b010000101111;
            10'b0001000000: data <= 12'b000111011100;
            10'b0001000001: data <= 12'b010011011100;
            10'b0001000010: data <= 12'b001000100001;
            10'b0001000011: data <= 12'b000111001110;
            10'b0001000100: data <= 12'b001101000111;
            10'b0001000101: data <= 12'b000111010000;
            10'b0001000110: data <= 12'b001011100001;
            10'b0001000111: data <= 12'b000011100111;
            10'b0001001000: data <= 12'b000111010101;
            10'b0001001001: data <= 12'b001100100110;
            10'b0001001010: data <= 12'b001000010101;
            10'b0001001011: data <= 12'b000000011001;
            10'b0001001100: data <= 12'b000100011001;
            10'b0001001101: data <= 12'b001111011100;
            10'b0001001110: data <= 12'b010011001010;
            10'b0001001111: data <= 12'b000000011100;
            10'b0001010000: data <= 12'b010011100101;
            10'b0001010001: data <= 12'b010000101011;
            10'b0001010010: data <= 12'b001000010110;
            10'b0001010011: data <= 12'b000000110111;
            10'b0001010100: data <= 12'b000001001000;
            10'b0001010101: data <= 12'b001111000110;
            10'b0001010110: data <= 12'b000000101000;
            10'b0001010111: data <= 12'b001000010110;
            10'b0001011000: data <= 12'b010011011100;
            10'b0001011001: data <= 12'b010000101011;
            10'b0001011010: data <= 12'b010000100110;
            10'b0001011011: data <= 12'b000000100100;
            10'b0001011100: data <= 12'b000101000101;
            10'b0001011101: data <= 12'b001000101110;
            10'b0001011110: data <= 12'b000000101010;
            10'b0001011111: data <= 12'b000111101011;
            10'b0001100000: data <= 12'b001111011100;
            10'b0001100001: data <= 12'b001111100000;
            10'b0001100010: data <= 12'b001100100011;
            10'b0001100011: data <= 12'b000100010100;
            10'b0001100100: data <= 12'b001011100110;
            10'b0001100101: data <= 12'b000011101011;
            10'b0001100110: data <= 12'b001011101010;
            10'b0001100111: data <= 12'b001011101000;
            10'b0001101000: data <= 12'b010000010111;
            10'b0001101001: data <= 12'b001100010101;
            10'b0001101010: data <= 12'b001011100101;
            10'b0001101011: data <= 12'b010011101010;
            10'b0001101100: data <= 12'b001011100011;
            10'b0001101101: data <= 12'b000011101010;
            10'b0001101110: data <= 12'b000111100110;
            10'b0001101111: data <= 12'b001011100010;
            10'b0001110000: data <= 12'b010011100001;
            10'b0001110001: data <= 12'b000111101100;
            10'b0001110010: data <= 12'b001011100101;
            10'b0001110011: data <= 12'b001111101001;
            10'b0001110100: data <= 12'b000111100101;
            10'b0001110101: data <= 12'b001011101011;
            10'b0001110110: data <= 12'b000011101010;
            10'b0001110111: data <= 12'b010011101011;
            10'b0001111000: data <= 12'b000011101011;
            10'b0001111001: data <= 12'b001011101011;
            10'b0001111010: data <= 12'b000111100111;
            10'b0001111011: data <= 12'b010000010101;
            10'b0001111100: data <= 12'b000111101000;
            10'b0001111101: data <= 12'b001011100111;
            10'b0001111110: data <= 12'b010011101000;
            10'b0001111111: data <= 12'b001111001100;
            10'b0010000000: data <= 12'b010011011001;
            10'b0010000001: data <= 12'b000100110010;
            10'b0010000010: data <= 12'b001000110101;
            10'b0010000011: data <= 12'b001100100101;
            10'b0010000100: data <= 12'b000011101000;
            10'b0010000101: data <= 12'b010000111000;
            10'b0010000110: data <= 12'b000100011101;
            10'b0010000111: data <= 12'b000000100111;
            10'b0010001000: data <= 12'b000100100001;
            10'b0010001001: data <= 12'b000000011001;
            10'b0010001010: data <= 12'b010011100001;
            10'b0010001011: data <= 12'b000111011000;
            10'b0010001100: data <= 12'b010000011111;
            10'b0010001101: data <= 12'b001011010111;
            10'b0010001110: data <= 12'b001111100010;
            10'b0010001111: data <= 12'b000000011111;
            10'b0010010000: data <= 12'b010000010111;
            10'b0010010001: data <= 12'b000100110011;
            10'b0010010010: data <= 12'b001000100011;
            10'b0010010011: data <= 12'b010000010111;
            10'b0010010100: data <= 12'b001111101001;
            10'b0010010101: data <= 12'b001100101001;
            10'b0010010110: data <= 12'b010000101000;
            10'b0010010111: data <= 12'b010000101110;
            10'b0010011000: data <= 12'b000011010100;
            10'b0010011001: data <= 12'b000111001111;
            10'b0010011010: data <= 12'b001111100010;
            10'b0010011011: data <= 12'b000011100100;
            10'b0010011100: data <= 12'b000111010110;
            10'b0010011101: data <= 12'b001111100110;
            10'b0010011110: data <= 12'b001000101110;
            10'b0010011111: data <= 12'b001100101011;
            10'b0010100000: data <= 12'b010000101010;
            10'b0010100001: data <= 12'b000011100110;
            10'b0010100010: data <= 12'b001100101000;
            10'b0010100011: data <= 12'b000000011101;
            10'b0010100100: data <= 12'b000100101010;
            10'b0010100101: data <= 12'b010011100100;
            10'b0010100110: data <= 12'b010000100100;
            10'b0010100111: data <= 12'b010011101000;
            10'b0010101000: data <= 12'b000100011000;
            10'b0010101001: data <= 12'b000100011110;
            10'b0010101010: data <= 12'b010000011010;
            10'b0010101011: data <= 12'b000011100101;
            10'b0010101100: data <= 12'b010011001101;
            10'b0010101101: data <= 12'b000000011111;
            10'b0010101110: data <= 12'b000000011010;
            10'b0010101111: data <= 12'b001011100110;
            10'b0010110000: data <= 12'b010000100010;
            10'b0010110001: data <= 12'b010011011101;
            10'b0010110010: data <= 12'b001100011101;
            10'b0010110011: data <= 12'b010000101110;
            10'b0010110100: data <= 12'b000011100001;
            10'b0010110101: data <= 12'b000111101010;
            10'b0010110110: data <= 12'b001011101001;
            10'b0010110111: data <= 12'b010000101101;
            10'b0010111000: data <= 12'b000011100001;
            10'b0010111001: data <= 12'b001111011111;
            10'b0010111010: data <= 12'b010011100101;
            10'b0010111011: data <= 12'b001011011110;
            10'b0010111100: data <= 12'b000100100001;
            10'b0010111101: data <= 12'b001000111100;
            10'b0010111110: data <= 12'b000000100111;
            10'b0010111111: data <= 12'b010011101010;
            10'b0011000000: data <= 12'b001100010111;
            10'b0011000001: data <= 12'b010000011001;
            10'b0011000010: data <= 12'b000011100101;
            10'b0011000011: data <= 12'b001011100110;
            10'b0011000100: data <= 12'b001111101010;
            10'b0011000101: data <= 12'b001111101011;
            10'b0011000110: data <= 12'b010000011000;
            10'b0011000111: data <= 12'b001011101010;
            10'b0011001000: data <= 12'b000100010101;
            10'b0011001001: data <= 12'b000011100101;
            10'b0011001010: data <= 12'b001111100100;
            10'b0011001011: data <= 12'b000111100111;
            10'b0011001100: data <= 12'b000011101010;
            10'b0011001101: data <= 12'b001111101001;
            10'b0011001110: data <= 12'b000011100101;
            10'b0011001111: data <= 12'b000111100010;
            10'b0011010000: data <= 12'b000000010101;
            10'b0011010001: data <= 12'b001100010110;
            10'b0011010010: data <= 12'b000000010101;
            10'b0011010011: data <= 12'b001011100011;
            10'b0011010100: data <= 12'b000111101001;
            10'b0011010101: data <= 12'b000000010101;
            10'b0011010110: data <= 12'b000100011000;
            10'b0011010111: data <= 12'b010011101010;
            10'b0011011000: data <= 12'b001111101001;
            10'b0011011001: data <= 12'b000111101000;
            10'b0011011010: data <= 12'b001011100010;
            10'b0011011011: data <= 12'b000111100111;
            10'b0011011100: data <= 12'b000111101100;
            10'b0011011101: data <= 12'b001100011101;
            10'b0011011110: data <= 12'b000100011000;
            10'b0011011111: data <= 12'b000100011000;
            10'b0011100000: data <= 12'b000011101011;
            10'b0011100001: data <= 12'b001000101000;
            10'b0011100010: data <= 12'b001100010101;
            10'b0011100011: data <= 12'b000011011111;
            10'b0011100100: data <= 12'b010000100011;
            10'b0011100101: data <= 12'b001100101011;
            10'b0011100110: data <= 12'b010000101000;
            10'b0011100111: data <= 12'b000011101000;
            10'b0011101000: data <= 12'b000111100010;
            10'b0011101001: data <= 12'b001011011110;
            10'b0011101010: data <= 12'b001111011010;
            10'b0011101011: data <= 12'b010011100010;
            10'b0011101100: data <= 12'b000011100010;
            10'b0011101101: data <= 12'b000111011000;
            10'b0011101110: data <= 12'b001111100100;
            10'b0011101111: data <= 12'b010011101011;
            10'b0011110000: data <= 12'b000100011100;
            10'b0011110001: data <= 12'b001000101110;
            10'b0011110010: data <= 12'b000011100011;
            10'b0011110011: data <= 12'b001001100110;
            10'b0011110100: data <= 12'b001000101000;
            10'b0011110101: data <= 12'b001101000000;
            10'b0011110110: data <= 12'b010001000111;
            10'b0011110111: data <= 12'b001100101010;
            10'b0011111000: data <= 12'b000011100111;
            10'b0011111001: data <= 12'b001000101000;
            10'b0011111010: data <= 12'b001111101010;
            10'b0011111011: data <= 12'b001100100111;
            10'b0011111100: data <= 12'b010000011101;
            10'b0011111101: data <= 12'b001000101000;
            10'b0011111110: data <= 12'b000100011111;
            10'b0011111111: data <= 12'b001000100010;
            10'b0100000000: data <= 12'b001100100011;
            10'b0100000001: data <= 12'b000000011011;
            10'b0100000010: data <= 12'b000100010110;
            10'b0100000011: data <= 12'b001011010010;
            10'b0100000100: data <= 12'b001111001111;
            10'b0100000101: data <= 12'b001100101010;
            10'b0100000110: data <= 12'b010000101010;
            10'b0100000111: data <= 12'b000011100101;
            10'b0100001000: data <= 12'b000011101001;
            10'b0100001001: data <= 12'b000000100100;
            10'b0100001010: data <= 12'b000100101000;
            10'b0100001011: data <= 12'b000000101100;
            10'b0100001100: data <= 12'b000100101100;
            10'b0100001101: data <= 12'b000011011101;
            10'b0100001110: data <= 12'b001000011111;
            10'b0100001111: data <= 12'b001000101010;
            10'b0100010000: data <= 12'b010000100100;
            10'b0100010001: data <= 12'b000000100001;
            10'b0100010010: data <= 12'b000100101000;
            10'b0100010011: data <= 12'b001000110111;
            10'b0100010100: data <= 12'b000100100011;
            10'b0100010101: data <= 12'b001000110011;
            10'b0100010110: data <= 12'b000000010101;
            10'b0100010111: data <= 12'b001000101011;
            10'b0100011000: data <= 12'b000000010110;
            10'b0100011001: data <= 12'b010011011101;
            10'b0100011010: data <= 12'b000011100000;
            10'b0100011011: data <= 12'b010011001100;
            10'b0100011100: data <= 12'b001100011110;
            10'b0100011101: data <= 12'b010000011001;
            10'b0100011110: data <= 12'b000011100011;
            10'b0100011111: data <= 12'b000011010110;
            10'b0100100000: data <= 12'b000111100110;
            10'b0100100001: data <= 12'b010011101010;
            10'b0100100010: data <= 12'b000111101000;
            10'b0100100011: data <= 12'b001100100110;
            10'b0100100100: data <= 12'b010000010111;
            10'b0100100101: data <= 12'b001111101010;
            10'b0100100110: data <= 12'b010011011010;
            10'b0100100111: data <= 12'b000000011010;
            10'b0100101000: data <= 12'b010011101000;
            10'b0100101001: data <= 12'b000111010101;
            10'b0100101010: data <= 12'b000011100100;
            10'b0100101011: data <= 12'b001000101101;
            10'b0100101100: data <= 12'b010000011010;
            10'b0100101101: data <= 12'b001000011010;
            10'b0100101110: data <= 12'b001111101010;
            10'b0100101111: data <= 12'b000011101000;
            10'b0100110000: data <= 12'b001000011011;
            10'b0100110001: data <= 12'b000011100000;
            10'b0100110010: data <= 12'b000111101010;
            10'b0100110011: data <= 12'b000011011110;
            10'b0100110100: data <= 12'b001000101110;
            10'b0100110101: data <= 12'b001000100100;
            10'b0100110110: data <= 12'b001000101000;
            10'b0100110111: data <= 12'b001000100100;
            10'b0100111000: data <= 12'b010011011101;
            10'b0100111001: data <= 12'b001000010111;
            10'b0100111010: data <= 12'b000111100111;
            10'b0100111011: data <= 12'b001011100000;
            10'b0100111100: data <= 12'b010011101010;
            10'b0100111101: data <= 12'b000011100101;
            10'b0100111110: data <= 12'b000111010001;
            10'b0100111111: data <= 12'b001111011001;
            10'b0101000000: data <= 12'b010011010110;
            10'b0101000001: data <= 12'b000011001111;
            10'b0101000010: data <= 12'b000111011100;
            10'b0101000011: data <= 12'b001111100010;
            10'b0101000100: data <= 12'b001000100001;
            10'b0101000101: data <= 12'b000111010111;
            10'b0101000110: data <= 12'b000011100000;
            10'b0101000111: data <= 12'b000111010110;
            10'b0101001000: data <= 12'b001011011011;
            10'b0101001001: data <= 12'b000111101010;
            10'b0101001010: data <= 12'b000011011110;
            10'b0101001011: data <= 12'b001000100110;
            10'b0101001100: data <= 12'b000100110010;
            10'b0101001101: data <= 12'b001111101010;
            10'b0101001110: data <= 12'b010011011100;
            10'b0101001111: data <= 12'b001111100110;
            10'b0101010000: data <= 12'b000100011101;
            10'b0101010001: data <= 12'b000000100111;
            10'b0101010010: data <= 12'b000100100100;
            10'b0101010011: data <= 12'b001111101010;
            10'b0101010100: data <= 12'b001011100110;
            10'b0101010101: data <= 12'b000000100000;
            10'b0101010110: data <= 12'b001000100000;
            10'b0101010111: data <= 12'b000000011110;
            10'b0101011000: data <= 12'b000111100100;
            10'b0101011001: data <= 12'b000111011001;
            10'b0101011010: data <= 12'b001011100111;
            10'b0101011011: data <= 12'b001100011101;
            10'b0101011100: data <= 12'b010000011001;
            10'b0101011101: data <= 12'b010000011001;
            10'b0101011110: data <= 12'b000011101100;
            10'b0101011111: data <= 12'b001100100011;
            10'b0101100000: data <= 12'b001011101011;
            10'b0101100001: data <= 12'b001011100100;
            10'b0101100010: data <= 12'b010011011000;
            10'b0101100011: data <= 12'b000111101001;
            10'b0101100100: data <= 12'b010000011110;
            10'b0101100101: data <= 12'b000000100110;
            10'b0101100110: data <= 12'b001100010101;
            10'b0101100111: data <= 12'b001100011111;
            10'b0101101000: data <= 12'b000111100001;
            10'b0101101001: data <= 12'b010011101000;
            10'b0101101010: data <= 12'b000011100010;
            10'b0101101011: data <= 12'b010011101010;
            10'b0101101100: data <= 12'b000100011110;
            10'b0101101101: data <= 12'b001000100101;
            10'b0101101110: data <= 12'b000000100001;
            10'b0101101111: data <= 12'b001111011101;
            10'b0101110000: data <= 12'b010011100011;
            10'b0101110001: data <= 12'b000111101011;
            10'b0101110010: data <= 12'b001011101001;
            10'b0101110011: data <= 12'b001000010111;
            10'b0101110100: data <= 12'b001100010110;
            10'b0101110101: data <= 12'b000000010110;
            10'b0101110110: data <= 12'b000111101100;
            10'b0101110111: data <= 12'b000111101000;
            10'b0101111000: data <= 12'b000100010100;
            10'b0101111001: data <= 12'b010011101001;
            10'b0101111010: data <= 12'b000100010110;
            10'b0101111011: data <= 12'b000011101001;
            10'b0101111100: data <= 12'b001011100110;
            10'b0101111101: data <= 12'b001111101100;
            10'b0101111110: data <= 12'b000011101001;
            10'b0101111111: data <= 12'b001011101001;
            10'b0110000000: data <= 12'b001111100100;
            10'b0110000001: data <= 12'b000111101100;
            10'b0110000010: data <= 12'b001111100110;
            10'b0110000011: data <= 12'b001000010100;
            10'b0110000100: data <= 12'b010011101011;
            10'b0110000101: data <= 12'b000100010101;
            10'b0110000110: data <= 12'b010011101011;
            10'b0110000111: data <= 12'b000111101000;
            10'b0110001000: data <= 12'b001011101000;
            10'b0110001001: data <= 12'b001111101000;
            10'b0110001010: data <= 12'b001011101010;
            10'b0110001011: data <= 12'b001100010110;
            10'b0110001100: data <= 12'b010000010100;
            10'b0110001101: data <= 12'b000011100111;
            10'b0110001110: data <= 12'b000100011111;
            10'b0110001111: data <= 12'b000000011101;
            10'b0110010000: data <= 12'b010000011100;
            10'b0110010001: data <= 12'b001000011100;
            10'b0110010010: data <= 12'b001100100010;
            10'b0110010011: data <= 12'b000000011000;
            10'b0110010100: data <= 12'b001011100111;
            10'b0110010101: data <= 12'b001011100101;
            10'b0110010110: data <= 12'b000100101001;
            10'b0110010111: data <= 12'b001111100010;
            10'b0110011000: data <= 12'b000100100011;
            10'b0110011001: data <= 12'b010011100000;
            10'b0110011010: data <= 12'b000000011100;
            10'b0110011011: data <= 12'b000100011111;
            10'b0110011100: data <= 12'b010011010011;
            10'b0110011101: data <= 12'b010011011110;
            10'b0110011110: data <= 12'b000111101100;
            10'b0110011111: data <= 12'b001000011000;
            10'b0110100000: data <= 12'b001100011011;
            10'b0110100001: data <= 12'b001000011000;
            10'b0110100010: data <= 12'b001000010110;
            10'b0110100011: data <= 12'b001111100000;
            10'b0110100100: data <= 12'b000100101000;
            10'b0110100101: data <= 12'b001100111001;
            10'b0110100110: data <= 12'b010000110110;
            10'b0110100111: data <= 12'b001000010110;
            10'b0110101000: data <= 12'b001100010101;
            10'b0110101001: data <= 12'b010000010111;
            10'b0110101010: data <= 12'b000000011000;
            10'b0110101011: data <= 12'b000111101010;
            10'b0110101100: data <= 12'b000011101100;
            10'b0110101101: data <= 12'b000011100111;
            10'b0110101110: data <= 12'b000111101011;
            10'b0110101111: data <= 12'b000111101010;
            10'b0110110000: data <= 12'b000000010101;
            10'b0110110001: data <= 12'b001111101010;
            10'b0110110010: data <= 12'b000000011100;
            10'b0110110011: data <= 12'b000100101011;
            10'b0110110100: data <= 12'b010000010111;
            10'b0110110101: data <= 12'b001100011111;
            10'b0110110110: data <= 12'b010011100111;
            10'b0110110111: data <= 12'b000111100100;
            10'b0110111000: data <= 12'b001011100110;
            10'b0110111001: data <= 12'b001011011001;
            10'b0110111010: data <= 12'b000100011001;
            10'b0110111011: data <= 12'b000111101001;
            10'b0110111100: data <= 12'b001100011000;
            10'b0110111101: data <= 12'b000111101001;
            10'b0110111110: data <= 12'b001111011110;
            10'b0110111111: data <= 12'b000011100100;
            10'b0111000000: data <= 12'b000011101011;
            10'b0111000001: data <= 12'b000111101011;
            10'b0111000010: data <= 12'b001011100100;
            10'b0111000011: data <= 12'b000011101000;
            10'b0111000100: data <= 12'b001011011111;
            10'b0111000101: data <= 12'b000000100110;
            10'b0111000110: data <= 12'b000111100011;
            10'b0111000111: data <= 12'b001100100000;
            10'b0111001000: data <= 12'b010000011100;
            10'b0111001001: data <= 12'b000100100111;
            10'b0111001010: data <= 12'b001000011000;
            10'b0111001011: data <= 12'b010000111011;
            10'b0111001100: data <= 12'b000011100101;
            10'b0111001101: data <= 12'b000111100100;
            10'b0111001110: data <= 12'b000011100001;
            10'b0111001111: data <= 12'b000011101010;
            10'b0111010000: data <= 12'b001111100101;
            10'b0111010001: data <= 12'b000011101011;
            10'b0111010010: data <= 12'b001011011011;
            10'b0111010011: data <= 12'b000100011010;
            10'b0111010100: data <= 12'b001000011011;
            10'b0111010101: data <= 12'b000111101011;
            10'b0111010110: data <= 12'b001011101010;
            10'b0111010111: data <= 12'b010000100001;
            10'b0111011000: data <= 12'b000111010000;
            10'b0111011001: data <= 12'b010011101011;
            10'b0111011010: data <= 12'b000000110001;
            10'b0111011011: data <= 12'b001111101010;
            10'b0111011100: data <= 12'b010011100110;
            10'b0111011101: data <= 12'b000000000000;
            10'b0111011110: data <= 12'b000011100101;
            10'b0111011111: data <= 12'b001000011011;
            10'b0111100000: data <= 12'b000100110100;
            10'b0111100001: data <= 12'b000100011011;
            10'b0111100010: data <= 12'b000100011010;
            10'b0111100011: data <= 12'b000100101010;
            10'b0111100100: data <= 12'b001000100011;
            10'b0111100101: data <= 12'b010011010110;
            10'b0111100110: data <= 12'b001100111110;
            10'b0111100111: data <= 12'b010000101101;
            10'b0111101000: data <= 12'b001000101101;
            10'b0111101001: data <= 12'b001100111011;
            10'b0111101010: data <= 12'b001011010000;
            10'b0111101011: data <= 12'b001011000001;
            10'b0111101100: data <= 12'b001111100000;
            10'b0111101101: data <= 12'b001000110001;
            10'b0111101110: data <= 12'b001100100000;
            10'b0111101111: data <= 12'b001100100101;
            10'b0111110000: data <= 12'b010000101101;
            10'b0111110001: data <= 12'b001011010000;
            10'b0111110010: data <= 12'b001111011000;
            10'b0111110011: data <= 12'b001111000110;
            10'b0111110100: data <= 12'b000011011101;
            10'b0111110101: data <= 12'b000111010110;
            10'b0111110110: data <= 12'b001011011101;
            10'b0111110111: data <= 12'b001111011100;
            10'b0111111000: data <= 12'b000011100100;
            10'b0111111001: data <= 12'b001011101010;
            10'b0111111010: data <= 12'b010000010100;
            10'b0111111011: data <= 12'b001011101010;
            10'b0111111100: data <= 12'b000111100010;
            10'b0111111101: data <= 12'b001111100111;
            10'b0111111110: data <= 12'b000111100111;
            10'b0111111111: data <= 12'b000100010110;
            10'b1000000000: data <= 12'b010011001100;
            10'b1000000001: data <= 12'b010011011100;
            10'b1000000010: data <= 12'b000011100111;
            10'b1000000011: data <= 12'b001000011101;
            10'b1000000100: data <= 12'b001000101011;
            10'b1000000101: data <= 12'b001101000100;
            10'b1000000110: data <= 12'b000111101001;
            10'b1000000111: data <= 12'b001011100111;
            10'b1000001000: data <= 12'b001100011101;
            10'b1000001001: data <= 12'b010000100011;
            10'b1000001010: data <= 12'b000100101011;
            10'b1000001011: data <= 12'b000011101000;
            10'b1000001100: data <= 12'b000111100001;
            10'b1000001101: data <= 12'b000100100100;
            10'b1000001110: data <= 12'b001111100000;
            10'b1000001111: data <= 12'b010011011111;
            10'b1000010000: data <= 12'b000000011101;
            10'b1000010001: data <= 12'b000100111100;
            10'b1000010010: data <= 12'b000001000111;
            10'b1000010011: data <= 12'b001011100001;
            10'b1000010100: data <= 12'b001100110001;
            default: data <= 0;
            endcase
    end

    assign dout = data;

endmodule