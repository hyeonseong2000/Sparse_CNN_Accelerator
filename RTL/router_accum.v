module router_accum (
  clk,
  reset,
  i_data0, i_data1, i_data2, i_data3, 
  
  
  

  accum_out

  
);
  input clk, reset;
  input[23:0] i_data0, i_data1, i_data2, i_data3 ;
              



  output[20*144 - 1 : 0 ] accum_out;


  wire[20*144 - 1 : 0] o_val;

  

  
  router4x144 u_router(
  .i_data0(i_data0), .i_data1(i_data1), .i_data2(i_data2), .i_data3(i_data3),
  
  
  .o_val(o_val) );


accumbuf u_accumbuf_0 (.clk(clk), .reset(reset), .i_val(o_val[19:0]), .o_val(accum_out[2879:2860]));
accumbuf u_accumbuf_1 (.clk(clk), .reset(reset), .i_val(o_val[39:20]), .o_val(accum_out[2859:2840]));
accumbuf u_accumbuf_2 (.clk(clk), .reset(reset), .i_val(o_val[59:40]), .o_val(accum_out[2839:2820]));
accumbuf u_accumbuf_3 (.clk(clk), .reset(reset), .i_val(o_val[79:60]), .o_val(accum_out[2819:2800]));
accumbuf u_accumbuf_4 (.clk(clk), .reset(reset), .i_val(o_val[99:80]), .o_val(accum_out[2799:2780]));
accumbuf u_accumbuf_5 (.clk(clk), .reset(reset), .i_val(o_val[119:100]), .o_val(accum_out[2779:2760]));
accumbuf u_accumbuf_6 (.clk(clk), .reset(reset), .i_val(o_val[139:120]), .o_val(accum_out[2759:2740]));
accumbuf u_accumbuf_7 (.clk(clk), .reset(reset), .i_val(o_val[159:140]), .o_val(accum_out[2739:2720]));
accumbuf u_accumbuf_8 (.clk(clk), .reset(reset), .i_val(o_val[179:160]), .o_val(accum_out[2719:2700]));
accumbuf u_accumbuf_9 (.clk(clk), .reset(reset), .i_val(o_val[199:180]), .o_val(accum_out[2699:2680]));
accumbuf u_accumbuf_10 (.clk(clk), .reset(reset), .i_val(o_val[219:200]), .o_val(accum_out[2679:2660]));
accumbuf u_accumbuf_11 (.clk(clk), .reset(reset), .i_val(o_val[239:220]), .o_val(accum_out[2659:2640]));
accumbuf u_accumbuf_12 (.clk(clk), .reset(reset), .i_val(o_val[259:240]), .o_val(accum_out[2639:2620]));
accumbuf u_accumbuf_13 (.clk(clk), .reset(reset), .i_val(o_val[279:260]), .o_val(accum_out[2619:2600]));
accumbuf u_accumbuf_14 (.clk(clk), .reset(reset), .i_val(o_val[299:280]), .o_val(accum_out[2599:2580]));
accumbuf u_accumbuf_15 (.clk(clk), .reset(reset), .i_val(o_val[319:300]), .o_val(accum_out[2579:2560]));
accumbuf u_accumbuf_16 (.clk(clk), .reset(reset), .i_val(o_val[339:320]), .o_val(accum_out[2559:2540]));
accumbuf u_accumbuf_17 (.clk(clk), .reset(reset), .i_val(o_val[359:340]), .o_val(accum_out[2539:2520]));
accumbuf u_accumbuf_18 (.clk(clk), .reset(reset), .i_val(o_val[379:360]), .o_val(accum_out[2519:2500]));
accumbuf u_accumbuf_19 (.clk(clk), .reset(reset), .i_val(o_val[399:380]), .o_val(accum_out[2499:2480]));
accumbuf u_accumbuf_20 (.clk(clk), .reset(reset), .i_val(o_val[419:400]), .o_val(accum_out[2479:2460]));
accumbuf u_accumbuf_21 (.clk(clk), .reset(reset), .i_val(o_val[439:420]), .o_val(accum_out[2459:2440]));
accumbuf u_accumbuf_22 (.clk(clk), .reset(reset), .i_val(o_val[459:440]), .o_val(accum_out[2439:2420]));
accumbuf u_accumbuf_23 (.clk(clk), .reset(reset), .i_val(o_val[479:460]), .o_val(accum_out[2419:2400]));
accumbuf u_accumbuf_24 (.clk(clk), .reset(reset), .i_val(o_val[499:480]), .o_val(accum_out[2399:2380]));
accumbuf u_accumbuf_25 (.clk(clk), .reset(reset), .i_val(o_val[519:500]), .o_val(accum_out[2379:2360]));
accumbuf u_accumbuf_26 (.clk(clk), .reset(reset), .i_val(o_val[539:520]), .o_val(accum_out[2359:2340]));
accumbuf u_accumbuf_27 (.clk(clk), .reset(reset), .i_val(o_val[559:540]), .o_val(accum_out[2339:2320]));
accumbuf u_accumbuf_28 (.clk(clk), .reset(reset), .i_val(o_val[579:560]), .o_val(accum_out[2319:2300]));
accumbuf u_accumbuf_29 (.clk(clk), .reset(reset), .i_val(o_val[599:580]), .o_val(accum_out[2299:2280]));
accumbuf u_accumbuf_30 (.clk(clk), .reset(reset), .i_val(o_val[619:600]), .o_val(accum_out[2279:2260]));
accumbuf u_accumbuf_31 (.clk(clk), .reset(reset), .i_val(o_val[639:620]), .o_val(accum_out[2259:2240]));
accumbuf u_accumbuf_32 (.clk(clk), .reset(reset), .i_val(o_val[659:640]), .o_val(accum_out[2239:2220]));
accumbuf u_accumbuf_33 (.clk(clk), .reset(reset), .i_val(o_val[679:660]), .o_val(accum_out[2219:2200]));
accumbuf u_accumbuf_34 (.clk(clk), .reset(reset), .i_val(o_val[699:680]), .o_val(accum_out[2199:2180]));
accumbuf u_accumbuf_35 (.clk(clk), .reset(reset), .i_val(o_val[719:700]), .o_val(accum_out[2179:2160]));
accumbuf u_accumbuf_36 (.clk(clk), .reset(reset), .i_val(o_val[739:720]), .o_val(accum_out[2159:2140]));
accumbuf u_accumbuf_37 (.clk(clk), .reset(reset), .i_val(o_val[759:740]), .o_val(accum_out[2139:2120]));
accumbuf u_accumbuf_38 (.clk(clk), .reset(reset), .i_val(o_val[779:760]), .o_val(accum_out[2119:2100]));
accumbuf u_accumbuf_39 (.clk(clk), .reset(reset), .i_val(o_val[799:780]), .o_val(accum_out[2099:2080]));
accumbuf u_accumbuf_40 (.clk(clk), .reset(reset), .i_val(o_val[819:800]), .o_val(accum_out[2079:2060]));
accumbuf u_accumbuf_41 (.clk(clk), .reset(reset), .i_val(o_val[839:820]), .o_val(accum_out[2059:2040]));
accumbuf u_accumbuf_42 (.clk(clk), .reset(reset), .i_val(o_val[859:840]), .o_val(accum_out[2039:2020]));
accumbuf u_accumbuf_43 (.clk(clk), .reset(reset), .i_val(o_val[879:860]), .o_val(accum_out[2019:2000]));
accumbuf u_accumbuf_44 (.clk(clk), .reset(reset), .i_val(o_val[899:880]), .o_val(accum_out[1999:1980]));
accumbuf u_accumbuf_45 (.clk(clk), .reset(reset), .i_val(o_val[919:900]), .o_val(accum_out[1979:1960]));
accumbuf u_accumbuf_46 (.clk(clk), .reset(reset), .i_val(o_val[939:920]), .o_val(accum_out[1959:1940]));
accumbuf u_accumbuf_47 (.clk(clk), .reset(reset), .i_val(o_val[959:940]), .o_val(accum_out[1939:1920]));
accumbuf u_accumbuf_48 (.clk(clk), .reset(reset), .i_val(o_val[979:960]), .o_val(accum_out[1919:1900]));
accumbuf u_accumbuf_49 (.clk(clk), .reset(reset), .i_val(o_val[999:980]), .o_val(accum_out[1899:1880]));
accumbuf u_accumbuf_50 (.clk(clk), .reset(reset), .i_val(o_val[1019:1000]), .o_val(accum_out[1879:1860]));
accumbuf u_accumbuf_51 (.clk(clk), .reset(reset), .i_val(o_val[1039:1020]), .o_val(accum_out[1859:1840]));
accumbuf u_accumbuf_52 (.clk(clk), .reset(reset), .i_val(o_val[1059:1040]), .o_val(accum_out[1839:1820]));
accumbuf u_accumbuf_53 (.clk(clk), .reset(reset), .i_val(o_val[1079:1060]), .o_val(accum_out[1819:1800]));
accumbuf u_accumbuf_54 (.clk(clk), .reset(reset), .i_val(o_val[1099:1080]), .o_val(accum_out[1799:1780]));
accumbuf u_accumbuf_55 (.clk(clk), .reset(reset), .i_val(o_val[1119:1100]), .o_val(accum_out[1779:1760]));
accumbuf u_accumbuf_56 (.clk(clk), .reset(reset), .i_val(o_val[1139:1120]), .o_val(accum_out[1759:1740]));
accumbuf u_accumbuf_57 (.clk(clk), .reset(reset), .i_val(o_val[1159:1140]), .o_val(accum_out[1739:1720]));
accumbuf u_accumbuf_58 (.clk(clk), .reset(reset), .i_val(o_val[1179:1160]), .o_val(accum_out[1719:1700]));
accumbuf u_accumbuf_59 (.clk(clk), .reset(reset), .i_val(o_val[1199:1180]), .o_val(accum_out[1699:1680]));
accumbuf u_accumbuf_60 (.clk(clk), .reset(reset), .i_val(o_val[1219:1200]), .o_val(accum_out[1679:1660]));
accumbuf u_accumbuf_61 (.clk(clk), .reset(reset), .i_val(o_val[1239:1220]), .o_val(accum_out[1659:1640]));
accumbuf u_accumbuf_62 (.clk(clk), .reset(reset), .i_val(o_val[1259:1240]), .o_val(accum_out[1639:1620]));
accumbuf u_accumbuf_63 (.clk(clk), .reset(reset), .i_val(o_val[1279:1260]), .o_val(accum_out[1619:1600]));
accumbuf u_accumbuf_64 (.clk(clk), .reset(reset), .i_val(o_val[1299:1280]), .o_val(accum_out[1599:1580]));
accumbuf u_accumbuf_65 (.clk(clk), .reset(reset), .i_val(o_val[1319:1300]), .o_val(accum_out[1579:1560]));
accumbuf u_accumbuf_66 (.clk(clk), .reset(reset), .i_val(o_val[1339:1320]), .o_val(accum_out[1559:1540]));
accumbuf u_accumbuf_67 (.clk(clk), .reset(reset), .i_val(o_val[1359:1340]), .o_val(accum_out[1539:1520]));
accumbuf u_accumbuf_68 (.clk(clk), .reset(reset), .i_val(o_val[1379:1360]), .o_val(accum_out[1519:1500]));
accumbuf u_accumbuf_69 (.clk(clk), .reset(reset), .i_val(o_val[1399:1380]), .o_val(accum_out[1499:1480]));
accumbuf u_accumbuf_70 (.clk(clk), .reset(reset), .i_val(o_val[1419:1400]), .o_val(accum_out[1479:1460]));
accumbuf u_accumbuf_71 (.clk(clk), .reset(reset), .i_val(o_val[1439:1420]), .o_val(accum_out[1459:1440]));
accumbuf u_accumbuf_72 (.clk(clk), .reset(reset), .i_val(o_val[1459:1440]), .o_val(accum_out[1439:1420]));
accumbuf u_accumbuf_73 (.clk(clk), .reset(reset), .i_val(o_val[1479:1460]), .o_val(accum_out[1419:1400]));
accumbuf u_accumbuf_74 (.clk(clk), .reset(reset), .i_val(o_val[1499:1480]), .o_val(accum_out[1399:1380]));
accumbuf u_accumbuf_75 (.clk(clk), .reset(reset), .i_val(o_val[1519:1500]), .o_val(accum_out[1379:1360]));
accumbuf u_accumbuf_76 (.clk(clk), .reset(reset), .i_val(o_val[1539:1520]), .o_val(accum_out[1359:1340]));
accumbuf u_accumbuf_77 (.clk(clk), .reset(reset), .i_val(o_val[1559:1540]), .o_val(accum_out[1339:1320]));
accumbuf u_accumbuf_78 (.clk(clk), .reset(reset), .i_val(o_val[1579:1560]), .o_val(accum_out[1319:1300]));
accumbuf u_accumbuf_79 (.clk(clk), .reset(reset), .i_val(o_val[1599:1580]), .o_val(accum_out[1299:1280]));
accumbuf u_accumbuf_80 (.clk(clk), .reset(reset), .i_val(o_val[1619:1600]), .o_val(accum_out[1279:1260]));
accumbuf u_accumbuf_81 (.clk(clk), .reset(reset), .i_val(o_val[1639:1620]), .o_val(accum_out[1259:1240]));
accumbuf u_accumbuf_82 (.clk(clk), .reset(reset), .i_val(o_val[1659:1640]), .o_val(accum_out[1239:1220]));
accumbuf u_accumbuf_83 (.clk(clk), .reset(reset), .i_val(o_val[1679:1660]), .o_val(accum_out[1219:1200]));
accumbuf u_accumbuf_84 (.clk(clk), .reset(reset), .i_val(o_val[1699:1680]), .o_val(accum_out[1199:1180]));
accumbuf u_accumbuf_85 (.clk(clk), .reset(reset), .i_val(o_val[1719:1700]), .o_val(accum_out[1179:1160]));
accumbuf u_accumbuf_86 (.clk(clk), .reset(reset), .i_val(o_val[1739:1720]), .o_val(accum_out[1159:1140]));
accumbuf u_accumbuf_87 (.clk(clk), .reset(reset), .i_val(o_val[1759:1740]), .o_val(accum_out[1139:1120]));
accumbuf u_accumbuf_88 (.clk(clk), .reset(reset), .i_val(o_val[1779:1760]), .o_val(accum_out[1119:1100]));
accumbuf u_accumbuf_89 (.clk(clk), .reset(reset), .i_val(o_val[1799:1780]), .o_val(accum_out[1099:1080]));
accumbuf u_accumbuf_90 (.clk(clk), .reset(reset), .i_val(o_val[1819:1800]), .o_val(accum_out[1079:1060]));
accumbuf u_accumbuf_91 (.clk(clk), .reset(reset), .i_val(o_val[1839:1820]), .o_val(accum_out[1059:1040]));
accumbuf u_accumbuf_92 (.clk(clk), .reset(reset), .i_val(o_val[1859:1840]), .o_val(accum_out[1039:1020]));
accumbuf u_accumbuf_93 (.clk(clk), .reset(reset), .i_val(o_val[1879:1860]), .o_val(accum_out[1019:1000]));
accumbuf u_accumbuf_94 (.clk(clk), .reset(reset), .i_val(o_val[1899:1880]), .o_val(accum_out[999:980]));
accumbuf u_accumbuf_95 (.clk(clk), .reset(reset), .i_val(o_val[1919:1900]), .o_val(accum_out[979:960]));
accumbuf u_accumbuf_96 (.clk(clk), .reset(reset), .i_val(o_val[1939:1920]), .o_val(accum_out[959:940]));
accumbuf u_accumbuf_97 (.clk(clk), .reset(reset), .i_val(o_val[1959:1940]), .o_val(accum_out[939:920]));
accumbuf u_accumbuf_98 (.clk(clk), .reset(reset), .i_val(o_val[1979:1960]), .o_val(accum_out[919:900]));
accumbuf u_accumbuf_99 (.clk(clk), .reset(reset), .i_val(o_val[1999:1980]), .o_val(accum_out[899:880]));
accumbuf u_accumbuf_100 (.clk(clk), .reset(reset), .i_val(o_val[2019:2000]), .o_val(accum_out[879:860]));
accumbuf u_accumbuf_101 (.clk(clk), .reset(reset), .i_val(o_val[2039:2020]), .o_val(accum_out[859:840]));
accumbuf u_accumbuf_102 (.clk(clk), .reset(reset), .i_val(o_val[2059:2040]), .o_val(accum_out[839:820]));
accumbuf u_accumbuf_103 (.clk(clk), .reset(reset), .i_val(o_val[2079:2060]), .o_val(accum_out[819:800]));
accumbuf u_accumbuf_104 (.clk(clk), .reset(reset), .i_val(o_val[2099:2080]), .o_val(accum_out[799:780]));
accumbuf u_accumbuf_105 (.clk(clk), .reset(reset), .i_val(o_val[2119:2100]), .o_val(accum_out[779:760]));
accumbuf u_accumbuf_106 (.clk(clk), .reset(reset), .i_val(o_val[2139:2120]), .o_val(accum_out[759:740]));
accumbuf u_accumbuf_107 (.clk(clk), .reset(reset), .i_val(o_val[2159:2140]), .o_val(accum_out[739:720]));
accumbuf u_accumbuf_108 (.clk(clk), .reset(reset), .i_val(o_val[2179:2160]), .o_val(accum_out[719:700]));
accumbuf u_accumbuf_109 (.clk(clk), .reset(reset), .i_val(o_val[2199:2180]), .o_val(accum_out[699:680]));
accumbuf u_accumbuf_110 (.clk(clk), .reset(reset), .i_val(o_val[2219:2200]), .o_val(accum_out[679:660]));
accumbuf u_accumbuf_111 (.clk(clk), .reset(reset), .i_val(o_val[2239:2220]), .o_val(accum_out[659:640]));
accumbuf u_accumbuf_112 (.clk(clk), .reset(reset), .i_val(o_val[2259:2240]), .o_val(accum_out[639:620]));
accumbuf u_accumbuf_113 (.clk(clk), .reset(reset), .i_val(o_val[2279:2260]), .o_val(accum_out[619:600]));
accumbuf u_accumbuf_114 (.clk(clk), .reset(reset), .i_val(o_val[2299:2280]), .o_val(accum_out[599:580]));
accumbuf u_accumbuf_115 (.clk(clk), .reset(reset), .i_val(o_val[2319:2300]), .o_val(accum_out[579:560]));
accumbuf u_accumbuf_116 (.clk(clk), .reset(reset), .i_val(o_val[2339:2320]), .o_val(accum_out[559:540]));
accumbuf u_accumbuf_117 (.clk(clk), .reset(reset), .i_val(o_val[2359:2340]), .o_val(accum_out[539:520]));
accumbuf u_accumbuf_118 (.clk(clk), .reset(reset), .i_val(o_val[2379:2360]), .o_val(accum_out[519:500]));
accumbuf u_accumbuf_119 (.clk(clk), .reset(reset), .i_val(o_val[2399:2380]), .o_val(accum_out[499:480]));
accumbuf u_accumbuf_120 (.clk(clk), .reset(reset), .i_val(o_val[2419:2400]), .o_val(accum_out[479:460]));
accumbuf u_accumbuf_121 (.clk(clk), .reset(reset), .i_val(o_val[2439:2420]), .o_val(accum_out[459:440]));
accumbuf u_accumbuf_122 (.clk(clk), .reset(reset), .i_val(o_val[2459:2440]), .o_val(accum_out[439:420]));
accumbuf u_accumbuf_123 (.clk(clk), .reset(reset), .i_val(o_val[2479:2460]), .o_val(accum_out[419:400]));
accumbuf u_accumbuf_124 (.clk(clk), .reset(reset), .i_val(o_val[2499:2480]), .o_val(accum_out[399:380]));
accumbuf u_accumbuf_125 (.clk(clk), .reset(reset), .i_val(o_val[2519:2500]), .o_val(accum_out[379:360]));
accumbuf u_accumbuf_126 (.clk(clk), .reset(reset), .i_val(o_val[2539:2520]), .o_val(accum_out[359:340]));
accumbuf u_accumbuf_127 (.clk(clk), .reset(reset), .i_val(o_val[2559:2540]), .o_val(accum_out[339:320]));
accumbuf u_accumbuf_128 (.clk(clk), .reset(reset), .i_val(o_val[2579:2560]), .o_val(accum_out[319:300]));
accumbuf u_accumbuf_129 (.clk(clk), .reset(reset), .i_val(o_val[2599:2580]), .o_val(accum_out[299:280]));
accumbuf u_accumbuf_130 (.clk(clk), .reset(reset), .i_val(o_val[2619:2600]), .o_val(accum_out[279:260]));
accumbuf u_accumbuf_131 (.clk(clk), .reset(reset), .i_val(o_val[2639:2620]), .o_val(accum_out[259:240]));
accumbuf u_accumbuf_132 (.clk(clk), .reset(reset), .i_val(o_val[2659:2640]), .o_val(accum_out[239:220]));
accumbuf u_accumbuf_133 (.clk(clk), .reset(reset), .i_val(o_val[2679:2660]), .o_val(accum_out[219:200]));
accumbuf u_accumbuf_134 (.clk(clk), .reset(reset), .i_val(o_val[2699:2680]), .o_val(accum_out[199:180]));
accumbuf u_accumbuf_135 (.clk(clk), .reset(reset), .i_val(o_val[2719:2700]), .o_val(accum_out[179:160]));
accumbuf u_accumbuf_136 (.clk(clk), .reset(reset), .i_val(o_val[2739:2720]), .o_val(accum_out[159:140]));
accumbuf u_accumbuf_137 (.clk(clk), .reset(reset), .i_val(o_val[2759:2740]), .o_val(accum_out[139:120]));
accumbuf u_accumbuf_138 (.clk(clk), .reset(reset), .i_val(o_val[2779:2760]), .o_val(accum_out[119:100]));
accumbuf u_accumbuf_139 (.clk(clk), .reset(reset), .i_val(o_val[2799:2780]), .o_val(accum_out[99:80]));
accumbuf u_accumbuf_140 (.clk(clk), .reset(reset), .i_val(o_val[2819:2800]), .o_val(accum_out[79:60]));
accumbuf u_accumbuf_141 (.clk(clk), .reset(reset), .i_val(o_val[2839:2820]), .o_val(accum_out[59:40]));
accumbuf u_accumbuf_142 (.clk(clk), .reset(reset), .i_val(o_val[2859:2840]), .o_val(accum_out[39:20]));
accumbuf u_accumbuf_143 (.clk(clk), .reset(reset), .i_val(o_val[2879:2860]), .o_val(accum_out[19:0]));




endmodule