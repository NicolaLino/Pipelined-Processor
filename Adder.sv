`timescale 1 ps / 100 fs 



////////////////////////////////////////////////// 32 bit Adder
module Adder(
    output wire [31:0] sum,
    input wire [31:0] operandA,
    input wire [31:0] operandB
    );
    assign sum = operandA + operandB;
endmodule


