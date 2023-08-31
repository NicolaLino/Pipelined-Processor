`timescale 1ns / 1ps



module Mux4to1(
    output wire [31:0] output,
    input wire [31:0] data0,
    input wire [31:0] data1,
    input wire [31:0] data2,
    input wire [31:0] data3,
    input wire [1:0] select,
);
    assign output = (select == 2'b00) ? data0 :
                    (select == 2'b01) ? data1 :
                    (select == 2'b10) ? data2 :
                                        data3;
endmodule