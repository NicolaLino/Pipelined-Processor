`timescale 1 ps / 100 fs
/*
    File Name: ExtendHalfWord.v
    Description: SIG_ExtHalf: 1:Sign/0:Zero extension of 16-bit half word to 32-bit word
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

module ExtendHalfWord(
    output wire [31:0] extendedValue,
    input wire [15:0] halfWord,
    input wire SIG_ExtHalf // 1 for sign extension, 0 for zero extension
);
    wire [31:0] signExtended;
    wire [31:0] zeroExtended;

    assign signExtended = {{16{halfWord[15]}}, halfWord};
    assign zeroExtended = {16'b0, halfWord};

    assign extendedValue = SIG_ExtHalf ? signExtended : zeroExtended;
endmodule
