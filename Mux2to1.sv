`timescale 1ns / 1ps

/*
    File Name: Mux2to1.v
    Description: 2 to 1 Mux
    Created by (Author Name): 
    Creation Date:  8/31/2023
    Contributors: 
    Last Modified Date: 8/31/2023
    Version: 1.0
    Copyright (c) Orion VLSI Technologies, 2023
    This unpublished material is proprietary to Orion VLSI Technologies.
    All Rights Reserved Worldwide.
    Anything described herein is considered business secrets and confidential.
    Reproduction or distribution, in whole or in part, is
    forbidden except by express written permission of Orion VLSI Technologies.
*/

module Mux2to1(
    output wire [31:0] output,
    input wire [31:0] data0,
    input wire [31:0] data1,
    input wire select,
);
    assign output = select ? data1 : data0;
endmodule
