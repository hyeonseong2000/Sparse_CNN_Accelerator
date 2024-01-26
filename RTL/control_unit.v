module control_unit(clk, reset, start, done, run_mcc, control_signal, finish, idle, state);
    input start;
    input done;
    input clk, reset;
    input run_mcc;
    
    output reg [22:0] control_signal;
    output finish;
    
    output reg idle;

    reg count;
    output reg [8:0]state;
    
    
    
    //control_signal : act_size , filter_size, reset_ram_address, reset_rom_address, reset_mcc, reset_data ,layer, channel, dimension, first_in, write_first, load_data
    always@(*)begin
      if(state == 0)begin
        idle <= 1;
      end
      else begin
        idle <= 0;
      end

    end



    always @ (posedge clk) begin
        if(reset== 0) begin
            state <= 0;
            control_signal <= 0;
        end
        else begin
            case(state)
                0: begin
                    control_signal <= 23'b10000_101_1_1_1_1_0_0000_000_1_1_0;
                    if(start)state <= 2;
                    else state <= 0;
                end
                
                //conv1 - 0
                /*1: begin
                    control_signal <= 23'b10000_101_0_0_0_0_0_0000_000_1_1_0;
                    if(done) state <= 2; // done first
                end*/
                2: begin
                    control_signal <= 23'b10000_101_0_0_0_0_0_0000_000_1_0_1; //data load
                    if(run_mcc) state <= 3;
                end
                3: begin
                    control_signal <= 23'b10000_101_1_0_0_0_0_0000_000_1_0_0;
                    if(done) state <= 4;// done <- mcc_done
                end                
                4: begin
                    control_signal <= 23'b10000_101_0_1_1_0_0_0000_000_0_0_0;
                    if(done) state <= 5;// done out <- store done + data reset in mcc module
                end
                
                //conv1 - 1
                5: begin
                    control_signal <= 23'b10000_101_0_0_1_0_0_0000_001_1_0_1; //data load
                    if(run_mcc) state <= 6;
                end                
                6: begin
                    control_signal <= 23'b10000_101_1_0_0_0_0_0000_001_1_0_0;
                    if(done) state <= 7; // done <- mcc_done
                end
                7: begin
                    control_signal <= 23'b10000_101_0_1_1_0_0_0000_001_0_0_0;
                    if(done) state <= 8;// done out <- store done + data reset in mcc module
                end
                
                //conv1 - 2
                8: begin
                    control_signal <= 23'b10000_101_0_0_0_0_0_0000_010_1_0_1; //data load
                    if(run_mcc) state <= 9;
                end                
                9: begin
                    control_signal <= 23'b10000_101_1_0_0_0_0_0000_010_1_0_0;
                    if(done) state <= 10; // done <- mcc_done
                end
                10: begin
                    control_signal <= 23'b10000_101_0_1_1_0_0_0000_010_0_0_0;
                    if(done) state <= 11;// done out <- store done + data reset in mcc module
                end
                
                //conv1 - 3
                11: begin
                    control_signal <= 23'b10000_101_0_0_0_0_0_0000_011_1_0_1; //data load
                    if(run_mcc) state <= 12;
                end                
                12: begin
                    control_signal <= 23'b10000_101_1_0_0_0_0_0000_011_1_0_0;
                    if(done) state <= 13; // done <- mcc_done
                end
                13: begin
                    control_signal <= 23'b10000_101_0_1_1_0_0_0000_011_0_0_0;
                    if(done) state <= 14;// done out <- store done + data reset in mcc module
                end

                //conv1 - 4
                14: begin
                    control_signal <= 23'b10000_101_0_0_0_0_0_0000_100_1_0_1; //data load
                    if(run_mcc) state <= 15;
                end                
                15: begin
                    control_signal <= 23'b10000_101_1_0_0_0_0_0000_100_1_0_0;
                    if(done) state <= 16; // done <- mcc_done
                end
                16: begin
                    control_signal <= 23'b10000_101_0_1_1_0_0_0000_100_0_0_0;
                    if(done) state <= 17;// done out <- store done + data reset in mcc module
                end             
                   
                //conv1 - 5
                17: begin
                    control_signal <= 23'b10000_101_0_0_0_0_0_0000_101_1_0_1; //data load
                    if(run_mcc) state <= 18;
                end                
                18: begin
                    control_signal <= 23'b10000_101_1_0_0_0_0_0000_101_1_0_0;
                    if(done) state <= 19; // done <- mcc_done
                end
                19: begin
                    control_signal <= 23'b10000_101_0_1_1_0_0_0000_101_0_0_0;
                    if(done) state <= 20;// done out <- store done + data reset in mcc module
                end
                //*********************************conv1 finish****************************************
                //reset                
                20: begin
                    control_signal <= 23'b00110_101_1_1_1_1_1_0000_000_0_0_0;
                    state <= 21;
                end
                
                21: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0000_000_0_0_0;
                    state <= 22;
                end
                                
                22: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0000_000_0_0_1;
                    if(run_mcc) state <= 23;
                end
                
                23: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0000_000_0_0_0;
                    if(done) state <= 24;
                end
                
                24: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0000_000_0_0_0;
                    state <= 25;
                end
                
                25: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0000_001_0_0_1;
                    if(run_mcc) state <= 26;
                end
                
                26: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0000_001_0_0_0;
                    if(done) state <= 27;
                end
                
                27: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0000_001_0_0_0;
                    state <= 28;
                end
                
                28: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0000_010_0_0_1;
                    if(run_mcc) state <= 29;
                end
                
                29: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0000_010_0_0_0;
                    if(done) state <= 30;
                end
                
                30: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0000_010_0_0_0;
                    state <= 31;
                end
                
                31: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0000_011_0_0_1;
                    if(run_mcc) state <= 32;
                end
                
                32: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0000_011_0_0_0;
                    if(done) state <= 33;
                end
                
                33: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0000_011_0_0_0;
                    state <= 34;
                end
                
                34: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0000_100_0_0_1;
                    if(run_mcc) state <= 35;
                end
                
                35: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0000_100_0_0_0;
                    if(done) state <= 36;
                end
                
                36: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0000_100_0_0_0;
                    state <= 37;
                end
                
                37: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0000_101_0_0_1;
                    if(run_mcc) state <= 38;
                end
                
                38: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0000_101_0_0_0;
                    if(done) state <= 39;
                end
                
                39: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0000_101_0_0_0;
                    state <= 40;
                end
                
                40: begin
                    control_signal <= 23'b00110_101_0_1_1_1_1_0000_101_0_0_0;
                    state <= 41;
                end
                
                41: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0001_000_0_0_1;
                    if(run_mcc) state <= 42;
                end
                
                42: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0001_000_0_0_0;
                    if(done) state <= 43;
                end
                
                43: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0001_000_0_0_0;
                    state <= 44;
                end
                
                44: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0001_001_0_0_1;
                    if(run_mcc) state <= 45;
                end
                
                45: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0001_001_0_0_0;
                    if(done) state <= 46;
                end
                
                46: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0001_001_0_0_0;
                    state <= 47;
                end
                
                47: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0001_010_0_0_1;
                    if(run_mcc) state <= 48;
                end
                
                48: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0001_010_0_0_0;
                    if(done) state <= 49;
                end
                
                49: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0001_010_0_0_0;
                    state <= 50;
                end
                
                50: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0001_011_0_0_1;
                    if(run_mcc) state <= 51;
                end
                
                51: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0001_011_0_0_0;
                    if(done) state <= 52;
                end
                
                52: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0001_011_0_0_0;
                    state <= 53;
                end
                
                53: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0001_100_0_0_1;
                    if(run_mcc) state <= 54;
                end
                
                54: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0001_100_0_0_0;
                    if(done) state <= 55;
                end
                
                55: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0001_100_0_0_0;
                    state <= 56;
                end
                
                56: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0001_101_0_0_1;
                    if(run_mcc) state <= 57;
                end
                
                57: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0001_101_0_0_0;
                    if(done) state <= 58;
                end
                
                58: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0001_101_0_0_0;
                    state <= 59;
                end
                
                59: begin
                    control_signal <= 23'b00110_101_0_1_1_1_1_0001_101_0_0_0;
                    state <= 60;
                end
                
                60: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0010_000_0_0_1;
                    if(run_mcc) state <= 61;
                end
                
                61: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0010_000_0_0_0;
                    if(done) state <= 62;
                end
                
                62: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0010_000_0_0_0;
                    state <= 63;
                end
                
                63: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0010_001_0_0_1;
                    if(run_mcc) state <= 64;
                end
                
                64: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0010_001_0_0_0;
                    if(done) state <= 65;
                end
                
                65: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0010_001_0_0_0;
                    state <= 66;
                end
                
                66: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0010_010_0_0_1;
                    if(run_mcc) state <= 67;
                end
                
                67: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0010_010_0_0_0;
                    if(done) state <= 68;
                end
                
                68: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0010_010_0_0_0;
                    state <= 69;
                end
                
                69: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0010_011_0_0_1;
                    if(run_mcc) state <= 70;
                end
                
                70: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0010_011_0_0_0;
                    if(done) state <= 71;
                end
                
                71: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0010_011_0_0_0;
                    state <= 72;
                end
                
                72: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0010_100_0_0_1;
                    if(run_mcc) state <= 73;
                end
                
                73: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0010_100_0_0_0;
                    if(done) state <= 74;
                end
                
                74: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0010_100_0_0_0;
                    state <= 75;
                end
                
                75: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0010_101_0_0_1;
                    if(run_mcc) state <= 76;
                end
                
                76: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0010_101_0_0_0;
                    if(done) state <= 77;
                end
                
                77: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0010_101_0_0_0;
                    state <= 78;
                end
                
                78: begin
                    control_signal <= 23'b00110_101_0_1_1_1_1_0010_101_0_0_0;
                    state <= 79;
                end
                
                79: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0011_000_0_0_1;
                    if(run_mcc) state <= 80;
                end
                
                80: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0011_000_0_0_0;
                    if(done) state <= 81;
                end
                
                81: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0011_000_0_0_0;
                    state <= 82;
                end
                
                82: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0011_001_0_0_1;
                    if(run_mcc) state <= 83;
                end
                
                83: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0011_001_0_0_0;
                    if(done) state <= 84;
                end
                
                84: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0011_001_0_0_0;
                    state <= 85;
                end
                
                85: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0011_010_0_0_1;
                    if(run_mcc) state <= 86;
                end
                
                86: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0011_010_0_0_0;
                    if(done) state <= 87;
                end
                
                87: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0011_010_0_0_0;
                    state <= 88;
                end
                
                88: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0011_011_0_0_1;
                    if(run_mcc) state <= 89;
                end
                
                89: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0011_011_0_0_0;
                    if(done) state <= 90;
                end
                
                90: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0011_011_0_0_0;
                    state <= 91;
                end
                
                91: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0011_100_0_0_1;
                    if(run_mcc) state <= 92;
                end
                
                92: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0011_100_0_0_0;
                    if(done) state <= 93;
                end
                
                93: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0011_100_0_0_0;
                    state <= 94;
                end
                
                94: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0011_101_0_0_1;
                    if(run_mcc) state <= 95;
                end
                
                95: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0011_101_0_0_0;
                    if(done) state <= 96;
                end
                
                96: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0011_101_0_0_0;
                    state <= 97;
                end
                
                97: begin
                    control_signal <= 23'b00110_101_0_1_1_1_1_0011_101_0_0_0;
                    state <= 98;
                end
                
                98: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0100_000_0_0_1;
                    if(run_mcc) state <= 99;
                end
                
                99: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0100_000_0_0_0;
                    if(done) state <= 100;
                end
                
                100: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0100_000_0_0_0;
                    state <= 101;
                end
                
                101: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0100_001_0_0_1;
                    if(run_mcc) state <= 102;
                end
                
                102: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0100_001_0_0_0;
                    if(done) state <= 103;
                end
                
                103: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0100_001_0_0_0;
                    state <= 104;
                end
                
                104: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0100_010_0_0_1;
                    if(run_mcc) state <= 105;
                end
                
                105: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0100_010_0_0_0;
                    if(done) state <= 106;
                end
                
                106: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0100_010_0_0_0;
                    state <= 107;
                end
                
                107: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0100_011_0_0_1;
                    if(run_mcc) state <= 108;
                end
                
                108: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0100_011_0_0_0;
                    if(done) state <= 109;
                end
                
                109: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0100_011_0_0_0;
                    state <= 110;
                end
                
                110: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0100_100_0_0_1;
                    if(run_mcc) state <= 111;
                end
                
                111: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0100_100_0_0_0;
                    if(done) state <= 112;
                end
                
                112: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0100_100_0_0_0;
                    state <= 113;
                end
                
                113: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0100_101_0_0_1;
                    if(run_mcc) state <= 114;
                end
                
                114: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0100_101_0_0_0;
                    if(done) state <= 115;
                end
                
                115: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0100_101_0_0_0;
                    state <= 116;
                end
                
                116: begin
                    control_signal <= 23'b00110_101_0_1_1_1_1_0100_101_0_0_0;
                    state <= 117;
                end
                
                117: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0101_000_0_0_1;
                    if(run_mcc) state <= 118;
                end
                
                118: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0101_000_0_0_0;
                    if(done) state <= 119;
                end
                
                119: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0101_000_0_0_0;
                    state <= 120;
                end
                
                120: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0101_001_0_0_1;
                    if(run_mcc) state <= 121;
                end
                
                121: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0101_001_0_0_0;
                    if(done) state <= 122;
                end
                
                122: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0101_001_0_0_0;
                    state <= 123;
                end
                
                123: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0101_010_0_0_1;
                    if(run_mcc) state <= 124;
                end
                
                124: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0101_010_0_0_0;
                    if(done) state <= 125;
                end
                
                125: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0101_010_0_0_0;
                    state <= 126;
                end
                
                126: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0101_011_0_0_1;
                    if(run_mcc) state <= 127;
                end
                
                127: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0101_011_0_0_0;
                    if(done) state <= 128;
                end
                
                128: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0101_011_0_0_0;
                    state <= 129;
                end
                
                129: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0101_100_0_0_1;
                    if(run_mcc) state <= 130;
                end
                
                130: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0101_100_0_0_0;
                    if(done) state <= 131;
                end
                
                131: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0101_100_0_0_0;
                    state <= 132;
                end
                
                132: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0101_101_0_0_1;
                    if(run_mcc) state <= 133;
                end
                
                133: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0101_101_0_0_0;
                    if(done) state <= 134;
                end
                
                134: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0101_101_0_0_0;
                    state <= 135;
                end
                
                135: begin
                    control_signal <= 23'b00110_101_0_1_1_1_1_0101_101_0_0_0;
                    state <= 136;
                end
                
                136: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0110_000_0_0_1;
                    if(run_mcc) state <= 137;
                end
                
                137: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0110_000_0_0_0;
                    if(done) state <= 138;
                end
                
                138: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0110_000_0_0_0;
                    state <= 139;
                end
                
                139: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0110_001_0_0_1;
                    if(run_mcc) state <= 140;
                end
                
                140: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0110_001_0_0_0;
                    if(done) state <= 141;
                end
                
                141: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0110_001_0_0_0;
                    state <= 142;
                end
                
                142: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0110_010_0_0_1;
                    if(run_mcc) state <= 143;
                end
                
                143: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0110_010_0_0_0;
                    if(done) state <= 144;
                end
                
                144: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0110_010_0_0_0;
                    state <= 145;
                end
                
                145: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0110_011_0_0_1;
                    if(run_mcc) state <= 146;
                end
                
                146: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0110_011_0_0_0;
                    if(done) state <= 147;
                end
                
                147: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0110_011_0_0_0;
                    state <= 148;
                end
                
                148: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0110_100_0_0_1;
                    if(run_mcc) state <= 149;
                end
                
                149: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0110_100_0_0_0;
                    if(done) state <= 150;
                end
                
                150: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0110_100_0_0_0;
                    state <= 151;
                end
                
                151: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0110_101_0_0_1;
                    if(run_mcc) state <= 152;
                end
                
                152: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0110_101_0_0_0;
                    if(done) state <= 153;
                end
                
                153: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0110_101_0_0_0;
                    state <= 154;
                end
                
                154: begin
                    control_signal <= 23'b00110_101_0_1_1_1_1_0110_101_0_0_0;
                    state <= 155;
                end
                
                155: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0111_000_0_0_1;
                    if(run_mcc) state <= 156;
                end
                
                156: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0111_000_0_0_0;
                    if(done) state <= 157;
                end
                
                157: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0111_000_0_0_0;
                    state <= 158;
                end
                
                158: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0111_001_0_0_1;
                    if(run_mcc) state <= 159;
                end
                
                159: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0111_001_0_0_0;
                    if(done) state <= 160;
                end
                
                160: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0111_001_0_0_0;
                    state <= 161;
                end
                
                161: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0111_010_0_0_1;
                    if(run_mcc) state <= 162;
                end
                
                162: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0111_010_0_0_0;
                    if(done) state <= 163;
                end
                
                163: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0111_010_0_0_0;
                    state <= 164;
                end
                
                164: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0111_011_0_0_1;
                    if(run_mcc) state <= 165;
                end
                
                165: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0111_011_0_0_0;
                    if(done) state <= 166;
                end
                
                166: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0111_011_0_0_0;
                    state <= 167;
                end
                
                167: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0111_100_0_0_1;
                    if(run_mcc) state <= 168;
                end
                
                168: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0111_100_0_0_0;
                    if(done) state <= 169;
                end
                
                169: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0111_100_0_0_0;
                    state <= 170;
                end
                
                170: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0111_101_0_0_1;
                    if(run_mcc) state <= 171;
                end
                
                171: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_0111_101_0_0_0;
                    if(done) state <= 172;
                end
                
                172: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_0111_101_0_0_0;
                    state <= 173;
                end
                
                173: begin
                    control_signal <= 23'b00110_101_0_1_1_1_1_0111_101_0_0_0;
                    state <= 174;
                end
                
                174: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1000_000_0_0_1;
                    if(run_mcc) state <= 175;
                end
                
                175: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1000_000_0_0_0;
                    if(done) state <= 176;
                end
                
                176: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1000_000_0_0_0;
                    state <= 177;
                end
                
                177: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1000_001_0_0_1;
                    if(run_mcc) state <= 178;
                end
                
                178: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1000_001_0_0_0;
                    if(done) state <= 179;
                end
                
                179: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1000_001_0_0_0;
                    state <= 180;
                end
                
                180: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1000_010_0_0_1;
                    if(run_mcc) state <= 181;
                end
                
                181: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1000_010_0_0_0;
                    if(done) state <= 182;
                end
                
                182: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1000_010_0_0_0;
                    state <= 183;
                end
                
                183: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1000_011_0_0_1;
                    if(run_mcc) state <= 184;
                end
                
                184: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1000_011_0_0_0;
                    if(done) state <= 185;
                end
                
                185: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1000_011_0_0_0;
                    state <= 186;
                end
                
                186: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1000_100_0_0_1;
                    if(run_mcc) state <= 187;
                end
                
                187: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1000_100_0_0_0;
                    if(done) state <= 188;
                end
                
                188: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1000_100_0_0_0;
                    state <= 189;
                end
                
                189: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1000_101_0_0_1;
                    if(run_mcc) state <= 190;
                end
                
                190: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1000_101_0_0_0;
                    if(done) state <= 191;
                end
                
                191: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1000_101_0_0_0;
                    state <= 192;
                end
                
                192: begin
                    control_signal <= 23'b00110_101_0_1_1_1_1_1000_101_0_0_0;
                    state <= 193;
                end
                
                193: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1001_000_0_0_1;
                    if(run_mcc) state <= 194;
                end
                
                194: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1001_000_0_0_0;
                    if(done) state <= 195;
                end
                
                195: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1001_000_0_0_0;
                    state <= 196;
                end
                
                196: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1001_001_0_0_1;
                    if(run_mcc) state <= 197;
                end
                
                197: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1001_001_0_0_0;
                    if(done) state <= 198;
                end
                
                198: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1001_001_0_0_0;
                    state <= 199;
                end
                
                199: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1001_010_0_0_1;
                    if(run_mcc) state <= 200;
                end
                
                200: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1001_010_0_0_0;
                    if(done) state <= 201;
                end
                
                201: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1001_010_0_0_0;
                    state <= 202;
                end
                
                202: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1001_011_0_0_1;
                    if(run_mcc) state <= 203;
                end
                
                203: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1001_011_0_0_0;
                    if(done) state <= 204;
                end
                
                204: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1001_011_0_0_0;
                    state <= 205;
                end
                
                205: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1001_100_0_0_1;
                    if(run_mcc) state <= 206;
                end
                
                206: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1001_100_0_0_0;
                    if(done) state <= 207;
                end
                
                207: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1001_100_0_0_0;
                    state <= 208;
                end
                
                208: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1001_101_0_0_1;
                    if(run_mcc) state <= 209;
                end
                
                209: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1001_101_0_0_0;
                    if(done) state <= 210;
                end
                
                210: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1001_101_0_0_0;
                    state <= 211;
                end
                
                211: begin
                    control_signal <= 23'b00110_101_0_1_1_1_1_1001_101_0_0_0;
                    state <= 212;
                end
                
                212: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1010_000_0_0_1;
                    if(run_mcc) state <= 213;
                end
                
                213: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1010_000_0_0_0;
                    if(done) state <= 214;
                end
                
                214: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1010_000_0_0_0;
                    state <= 215;
                end
                
                215: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1010_001_0_0_1;
                    if(run_mcc) state <= 216;
                end
                
                216: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1010_001_0_0_0;
                    if(done) state <= 217;
                end
                
                217: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1010_001_0_0_0;
                    state <= 218;
                end
                
                218: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1010_010_0_0_1;
                    if(run_mcc) state <= 219;
                end
                
                219: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1010_010_0_0_0;
                    if(done) state <= 220;
                end
                
                220: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1010_010_0_0_0;
                    state <= 221;
                end
                
                221: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1010_011_0_0_1;
                    if(run_mcc) state <= 222;
                end
                
                222: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1010_011_0_0_0;
                    if(done) state <= 223;
                end
                
                223: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1010_011_0_0_0;
                    state <= 224;
                end
                
                224: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1010_100_0_0_1;
                    if(run_mcc) state <= 225;
                end
                
                225: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1010_100_0_0_0;
                    if(done) state <= 226;
                end
                
                226: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1010_100_0_0_0;
                    state <= 227;
                end
                
                227: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1010_101_0_0_1;
                    if(run_mcc) state <= 228;
                end
                
                228: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1010_101_0_0_0;
                    if(done) state <= 229;
                end
                
                229: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1010_101_0_0_0;
                    state <= 230;
                end
                
                230: begin
                    control_signal <= 23'b00110_101_0_1_1_1_1_1010_101_0_0_0;
                    state <= 231;
                end
                
                231: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1011_000_0_0_1;
                    if(run_mcc) state <= 232;
                end
                
                232: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1011_000_0_0_0;
                    if(done) state <= 233;
                end
                
                233: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1011_000_0_0_0;
                    state <= 234;
                end
                
                234: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1011_001_0_0_1;
                    if(run_mcc) state <= 235;
                end
                
                235: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1011_001_0_0_0;
                    if(done) state <= 236;
                end
                
                236: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1011_001_0_0_0;
                    state <= 237;
                end
                
                237: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1011_010_0_0_1;
                    if(run_mcc) state <= 238;
                end
                
                238: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1011_010_0_0_0;
                    if(done) state <= 239;
                end
                
                239: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1011_010_0_0_0;
                    state <= 240;
                end
                
                240: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1011_011_0_0_1;
                    if(run_mcc) state <= 241;
                end
                
                241: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1011_011_0_0_0;
                    if(done) state <= 242;
                end
                
                242: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1011_011_0_0_0;
                    state <= 243;
                end
                
                243: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1011_100_0_0_1;
                    if(run_mcc) state <= 244;
                end
                
                244: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1011_100_0_0_0;
                    if(done) state <= 245;
                end
                
                245: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1011_100_0_0_0;
                    state <= 246;
                end
                
                246: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1011_101_0_0_1;
                    if(run_mcc) state <= 247;
                end
                
                247: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1011_101_0_0_0;
                    if(done) state <= 248;
                end
                
                248: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1011_101_0_0_0;
                    state <= 249;
                end
                
                249: begin
                    control_signal <= 23'b00110_101_0_1_1_1_1_1011_101_0_0_0;
                    state <= 250;
                end
                
                250: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1100_000_0_0_1;
                    if(run_mcc) state <= 251;
                end
                
                251: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1100_000_0_0_0;
                    if(done) state <= 252;
                end
                
                252: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1100_000_0_0_0;
                    state <= 253;
                end
                
                253: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1100_001_0_0_1;
                    if(run_mcc) state <= 254;
                end
                
                254: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1100_001_0_0_0;
                    if(done) state <= 255;
                end
                
                255: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1100_001_0_0_0;
                    state <= 256;
                end
                
                256: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1100_010_0_0_1;
                    if(run_mcc) state <= 257;
                end
                
                257: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1100_010_0_0_0;
                    if(done) state <= 258;
                end
                
                258: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1100_010_0_0_0;
                    state <= 259;
                end
                
                259: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1100_011_0_0_1;
                    if(run_mcc) state <= 260;
                end
                
                260: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1100_011_0_0_0;
                    if(done) state <= 261;
                end
                
                261: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1100_011_0_0_0;
                    state <= 262;
                end
                
                262: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1100_100_0_0_1;
                    if(run_mcc) state <= 263;
                end
                
                263: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1100_100_0_0_0;
                    if(done) state <= 264;
                end
                
                264: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1100_100_0_0_0;
                    state <= 265;
                end
                
                265: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1100_101_0_0_1;
                    if(run_mcc) state <= 266;
                end
                
                266: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1100_101_0_0_0;
                    if(done) state <= 267;
                end
                
                267: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1100_101_0_0_0;
                    state <= 268;
                end
                
                268: begin
                    control_signal <= 23'b00110_101_0_1_1_1_1_1100_101_0_0_0;
                    state <= 269;
                end
                
                269: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1101_000_0_0_1;
                    if(run_mcc) state <= 270;
                end
                
                270: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1101_000_0_0_0;
                    if(done) state <= 271;
                end
                
                271: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1101_000_0_0_0;
                    state <= 272;
                end
                
                272: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1101_001_0_0_1;
                    if(run_mcc) state <= 273;
                end
                
                273: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1101_001_0_0_0;
                    if(done) state <= 274;
                end
                
                274: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1101_001_0_0_0;
                    state <= 275;
                end
                
                275: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1101_010_0_0_1;
                    if(run_mcc) state <= 276;
                end
                
                276: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1101_010_0_0_0;
                    if(done) state <= 277;
                end
                
                277: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1101_010_0_0_0;
                    state <= 278;
                end
                
                278: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1101_011_0_0_1;
                    if(run_mcc) state <= 279;
                end
                
                279: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1101_011_0_0_0;
                    if(done) state <= 280;
                end
                
                280: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1101_011_0_0_0;
                    state <= 281;
                end
                
                281: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1101_100_0_0_1;
                    if(run_mcc) state <= 282;
                end
                
                282: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1101_100_0_0_0;
                    if(done) state <= 283;
                end
                
                283: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1101_100_0_0_0;
                    state <= 284;
                end
                
                284: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1101_101_0_0_1;
                    if(run_mcc) state <= 285;
                end
                
                285: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1101_101_0_0_0;
                    if(done) state <= 286;
                end
                
                286: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1101_101_0_0_0;
                    state <= 287;
                end
                
                287: begin
                    control_signal <= 23'b00110_101_0_1_1_1_1_1101_101_0_0_0;
                    state <= 288;
                end
                
                288: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1110_000_0_0_1;
                    if(run_mcc) state <= 289;
                end
                
                289: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1110_000_0_0_0;
                    if(done) state <= 290;
                end
                
                290: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1110_000_0_0_0;
                    state <= 291;
                end
                
                291: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1110_001_0_0_1;
                    if(run_mcc) state <= 292;
                end
                
                292: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1110_001_0_0_0;
                    if(done) state <= 293;
                end
                
                293: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1110_001_0_0_0;
                    state <= 294;
                end
                
                294: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1110_010_0_0_1;
                    if(run_mcc) state <= 295;
                end
                
                295: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1110_010_0_0_0;
                    if(done) state <= 296;
                end
                
                296: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1110_010_0_0_0;
                    state <= 297;
                end
                
                297: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1110_011_0_0_1;
                    if(run_mcc) state <= 298;
                end
                
                298: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1110_011_0_0_0;
                    if(done) state <= 299;
                end
                
                299: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1110_011_0_0_0;
                    state <= 300;
                end
                
                300: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1110_100_0_0_1;
                    if(run_mcc) state <= 301;
                end
                
                301: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1110_100_0_0_0;
                    if(done) state <= 302;
                end
                
                302: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1110_100_0_0_0;
                    state <= 303;
                end
                
                303: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1110_101_0_0_1;
                    if(run_mcc) state <= 304;
                end
                
                304: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1110_101_0_0_0;
                    if(done) state <= 305;
                end
                
                305: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1110_101_0_0_0;
                    state <= 306;
                end
                
                306: begin
                    control_signal <= 23'b00110_101_0_1_1_1_1_1110_101_0_0_0;
                    state <= 307;
                end
                
                307: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1111_000_0_0_1;
                    if(run_mcc) state <= 308;
                end
                
                308: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1111_000_0_0_0;
                    if(done) state <= 309;
                end
                
                309: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1111_000_0_0_0;
                    state <= 310;
                end
                
                310: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1111_001_0_0_1;
                    if(run_mcc) state <= 311;
                end
                
                311: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1111_001_0_0_0;
                    if(done) state <= 312;
                end
                
                312: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1111_001_0_0_0;
                    state <= 313;
                end
                
                313: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1111_010_0_0_1;
                    if(run_mcc) state <= 314;
                end
                
                314: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1111_010_0_0_0;
                    if(done) state <= 315;
                end
                
                315: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1111_010_0_0_0;
                    state <= 316;
                end
                
                316: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1111_011_0_0_1;
                    if(run_mcc) state <= 317;
                end
                
                317: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1111_011_0_0_0;
                    if(done) state <= 318;
                end
                
                318: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1111_011_0_0_0;
                    state <= 319;
                end
                
                319: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1111_100_0_0_1;
                    if(run_mcc) state <= 320;
                end
                
                320: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1111_100_0_0_0;
                    if(done) state <= 321;
                end
                
                321: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1111_100_0_0_0;
                    state <= 322;
                end
                
                322: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1111_101_0_0_1;
                    if(run_mcc) state <= 323;
                end
                
                323: begin
                    control_signal <= 23'b00110_101_0_0_0_0_1_1111_101_0_0_0;
                    if(done) state <= 324;
                end
                
                324: begin
                    control_signal <= 23'b00110_101_0_1_0_1_1_1111_101_0_0_0;
                    state <= 325;
                end
                
                325: begin
                    control_signal <= 23'b00110_101_0_1_1_1_1_1111_101_0_0_0;
                    state <= 326;
                end
                
                326: begin
                    control_signal <= 23'b00000_000_0_0_0_0_0_0000_000_0_0_0;
                    state <= 0;
                end                
                
                default: begin
                    state <= 0;
                end
            endcase
        end
    end
    assign finish = (state == 326)? 1:0; 
    
endmodule
