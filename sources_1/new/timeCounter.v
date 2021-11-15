`timescale 1ns / 1ps

module timeCounter(
    input i_rst_n,
    input i_clk,
    output [7:0]o_tcLED,
    output [13:0] o_timeData
    );

    reg [5:0] ms = 0;
    reg [5:0] sec = 0;
    reg [5:0] min = 0;
    reg [5:0] hour = 0;
    reg [7:0]r_tcLED = 0;

    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            ms <= 0;
            sec <= 0;
            min <= 0;
            hour <= 0;
        end
        else begin
            if (ms >= 10) begin
                ms <= 0;
                sec <= sec + 1;
                if (sec >= 60) begin
                    sec <= 0;
                    min <= min + 1;
                    if (min >= 60) begin
                        min <= 0;
                        hour <= hour + 1;
                        if (hour >= 23) begin
                            hour <= 0;
                        end
                    end
                end
            end
            else begin
                if (ms > 5) r_tcLED <= 8'b00000000;
                else r_tcLED <= 8'b11111111;
                ms <= ms + 1;
            end
        end
    end

    assign o_timeData = (min * 100) + sec;
    assign o_tcLED = r_tcLED;

endmodule
