`timescale 1 ps / 100 fs 

/*
    File Name: InstructionFetch.sv
    Description: istruction fetch stage of the pipeline processor 
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


module InstructoinFetch (
    output [31:0] instruction,
    output [31:0] PC4,
    input wire [31:0] callRs1Address,
    input wire [31:0] branchAddress,
    input wire [31:0] jumpAddress,
    input wire  SIG_Jump,
    input wire  SIG_RET,
    input wire  SIG_BNE,
    input wire  SIG_BEQ,
    input wire  SIG_CALL_RS1,
    input wire  SIG_Call,
    input wire  SIG_EQ,
    input clk,
    input reset
    );

    wire [31:0] instructionInMux;
    wire [31:0] retAddress;
    wire [31:0] PC, PCin;
    wire [2:0] PcSource;
    wire SIG_Kill;
    wire isEmpty, isFull;
    wire stackPush;



    Mux8to1 PcMux(
        .result(PCin),
        .data0(PC4),
        .data1(jumpAddress),
        .data2(branchAddress),
        .data3(callRs1Address),
        .data4(retAddress),
        .data5(32'b0),
        .data6(32'b0),
        .data7(32'b0),
        .select(PcSource)
    );//

    Adder PCAdder(
        .sum(PC4),
        .operandA(PC),
        .operandB({29'b0,3'b100})
    );// PC <- PC + 4

    Register32Bit PCReg(
        .data_out(PC),
        .data_in(PCin),
        .enable(1'b1),
        .clk(clk),
        .reset(reset)
    );// PC <- PC + 4

    InstructionMemory IM(
        .instruction(instructionInMux),
        .address(PC)
    );// instruction <- IM[PC]

    PcControlUnit PcCtrl(
        .PcSourceOut(PcSource),
        .SIG_KillOut(SIG_Kill),
        .SIG_Jump(SIG_Jump),
        .SIG_Ret(SIG_RET),
        .SIG_Bne(SIG_BNE),
        .SIG_Beq(SIG_BEQ),
        .SIG_CallRs1(SIG_CALL_RS1),
        .SIG_Call(SIG_Call),
        .SIG_Eq(SIG_EQ)
    );

    Mux2to1 InstructionMux(
        .result(instruction),
        .data0(instructionInMux),
        .data1(32'b0), // Bubble = NOP
        .select(SIG_Kill)
    );// instruction <- IM[PC]

    assign stackPush = (SIG_Call || SIG_CALL_RS1) ? 1'b1 : 1'b0;

    StackPointer SP(
        .data_output(retAddress),// return address
        .is_empty(isEmpty),
        .is_full(isFull),
        .data_input(PC4),
        .stack_push(stackPush),
        .stack_pop(SIG_RET),
        .clk(clk)
    );

endmodule