`timescale 1ns / 1ps

module decoder_2x4(
    input [1:0] i_fndSel,
    output [3:0] o_fndSelect
    );

    reg [3:0] r_fndSelect;

    always @(i_fndSel) begin
        case (i_fndSel)
            0 : r_fndSelect <= 4'b0001;
            1 : r_fndSelect <= 4'b0010;
            2 : r_fndSelect <= 4'b0100;
            3 : r_fndSelect <= 4'b1000;
        endcase
    end

    assign o_fndSelect = r_fndSelect;

endmodule
