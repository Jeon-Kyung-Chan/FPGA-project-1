`timescale 1ns / 1ps

module FND_Display(
    input sysclk,
    input i_rst_n,
    input [13:0] i_fndData,
    output [3:0] o_fndSelect,
    output [7:0] o_fndFont
    );

    wire w_1khz_clk;
    
    prescaler_1khz scaler_1khz(
        .sysclk(sysclk),
        .i_rst_n(i_rst_n),
        .o_1khz_clk(w_1khz_clk)
    );

    wire [1:0] w_fndDigitCnt;

    counter_4 cnt_4(
        .i_clk(w_1khz_clk),
        .i_rst_n(i_rst_n),
        .o_fndDigitCnt(w_fndDigitCnt)
    );

    //wire [3:0] w_fndSelect;

    decoder_2x4 decoder_fnd(
        .i_fndSel(w_fndDigitCnt),
        .o_fndSelect(o_fndSelect)
    );

    wire [3:0] w_fndData;

    FND_Coder fndCoder(
        .i_fndDigit(w_fndDigitCnt),
        .i_fndData(i_fndData),
        .o_fndData(w_fndData)
    );

    BINtoFND bin_to_fnd(
        .i_fndData(w_fndData),
        .o_fndOut(o_fndFont)
    );

endmodule
