`timescale 1ns / 1ps

module prescaler_100kHz(
    input sysclk,
    input i_rst_n,
    output o_100kHz
    );
    
    reg [5:0] count=0;
    reg r_100kHz=0;

    assign o_100kHz=r_100kHz;
    always @(posedge sysclk or negedge i_rst_n)begin
        if(!i_rst_n)begin
            count <=0;
        end
        else begin
            if(count>= 60-1)begin
                count <=0;
                r_100kHz <= ~r_100kHz;
            end
            else begin
                r_100kHz<= r_100kHz+1;
            end
        end
    end
endmodule