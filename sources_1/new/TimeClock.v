`timescale 1ns / 1ps

module TimeClock(
    input sysclk,
    input i_rst_n,
    output [7:0]o_tcLED,
    output [13:0] o_timeData
    );

    prescaler_10hz scaler(
        .sysclk(sysclk),
        .i_rst_n(i_rst_n),
        .o_10hz_clk(w_10hz_clk)
    );

    wire w_10hz_clk;

    timeCounter timer(
    .i_rst_n(i_rst_n),
    .i_clk(w_10hz_clk),
    .o_tcLED(o_tcLED),
    .o_timeData(o_timeData)
    );

endmodule
