`timescale 1ns / 1ps

module FND_Coder(
    input [1:0] i_fndDigit,
    input [13:0] i_fndData,
    output [3:0] o_fndData
    );

    reg [3:0] r_fndData;

    always @(i_fndDigit) begin
        case (i_fndDigit)
            0 : r_fndData <= i_fndData % 10; //1의 자리
            1 : r_fndData <= i_fndData / 10 % 10; //10의 자리
            2 : r_fndData <= i_fndData / 100 % 10; //100의 자리
            3 : r_fndData <= i_fndData /1000 % 10; //1000의 자리
        endcase
    end

    assign o_fndData = r_fndData;

endmodule
