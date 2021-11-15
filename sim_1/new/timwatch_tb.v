`timescale 1ns / 1ps

module timwatch_tb(

    );
    reg sysclk = 0;
    reg i_rst_n = 1;
    reg [13:0] i_fndData = 0;
    wire [3:0] w_fndSelect;
    wire [7:0] w_fndFont;

    top_timeWatch dut(
    .sysclk(sysclk),
    .i_rst_n(i_rst_n),
    .i_fndData(i_fndData),
    .o_fndSelect(w_fndSelect),
    .o_fndFont(w_fndFont)
    );

    always begin
    #5 sysclk = ~sysclk;
    end
        
    initial begin
        #0
        i_fndData = 1234;
        i_rst_n = 1;
        #1000
        i_rst_n = 0;
        #100
        i_fndData = 8888;
        #1000
        $finish();
    end
endmodule
