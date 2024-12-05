`timescale 1ns / 1ps

module FPGA_TOP (
    input wire CLK100MHZ,              // System clock input
    output wire [3:0] VGA_R,     // VGA red channel output
    output wire [3:0] VGA_G,     // VGA green channel output
    output wire [3:0] VGA_B,     // VGA blue channel output
    output wire VGA_HS,          // VGA horizontal sync
    output wire VGA_VS,           // VGA vertical sync
    input wire CPU_RESETN,BTNC,BTNR
);


        logic clk,plot;
        logic reset_n;
        logic [7:0] x;
        logic [6:0] y;
        logic [2:0] color;
        assign reset_n = CPU_RESETN;
        assign clk = CLK100MHZ;


    vga_core vga_instance (
        .clk(clk),
        .resetn(reset_n),
        .x(x),
        .y(y),
        .color(color),
        .plot(plot),
        .VGA_R(VGA_R),
        .VGA_G(VGA_G),
        .VGA_B(VGA_B),
        .VGA_HS(VGA_HS),
        .VGA_VS(VGA_VS)
    );
    
        FTScreen FTscreen(
        .clk(clk),
        .reset_n(reset_n),
        .BTN(BTNR),
        .Color(color),
        .x(x),
        .y(y),
        .plot(plot)
    );
    
    
    
    
    
endmodule
