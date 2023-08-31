`timescale 1 ps / 100 fs
/*
    File Name: ExtendImmediate.v
    Description: Extends the immediate value to 32 bits
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

module ExtendImmediate(
    output wire [31:0] extImm,
    input wire [16:0] imm17,
    input wire SIG_ExtOp,
);
    wire [15:0] immSign;
    wire [31:0] immUnsigned;

    assign immSign = {{16{imm17[16]}}, imm17};
    assign immUnsigned = {16'b0, imm17};

    assign extImm = SIG_ExtOp ? immSign : immUnsigned;
endmodule
