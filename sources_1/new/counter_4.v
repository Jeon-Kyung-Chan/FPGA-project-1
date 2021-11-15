`timescale 1ns / 1ps

module counter_4(
    input i_clk,
    input i_rst_n,
    output [1:0] o_fndDigitCnt
    );

    reg [1:0] r_fndDigitCnt;

    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r_fndDigitCnt <= 0;
        end
        else begin
            r_fndDigitCnt <= (r_fndDigitCnt+1) % 4;
        end
    end

    assign o_fndDigitCnt = r_fndDigitCnt;

endmodule
