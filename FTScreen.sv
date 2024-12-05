`timescale 1ns / 1ps

module FTScreen(
    input logic clk,
    input logic reset_n,
    input logic BTN,
    output logic [2:0] Color,
    output logic [7:0] x,
    output logic [6:0] y,
    output logic plot

);
    logic en_x, f,SetColor;

    FTScreen_Control control_unit (
        .clk(clk),
        .reset_n(reset_n),
        .SetColor(SetColor),
        .BTNR(BTN),
        .f(f),
        .en_x(en_x)
    );

    FTScreen_DataPath data_path (
        .clk(clk),
        .reset_n(reset_n),
        .en_x(en_x),
        .Color(Color),
        .x(x),
        .y(y),
        .f(f),
        .SetColor(SetColor),
        .plot(plot)
    );
endmodule
