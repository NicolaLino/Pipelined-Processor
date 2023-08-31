`timescale 1ns / 1ps
/*
    File Name: InstructionMemory
    Description: instruction memory module for instruction fetch stage
    Created by (Author Name): Nicola Abu Shaibeh
    Creation Date:  8/27/2023
    Contributors: 
    Last Modified Date: 8/29/2023
    Version: 1.1
    Copyright (c) Orion VLSI Technologies, 2023
    This unpublished material is proprietary to Orion VLSI Technologies.
    All Rights Reserved Worldwide.
    Anything described herein is considered business secrets and confidential.
    Reproduction or distribution, in whole or in part, is
    forbidden except by express written permission of Orion VLSI Technologies.
*/

module InstructionMemory(
    output [31:0] instruction,
    input [31:0] address
);

    reg [31:0] instrmem [1023:0];

    
    always @(address) begin
        instruction = instrmem[address >> 2];
    end

endmodule