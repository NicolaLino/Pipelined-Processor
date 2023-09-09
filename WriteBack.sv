`timescale 1 ps / 100 fs 

/*
    File Name: Wrieback.v
    Description: Write back of the pipeline
    Created by (Author Name):  Nicola Abu Shaibeh
    Creation Date:  09/06/2023
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

module WriteBack(
    output [31:0] writeBackData,
    output [4:0] rdOut,
    output SIG_RegWriteOut,

    input [31:0] ALUout,
    input [31:0] readMemoryData,
    input SIG_WBdata,
    input [4:0] rd,
    input SIG_RegWrite
);

    Mux2to1 Mux2to1_0(
        .result(writeBackData),
        .data0(ALUout),
        .data1(readMemoryData),
        .select(SIG_WBdata)
    );

    assign rdOut = rd;
    assign SIG_RegWriteOut = SIG_RegWrite;

endmodule