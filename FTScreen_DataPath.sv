`timescale 1ns / 1ps

module FTScreen_DataPath(
    input logic clk,
    input logic reset_n,
    input logic en_x,        
    output logic [2:0] Color,
    output logic [7:0] x,
    output logic [6:0] y,
    output logic f,
    input logic SetColor,
    output logic plot

);
    logic grt_result, eq_result, eqy_result,en_XX;

    n_counter #(.n(8)) countx (
        .clk(clk),
        .reset_n(en_XX),
        .en(en_x),                 
        .count(x)
    );

    n_counter #(.n(7)) county (
        .clk(clk),
        .reset_n(reset_n),
        .en(eq_result),                 
        .count(y)
    );
    
    assign grt_result = ~(x > 159);
    assign eq_result = (x == 159);
    assign eqy_result = (y == 119);
    
    assign en_XX =grt_result & reset_n;
    assign f = eqy_result & eq_result;

    assign Color = (SetColor) ? y[2:0] : 3'b000;
    
    assign plot = en_x;

endmodule
