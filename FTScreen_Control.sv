`timescale 1ns / 1ps

module FTScreen_Control(
    input logic clk,
    input logic reset_n,
    input logic BTNR,
    output logic SetColor,
    input logic f,
    output logic en_x
);
    typedef enum logic [1:0] {
        IDLE,
        B,
        C
    } state_t;

    state_t current_state, next_state;

    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end

    always_comb begin
        case (current_state)
        
            IDLE: begin
                if (!reset_n) 
                    next_state = B;
                else if (BTNR)
                    next_state = C;
                else
                    next_state = IDLE;
            end
            
            B: begin
                if (f == 1)
                    next_state = IDLE;
                else
                    next_state = B;
            end

            C: begin
                if (f == 1)
                    next_state = IDLE;
                else
                    next_state = C;
            end

            default: next_state = IDLE;
        endcase
    end

    always_comb begin
        case (current_state)
            IDLE: begin
                en_x = 0;
            end
            B: begin
                en_x = 1;
               SetColor=0;

            end
            C: begin
                en_x = 1;
                SetColor=1;
                
            end
            
            default:  en_x = 0;
        endcase
    end
endmodule
