`timescale 1ns / 1ps

module PWMtoFND(
    input [1:0]i_FANspeed,
    output [13:0] o_PWMtoFND
    );

    reg [11:0] r_zero=0;

    assign o_PWMtoFND= {r_zero[11:0], i_FANspeed[1:0]};
    
endmodule
