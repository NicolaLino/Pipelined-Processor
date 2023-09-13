`timescale 1 ps / 100 fs 

/*
    File Name: InstructionFetch.sv
    Description: istruction fetch stage of the pipeline processor 
    Created by (Author Name):  Adam
    Creation Date:  09/06/2023
    Contributors:  Nicola Abu Shaibeh
    Last Modified Date: 
    Version: 1.0
    Copyright (c) Orion VLSI Technologies, 2023
    This unpublished material is proprietary to Orion VLSI Technologies.
    All Rights Reserved Worldwide.
    Anything described herein is considered business secrets and confidential.
    Reproduction or distribution, in whole or in part, is
    forbidden except by express written permission of Orion VLSI Technologies.
*/


module InstructoinFetch (
    output [31:0] instruction, // instruction output to the decode stage
    output [31:0] PC4Out, // input PC + 4 output to the decode stage for branch calculation and target address calculation
    input wire [31:0] callRs1Address, // input address from the decode stage for call Rs1 instruction 
    input wire [31:0] branchAddress, // input address from the decode stage for branch instruction
    input wire [31:0] jumpAddress, // input address from the decode stage for jump instruction
    input wire  SIG_Jump, // input signal from the decode stage for jump instruction
    input wire  SIG_RET, // input signal from the decode stage for return instruction
    input wire  SIG_BNE, // input signal from the decode stage for branch not equal instruction
    input wire  SIG_BEQ, // input signal from the decode stage for branch equal instruction
    input wire  SIG_CALL_RS1, // input signal from the decode stage for call Rs1 instruction
    input wire  SIG_Call, // input signal from the decode stage for call instruction
    input wire  SIG_EQ, // input signal from the decode stage if rs1 == rs2
    input clk, // clock
    input reset // reset
);

    wire [31:0] instructionInMux;
    wire [31:0] retAddress;
    wire [31:0] PC, PCin, PC4;
    wire [2:0] PcSource;
    wire SIG_Kill;
    wire isEmpty, isFull;
    wire stackPush;
    wire stackPop;


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

    assign PC4Out = PC4;

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
    assign stackPop = SIG_RET;

    StackPointer SP(
        .data_output(retAddress),// return address
        .is_empty(isEmpty),
        .is_full(isFull),
        .data_input(PC4),
        .stack_push(stackPush),
        .stack_pop(stackPop),
        .clk(clk)
    );

endmodule