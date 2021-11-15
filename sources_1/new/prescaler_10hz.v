`timescale 1ns / 1ps

module prescaler_10hz(
    input sysclk,
    input i_rst_n,
    output o_10hz_clk
    );

    reg r_10hz_clk;
    reg [31:0] counter = 0;

    always @(posedge sysclk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            counter <= 0;
        end
        else begin
            if (counter >= 600000 - 1) begin
                counter <= 0;
                r_10hz_clk <= ~r_10hz_clk;
            end
            else begin
                counter <= counter + 1;
            end
        end
    end

    assign o_10hz_clk = r_10hz_clk;

endmodule
