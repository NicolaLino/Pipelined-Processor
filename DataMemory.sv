`timescale 1 ps / 100 fs 

/*
    File Name: DataMemory.v
    Description: 32 bit comparator module
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


module DataMemory(data, address, dataIn, memWrite, memRead);
    input [31:0] address, dataIn;
    input [1:0] memWrite;
    input memRead;
    output [31:0] data;

    reg [31:0] mem[1023:0];
    reg [31:0] data;

    // Read from memory
    always @(address or dataIn) begin
        if (memRead)
            data = mem[address];
        else
            data = data;
    end

    // Write to memory
    always @(address or dataIn) begin
        case (memWrite)
            2'b01: mem[address] = dataIn;      // Store full word
            2'b10: mem[address][15:0] = dataIn; // Store half word
            2'b11: mem[address][7:0] = dataIn;  // Store byte
            default: dataIn = dataIn;     // Store full word by default
        endcase
    end
endmodule
