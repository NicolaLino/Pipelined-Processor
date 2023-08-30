`timescale 1 ps / 100 fs 


module Comparator(
    output wire isEqual,
    input wire [31:0] valueA,
    input wire [31:0] valueB,
);
    assign isEqual = (valueA == valueB) ? 1'b1 : 1'b0;
endmodule






