`timescale 1ns / 1ps

module prescaler_100 (
    input sysclk,
    input i_rst_n,
    output o_100hz_clk
);
   reg r_100hz_clk; 
   reg [31:0] counter = 0;
   
   assign o_100hz_clk = r_100hz_clk;

   always @(posedge sysclk or negedge i_rst_n) begin
       if (!i_rst_n) begin
           counter <= 0;
       end
       else begin
           if (counter >= 600000 - 1) begin
               counter <= 0;
               r_100hz_clk <= ~r_100hz_clk;
           end
           else begin
               counter <= counter + 1;
           end
       end
   end
endmodule

module counter (
    input i_clk,
    input i_rst_n,
    output [13:0] o_counter,
    output [4:0] o_LEDcnt
);
    reg [13:0] r_counter = 0;
    reg [4:0] r_LEDcnt=0;

    assign o_counter = r_counter;
    assign o_LEDcnt = r_LEDcnt;

    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            r_counter <= 0;
            r_LEDcnt<=0;
        end
        else begin
            if (r_counter >= 10000-1) begin
                r_counter <= 0;
            end
            else if(r_LEDcnt >= 19)begin
                r_LEDcnt<=0;
            end
            else begin
                r_LEDcnt<= r_LEDcnt+1;
                r_counter <= r_counter + 1;
            end
        end
    end

   
endmodule

module LED_CNT(
    input [4:0]i_LEDcnt,
    output [7:0]o_upcLED
);
    reg [7:0] r_upcLED;

    assign o_upcLED = r_upcLED;

     always @(i_LEDcnt)begin
        case(i_LEDcnt)
            0,1,2: r_upcLED <= 8'b00000000;
            3,4: r_upcLED <= 8'b00000001;
            5,6: r_upcLED <= 8'b00000011;
            7,8: r_upcLED <= 8'b00000111;
            9,10: r_upcLED <= 8'b00001111;
            11,12: r_upcLED <= 8'b00011111;
            13,14: r_upcLED <= 8'b00111111;
            15,16: r_upcLED <= 8'b01111111;
            17,18: r_upcLED <= 8'b11111111;
        endcase
    end
endmodule

module upCounter(
    input sysclk,
    input i_rst_n,
    output [13:0] o_upCounter,
    output [7:0]o_upcLED
    );

    prescaler_100 scaler(
        .sysclk(sysclk),
        .i_rst_n(i_rst_n),
        .o_100hz_clk(w_100hz_clk)
    );

    wire w_100hz_clk;
    
    counter upcounter(
        .i_clk(w_100hz_clk),
        .i_rst_n(i_rst_n),
        .o_counter(o_upCounter),
        .o_LEDcnt(w_LEDcnt)
    );

    wire [4:0]w_LEDcnt;
    LED_CNT uLED_CNT(
        .i_LEDcnt(w_LEDcnt),
        .o_upcLED(o_upcLED)
    );

endmodule
