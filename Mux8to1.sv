`timescale 1ns / 1ps


module Mux8to1(
    output wire [31:0] output,
    input wire [31:0] data0,
    input wire [31:0] data1,
    input wire [31:0] data2,
    input wire [31:0] data3,
    input wire [31:0] data4,
    input wire [31:0] data5,
    input wire [31:0] data6,
    input wire [31:0] data7,
    input wire [2:0] select,
);
    assign output = (select == 3'b000) ? data0 :
                    (select == 3'b001) ? data1 :
                    (select == 3'b010) ? data2 :
                    (select == 3'b011) ? data3 :
                    (select == 3'b100) ? data4 :
                    (select == 3'b101) ? data5 :
                    (select == 3'b110) ? data6 :
                                        data7;
endmodule
