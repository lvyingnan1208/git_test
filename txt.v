`timescale 1ns/1ps
module min(
    input   clk,
    input   rst_n,
    input   [7:0]           req_flag,
    input   [7:0]           time_win1,
    input   [7:0]           time_win2,
    input   [7:0]           time_win3,
    input   [7:0]           time_win4,
    input   [7:0]           time_win5,
    input   [7:0]           time_win6,
    input   [7:0]           time_win7,
    input   [7:0]           time_win8,
    output  [7:0]           time_flag
    );
    
    wire    [7:0]           value_flag1;
    wire    [7:0]           value_flag2;
    wire    [7:0]           value_flag3;
    wire    [7:0]           value_flag4;
    wire    [7:0]           value_flag5;
    wire    [7:0]           value_flag6;
    wire    [7:0]           value_flag7;
    wire    [7:0]           value_flag8;
    wire    [7:0]           win1;
    wire    [7:0]           win2;
    wire    [7:0]           win3;
    wire    [7:0]           win4;
    wire    [7:0]           win5;
    wire    [7:0]           win6;
    wire    [7:0]           win7;
    wire    [7:0]           win8;
    
    assign  win1 = {time_win1[7],time_win2[7],time_win3[7],time_win4[7],time_win5[7],time_win6[7],time_win7[7],time_win8[7]};
    assign  win2 = {time_win1[6],time_win2[6],time_win3[6],time_win4[6],time_win5[6],time_win6[6],time_win7[6],time_win8[6]};
    assign  win3 = {time_win1[5],time_win2[5],time_win3[5],time_win4[5],time_win5[5],time_win6[5],time_win7[5],time_win8[5]};
    assign  win4 = {time_win1[4],time_win2[4],time_win3[4],time_win4[4],time_win5[4],time_win6[4],time_win7[4],time_win8[4]};
    assign  win5 = {time_win1[3],time_win2[3],time_win3[3],time_win4[3],time_win5[3],time_win6[3],time_win7[3],time_win8[3]};
    assign  win6 = {time_win1[2],time_win2[2],time_win3[2],time_win4[2],time_win5[2],time_win6[2],time_win7[2],time_win8[2]};
    assign  win7 = {time_win1[1],time_win2[1],time_win3[1],time_win4[1],time_win5[1],time_win6[1],time_win7[1],time_win8[1]};
    assign  win8 = {time_win1[0],time_win2[0],time_win3[0],time_win4[0],time_win5[0],time_win6[0],time_win7[0],time_win8[0]};
    
    assign  value_flag1 = (((~req_flag   )|win1) == 8'b1111_1111)? seq_flag    : ~((~seq_flag   )|win1);
    assign  value_flag2 = (((~value_flag1)|win2) == 8'b1111_1111)? value_flag1 : ~((~value_flag1)|win2);
    assign  value_flag3 = (((~value_flag2)|win3) == 8'b1111_1111)? value_flag2 : ~((~value_flag2)|win3);
    assign  value_flag4 = (((~value_flag3)|win4) == 8'b1111_1111)? value_flag3 : ~((~value_flag3)|win4);
    assign  value_flag5 = (((~value_flag4)|win5) == 8'b1111_1111)? value_flag4 : ~((~value_flag4)|win5);
    assign  value_flag6 = (((~value_flag5)|win6) == 8'b1111_1111)? value_flag5 : ~((~value_flag5)|win6);
    assign  value_flag7 = (((~value_flag6)|win7) == 8'b1111_1111)? value_flag6 : ~((~value_flag6)|win7);
    assign  value_flag8 = (((~value_flag7)|win8) == 8'b1111_1111)? value_flag7 : ~((~value_flag7)|win8);
    
    generate
    genvar  i;
        for(i=1;i<8;i=i+1)
            begin:min_
            assign time_flag[i] = value_flag8[i]&(~(|value_flag8[i-1:0]));
            end
    endgenerate
    
    assign  time_flag[0] = value_flag8[0];

    
    endmodule

