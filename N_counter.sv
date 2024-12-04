`timescale 1ns / 1ps

module n_counter #(parameter n = 8)(
    input logic clk,
    input logic reset_n,
    input logic en,
    output logic [n-1:0] count
);

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n)       
            count <= 0;  
        else if (en)  
            count <= count + 1;
    end    
    
  

endmodule
