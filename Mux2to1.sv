`timescale 1ns / 1ps


module Mux2to1(
    output wire [31:0] output,
    input wire [31:0] data0,
    input wire [31:0] data1,
    input wire select,
);
    assign output = select ? data1 : data0;
endmodule
