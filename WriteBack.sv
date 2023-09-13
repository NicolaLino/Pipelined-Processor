`timescale 1 ps / 100 fs 

/*
    File Name: Wrieback.v
    Description: Write back of the pipeline
    Created by (Author Name):  Nicola Abu Shaibeh
    Creation Date:  09/06/2023
    Contributors: 
    Last Modified Date: 
    Version: 1.0
    Copyright (c) Orion VLSI Technologies, 2023
    This unpublished material is proprietary to Orion VLSI Technologies.
    All Rights Reserved Worldwide.
    Anything described herein is considered business secrets and confidential.
    Reproduction or distribution, in whole or in part, is
    forbidden except by express written permission of Orion VLSI Technologies.
*/

module WriteBack(
    output [31:0] writeBackData, // Data to be written to the register file
    output [4:0] rdOut, // Destination register
    output SIG_RegWriteOut, // Register write signal

    input [31:0] ALUout, // Data from the ALU
    input [31:0] readMemoryData, // Data from the memory
    input SIG_WBdata, // Selects the data to be written to the register file
    input [4:0] rd, // Destination register
    input SIG_RegWrite // Register write signal
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