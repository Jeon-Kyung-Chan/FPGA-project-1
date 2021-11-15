`timescale 1ns / 1ps

module TOP(
    input sysclk,
    input i_rst_n,
    input [1:0]i_mode,
    input [1:0]i_FANspeed,
    output [3:0] o_fndSelect,
    output [7:0] o_fndFont,
    output [7:0]LED_onoff,
    output o_PWMout
    );

    wire [7:0]w_tcLED;
    TimeClock timer(
        .sysclk(sysclk),
        .i_rst_n(i_rst_n),
        .o_tcLED(w_tcLED),
        .o_timeData(w_timeData)
    );
    wire [7:0]w_upcLED;
    wire [13:0] w_timeData;

    upCounter upcount(
        .sysclk(sysclk),
        .i_rst_n(i_rst_n),
        .o_upCounter(w_upcounter),
        .o_upcLED(w_upcLED)
    );

    wire [13:0] w_upcounter;

    MUX muxs(
        .i_mode(i_mode),
        .i_timer(w_timeData),
        .i_upcounter(w_upcounter),
        .i_PWM(w_PWM),
        .o_muxOut(w_muxOut)
    );
    LED_MUX medmuxs(
        .i_upcLED(w_upcLED),
        .i_tcLED(w_tcLED),
        .i_mode(i_mode),
        .o_LED(LED_onoff)
    );
    wire [13:0] w_muxOut;

    FND_Display fndDisplay(
        .sysclk(sysclk),
        .i_rst_n(i_rst_n),
        .i_fndData(w_muxOut),
        .o_fndSelect(o_fndSelect),
        .o_fndFont(o_fndFont)
    );

    wire [13:0] w_PWM;
    FAN_control u_FAN_control(
        .sysclk(sysclk),
        .i_rst_n(i_rst_n),
        .i_FANspeed(i_FANspeed),
        .o_PWMtoFND(w_PWM),
        .o_PWMout(o_PWMout)
    );

endmodule
