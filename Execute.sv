`timescale 1 ps / 100 fs 

/*
    File Name: Execute.sv
    Description: Execute stage of the pipeline
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


module Execute(
        output [31:0] dataInMemory,
        output [31:0] ALU_Result,
        output zeroFlag,
        output carryOutFlag,
        output overflowFlag,
        output negativeFlag,
        input immediate,
        input [31:0] registerAData,
        input [31:0] registerBData,
        input [31:0] forwardWriteBackData,
        input [4:0] SIG_Function,
        input SIG_ALUSrc,
        input [1:0] SIG_ForwardA, // Forwarding signals set to 0 for now when we implement the whole pipeline we will change it
        input [1:0] SIG_ForwardB, 
);

    wire [31:0] forwardAMuxOut;
    wire [31:0] forwardBMuxOut;
    wire [31:0] muxALUSrcOut;

    Mux4to1 MuxForwardA(
        .result(forwardAMuxOut),
        .data0(registerAData),
        .data1(ALU_Result),
        .data2(forwardWriteBackData),
        .data3(32'h00000000),
        .select(SIG_ForwardA)
    );

    Mux4to1 MuxForwardB(
        .result(forwardBMuxOut),
        .data0(registerBData),
        .data1(ALU_Result),
        .data2(forwardWriteBackData),
        .data3(32'h00000000),
        .select(SIG_ForwardB)
    );

    assign dataInMemory = forwardBMuxOut;

    Mux2to1 MuxALUSrc(
        .result(muxALUSrcOut),
        .data0(forwardBMuxOut),
        .data1(immediate),
        .select(SIG_ALUSrc)
    );

    ALU ALU(
        .aluOuput(ALU_Result),
        .carryOut(carryOutFlag),
        .zero(zeroFlag),
        .overflow(overflowFlag),
        .negative(negativeFlag),
        .BussA(forwardAMuxOut),
        .BussB(muxALUSrcOut),
        .SIG_Opcode(SIG_Function)
    );

endmodule