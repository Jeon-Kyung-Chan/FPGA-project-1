`timescale 1ns / 1ps

module PWM_GEN(
    input i_100kHz,
    input i_rst_n,
    input [1:0] i_FANspeed,
    output o_PWMout
    );

    reg [6:0] r_PWMcount=0;
    reg r_PWMout=1;
    reg [6:0] r_FANspeed=0;

    assign o_PWMout=r_PWMout;

    always @(posedge i_100kHz or negedge i_rst_n)begin
        if(!i_rst_n)begin
            r_PWMcount<=0;
            r_PWMout<=0;
        end
        else begin
            if(r_PWMcount>=100-1)begin
                r_PWMcount<=0;
            end
            else begin
                r_PWMcount<= r_PWMcount+1;
                if(r_PWMcount<r_FANspeed)begin
                    r_PWMout<=1;
                end
                else begin
                    r_PWMout<=0;
                end
            end 
        end
    end

    always @(i_FANspeed)begin
        case(i_FANspeed)
            0: r_FANspeed <= 0;
            1: r_FANspeed <= 30;
            2: r_FANspeed <= 60;
            3: r_FANspeed <= 90;
        endcase
    end
endmodule
