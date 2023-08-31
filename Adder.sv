`timescale 1 ps / 100 fs 

/*
    File Name: Adder.v
    Description: 32 bit Adder
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


////////////////////////////////////////////////// 32 bit Adder
module Adder(
    output wire [31:0] sum,
    input wire [31:0] operandA,
    input wire [31:0] operandB
    );
    assign sum = operandA + operandB;
endmodule


