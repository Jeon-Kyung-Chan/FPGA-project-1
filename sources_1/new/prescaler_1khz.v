`timescale 1ns / 1ps

module prescaler_1khz(
    input sysclk,
    input i_rst_n,
    output o_1khz_clk
    );

    reg [31:0] counter = 0;
    reg r_1khz_clk = 0;

    always @(posedge sysclk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            counter <= 0;
        end
        else begin
            if (counter >= 6000-1) begin 
                counter <=0;
                r_1khz_clk <= ~r_1khz_clk;
            end
            else begin
                counter <= counter + 1;
            end
        end
    end

    assign o_1khz_clk = r_1khz_clk;

endmodule
