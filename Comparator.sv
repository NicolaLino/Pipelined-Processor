`timescale 1 ps / 100 fs 


module Comparator(
    output wire SIG_EQ,
    input wire [31:0] valueA,
    input wire [31:0] valueB,
);
    assign SIG_EQ = (valueA == valueB) ? 1'b1 : 1'b0;
endmodule






