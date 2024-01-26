module sel1x144 (
  x_cor,
  y_cor,
  select
  

);


  input [3:0] x_cor, y_cor;
  output reg[143:0] select;

  wire [7:0] cor;

  assign cor = { y_cor, x_cor  };


  always@(*) begin
    case (cor)
        0 : begin select <= 1'b1 << 0; end
        1 : begin select <= 1'b1 << 1; end
        2 : begin select <= 1'b1 << 2; end
        3 : begin select <= 1'b1 << 3; end
        4 : begin select <= 1'b1 << 4; end
        5 : begin select <= 1'b1 << 5; end
        6 : begin select <= 1'b1 << 6; end
        7 : begin select <= 1'b1 << 7; end
        8 : begin select <= 1'b1 << 8; end
        9 : begin select <= 1'b1 << 9; end
        10 : begin select <= 1'b1 << 10; end
        11 : begin select <= 1'b1 << 11; end
        16 : begin select <= 1'b1 << 12; end
        17 : begin select <= 1'b1 << 13; end
        18 : begin select <= 1'b1 << 14; end
        19 : begin select <= 1'b1 << 15; end
        20 : begin select <= 1'b1 << 16; end
        21 : begin select <= 1'b1 << 17; end
        22 : begin select <= 1'b1 << 18; end
        23 : begin select <= 1'b1 << 19; end
        24 : begin select <= 1'b1 << 20; end
        25 : begin select <= 1'b1 << 21; end
        26 : begin select <= 1'b1 << 22; end
        27 : begin select <= 1'b1 << 23; end
        32 : begin select <= 1'b1 << 24; end
        33 : begin select <= 1'b1 << 25; end
        34 : begin select <= 1'b1 << 26; end
        35 : begin select <= 1'b1 << 27; end
        36 : begin select <= 1'b1 << 28; end
        37 : begin select <= 1'b1 << 29; end
        38 : begin select <= 1'b1 << 30; end
        39 : begin select <= 1'b1 << 31; end
        40 : begin select <= 1'b1 << 32; end
        41 : begin select <= 1'b1 << 33; end
        42 : begin select <= 1'b1 << 34; end
        43 : begin select <= 1'b1 << 35; end
        48 : begin select <= 1'b1 << 36; end
        49 : begin select <= 1'b1 << 37; end
        50 : begin select <= 1'b1 << 38; end
        51 : begin select <= 1'b1 << 39; end
        52 : begin select <= 1'b1 << 40; end
        53 : begin select <= 1'b1 << 41; end
        54 : begin select <= 1'b1 << 42; end
        55 : begin select <= 1'b1 << 43; end
        56 : begin select <= 1'b1 << 44; end
        57 : begin select <= 1'b1 << 45; end
        58 : begin select <= 1'b1 << 46; end
        59 : begin select <= 1'b1 << 47; end
        64 : begin select <= 1'b1 << 48; end
        65 : begin select <= 1'b1 << 49; end
        66 : begin select <= 1'b1 << 50; end
        67 : begin select <= 1'b1 << 51; end
        68 : begin select <= 1'b1 << 52; end
        69 : begin select <= 1'b1 << 53; end
        70 : begin select <= 1'b1 << 54; end
        71 : begin select <= 1'b1 << 55; end
        72 : begin select <= 1'b1 << 56; end
        73 : begin select <= 1'b1 << 57; end
        74 : begin select <= 1'b1 << 58; end
        75 : begin select <= 1'b1 << 59; end
        80 : begin select <= 1'b1 << 60; end
        81 : begin select <= 1'b1 << 61; end
        82 : begin select <= 1'b1 << 62; end
        83 : begin select <= 1'b1 << 63; end
        84 : begin select <= 1'b1 << 64; end
        85 : begin select <= 1'b1 << 65; end
        86 : begin select <= 1'b1 << 66; end
        87 : begin select <= 1'b1 << 67; end
        88 : begin select <= 1'b1 << 68; end
        89 : begin select <= 1'b1 << 69; end
        90 : begin select <= 1'b1 << 70; end
        91 : begin select <= 1'b1 << 71; end
        96 : begin select <= 1'b1 << 72; end
        97 : begin select <= 1'b1 << 73; end
        98 : begin select <= 1'b1 << 74; end
        99 : begin select <= 1'b1 << 75; end
        100 : begin select <= 1'b1 << 76; end
        101 : begin select <= 1'b1 << 77; end
        102 : begin select <= 1'b1 << 78; end
        103 : begin select <= 1'b1 << 79; end
        104 : begin select <= 1'b1 << 80; end
        105 : begin select <= 1'b1 << 81; end
        106 : begin select <= 1'b1 << 82; end
        107 : begin select <= 1'b1 << 83; end
        112 : begin select <= 1'b1 << 84; end
        113 : begin select <= 1'b1 << 85; end
        114 : begin select <= 1'b1 << 86; end
        115 : begin select <= 1'b1 << 87; end
        116 : begin select <= 1'b1 << 88; end
        117 : begin select <= 1'b1 << 89; end
        118 : begin select <= 1'b1 << 90; end
        119 : begin select <= 1'b1 << 91; end
        120 : begin select <= 1'b1 << 92; end
        121 : begin select <= 1'b1 << 93; end
        122 : begin select <= 1'b1 << 94; end
        123 : begin select <= 1'b1 << 95; end
        128 : begin select <= 1'b1 << 96; end
        129 : begin select <= 1'b1 << 97; end
        130 : begin select <= 1'b1 << 98; end
        131 : begin select <= 1'b1 << 99; end
        132 : begin select <= 1'b1 << 100; end
        133 : begin select <= 1'b1 << 101; end
        134 : begin select <= 1'b1 << 102; end
        135 : begin select <= 1'b1 << 103; end
        136 : begin select <= 1'b1 << 104; end
        137 : begin select <= 1'b1 << 105; end
        138 : begin select <= 1'b1 << 106; end
        139 : begin select <= 1'b1 << 107; end
        144 : begin select <= 1'b1 << 108; end
        145 : begin select <= 1'b1 << 109; end
        146 : begin select <= 1'b1 << 110; end
        147 : begin select <= 1'b1 << 111; end
        148 : begin select <= 1'b1 << 112; end
        149 : begin select <= 1'b1 << 113; end
        150 : begin select <= 1'b1 << 114; end
        151 : begin select <= 1'b1 << 115; end
        152 : begin select <= 1'b1 << 116; end
        153 : begin select <= 1'b1 << 117; end
        154 : begin select <= 1'b1 << 118; end
        155 : begin select <= 1'b1 << 119; end
        160 : begin select <= 1'b1 << 120; end
        161 : begin select <= 1'b1 << 121; end
        162 : begin select <= 1'b1 << 122; end
        163 : begin select <= 1'b1 << 123; end
        164 : begin select <= 1'b1 << 124; end
        165 : begin select <= 1'b1 << 125; end
        166 : begin select <= 1'b1 << 126; end
        167 : begin select <= 1'b1 << 127; end
        168 : begin select <= 1'b1 << 128; end
        169 : begin select <= 1'b1 << 129; end
        170 : begin select <= 1'b1 << 130; end
        171 : begin select <= 1'b1 << 131; end
        176 : begin select <= 1'b1 << 132; end
        177 : begin select <= 1'b1 << 133; end
        178 : begin select <= 1'b1 << 134; end
        179 : begin select <= 1'b1 << 135; end
        180 : begin select <= 1'b1 << 136; end
        181 : begin select <= 1'b1 << 137; end
        182 : begin select <= 1'b1 << 138; end
        183 : begin select <= 1'b1 << 139; end
        184 : begin select <= 1'b1 << 140; end
        185 : begin select <= 1'b1 << 141; end
        186 : begin select <= 1'b1 << 142; end
        187 : begin select <= 1'b1 << 143; end
      default : begin select <= 0; end
    endcase
  end

  
endmodule