`timescale 1ns / 1ps

module MUX(
    input [1:0]i_mode,
    input [13:0] i_timer,
    input [13:0] i_upcounter,
    input [13:0] i_PWM,
    output [13:0] o_muxOut
    );

    reg [13:0] r_muxOut;

    assign o_muxOut = r_muxOut;

    always @(i_mode) begin
        case (i_mode)
            0 : r_muxOut <= i_timer;
            1 : r_muxOut <= i_upcounter;
            2 : r_muxOut <= i_PWM;
        endcase
    end
endmodule
