`timescale 1ns / 1ps

module FAN_control(
    input sysclk,
    input i_rst_n,
    input [1:0]i_FANspeed,
    output [13:0] o_PWMtoFND,
    output o_PWMout
    );

    prescaler_100kHz u_prescaler_100kHz(
        .sysclk(sysclk),
        .i_rst_n(i_rst_n),
        .o_100kHz(w_100kHz)
    );
    wire w_100kHz;

    PWM_GEN u_PWM_GEN(
        .i_100kHz(w_100kHz),
        .i_rst_n(i_rst_n),
        .i_FANspeed(i_FANspeed),
        .o_PWMout(o_PWMout)
    );

    PWMtoFND u_PWMtoFND(
        .i_FANspeed(i_FANspeed),
        .o_PWMtoFND(o_PWMtoFND)
    );
endmodule
