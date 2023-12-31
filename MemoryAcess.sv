`timescale 1 ps / 100 fs 

/*
    File Name: MemoryAccess.sv
    Description: Memory Access Module for pipelined RISC-V processor
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



module MemoryAccess(
    output [31:0] ALUout, // ALU result
    output [31:0] readMemoryData, // Data read from memory
    input [31:0] ALUResult, // ALU result
    input [31:0] writeMemoryData, // Data to be written to memory
    input SIG_MEMRead, // Memory read signal
    input [1:0] SIG_MEMWrite, // Memory write signal
    input SIG_ExtHalf, // Half word extension signal
    input SIG_ExtByte, // Byte extension signal
    input [1:0] SIG_LoadType // Load type signal
);

    wire [31:0] dataOut;
    wire [15:0] dataOutHalfWord;
    wire [7:0] dataOutByte;

    wire [31:0] extendedHalfWord;
    wire [31:0] extendedByte;


    DataMemory DM(
        .data(dataOut),
        .address(ALUResult),
        .dataIn(writeMemoryData),
        .memWrite(SIG_MEMWrite),
        .memRead(SIG_MEMRead)
    );

    assign dataOutHalfWord = dataOut[15:0];
    assign dataOutByte = dataOut[7:0];


    ExtendHalfWord EH(
        .extendedValue(extendedHalfWord),
        .halfWord(dataOutHalfWord),
        .SIG_ExtHalf(SIG_ExtHalf)
    );

    ExtendByte EB(
        .extendedValue(extendedByte),
        .byteValue(dataOutByte),
        .SIG_ExtByte(SIG_ExtByte)
    );


    Mux4to1 Mux(
        .result(readMemoryData),
        .data0(dataOut),
        .data1(extendedHalfWord),
        .data2(extendedByte),
        .data3(32'h0),
        .select(SIG_LoadType)
    );



endmodule