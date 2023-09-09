`timescale 1 ps / 100 fs

/*
    File Name: ExtendByte.v
    Description: SIG_ExtByte = 1:Sign/ 0:Zero extension of a byte to 32 bits
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


module ExtendByte(
    output wire [31:0] extendedValue,
    input wire [7:0] byteValue,
    input wire SIG_ExtByte, // 1 for sign extension, 0 for zero extension
);
    wire [31:0] signExtended;
    wire [31:0] zeroExtended;

    assign signExtended = {{24{byteValue[7]}}, byteValue};
    assign zeroExtended = {24'b0, byteValue};

    assign extendedValue = SIG_ExtByte ? signExtended : zeroExtended;
endmodule

