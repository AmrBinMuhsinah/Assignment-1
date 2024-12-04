`timescale 1ns / 1ps


module compx(
    input logic [7:0] x, 
    output logic eq_result ,
    output logic grt_result 

);

    
    always_comb begin
        if (x == 159 )
            eq_result = 1; 
            else 
               eq_result = 0; 

    end

       always_comb begin
        if (x > 159 )
            grt_result = 1; 
            else 
               grt_result = 0; 

    end

endmodule

