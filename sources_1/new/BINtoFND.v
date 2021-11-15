`timescale 1ns / 1ps

module BINtoFND(
    input [3:0] i_fndData,
    output [7:0] o_fndOut
    );

    reg [7:0] r_fndOut;

    always @(i_fndData) begin
        case (i_fndData)
            0 : r_fndOut <= 8'hc0;
            1 : r_fndOut <= 8'hf9;
            2 : r_fndOut <= 8'ha4;
            3 : r_fndOut <= 8'hb0;
            4 : r_fndOut <= 8'h99;
            5 : r_fndOut <= 8'h92;
            6 : r_fndOut <= 8'h82;
            7 : r_fndOut <= 8'hf8;
            8 : r_fndOut <= 8'h80;
            9 : r_fndOut <= 8'h90;
        endcase
    end

    assign o_fndOut = r_fndOut;

endmodule
