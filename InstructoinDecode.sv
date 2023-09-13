`timescale 1 ps / 100 fs 

/*
    File Name: InstructionDecode.sv
    Description: istruction decode stage of the pipeline
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


module InstructionDecode(
    output [31:0] callRs1Address, //call rs1 address output to fetch stage
    output [31:0] branchAddress, //branch address output to fetch stage
    output [31:0] jumpAddress, //jump address output to fetch stage
    output [31:0] immExtend, //extended immediate output to execute stage
    output [31:0] busA, //busA output from register file to execute stage
    output [31:0] busB, //busB output from register file to execute stage
    output [4:0] rigsterD, // destination register 
    //signals in fetch stage
    output SIG_EQ, //  signal to compare rs1 with rs2 
    output SIG_BEQ, // signal to branch if equal
    output SIG_BNE, // signal to branch if not equal
    output SIG_RET, // signal to return from call
    output SIG_Call, // signal to call
    output SIG_Jump, // signal to jump
    output SIG_CALL_RS1, // signal to call rs1
    //signals in execute stage
    output SIG_ALUSrc, // signal to select busB or immExtend
    output [4:0] SIG_Function, // signal to select ALU function
    //signals in memory stage
    output SIG_ExtByte, // signal to extend byte
    output SIG_ExtHalf, // signal to extend half
    output [1:0] SIG_MemWrite, // signal to write in memory
    output [1:0] SIG_LoadType, // signal to load from memory
    output SIG_MemRead, // signal to read from memory
    //signals in write back stage
    output SIG_WBdata, // signal to select data form alu or memory
    output SIG_RegWrite, // signal to write in register file
    //inputs
    input [31: 0] instruction, //instruction input from fetch stage
    input [31: 0] PC4, //PC + 4 input from fetch stage
    //input form write back stage to write in register file
    input [31:0] WB_BusW, //data to write in register file
    input [4:0] WB_RegW, //destination register to write in register file
    input WB_SIG_RegWrite, //signal to write in register file
);
    
    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [4:0] rd;
    wire [4:0] ra, rb;
    wire [4:0] target5Bits;
    wire [16:0] imm17;
    
    wire [4:0] opcode;
	wire [26:0] targetAddress;

    wire SIG_ExtOp;
    wire SIG_RaDst;
    wire SIG_RbDst;

    wire [31:0] signedImmediate;



    assign opcode = instruction[31:27];
    assign rigsterD = instruction[26:22];
    assign rs1 = instruction[21:17];
    assign rs2 = instruction[16:12];
    assign imm17 = instruction[16:0];
    assign targetAddress = instruction[26:0];

    // jump address calculation {The most significant three bits of PC + 4, Target, 00}
    assign jumpAddress = {PC4[31:29], targetAddress, 2'b00};


    // branch address calculation {PC + 4 + (signedImmediate << 2)}
    ExtendImmediate extendImmediate(
        .extImm(immExtend),
        .imm17(imm17),
        .SIG_ExtOp(SIG_ExtOp)
    );

    ShiftLeft shiftLeft(
        .Out32(signedImmediate),
        .In32(immExtend)
    );

    Adder add(
        .sum(branchAddress),
        .operandA(PC4),
        .operandB(signedImmediate)
    );

    // call rs1 address 
    assign target5Bits = targetAddress[26:22];

    // RA selection mux
    Mux2to1 mux2to1Ra(
        .result(ra),
        .data0(rs1),
        .data1(target5Bits),
        .select(SIG_RaDst)
    );

    // RB selection mux
    Mux2to1 mux2to1Rb(
        .result(rb),
        .data0(rigsterD),
        .data1(rs2),
        .select(SIG_RbDst)
    );


    ControlUnit controlUnit(
        .SIG_RaDst(SIG_RaDst),
        .SIG_RbDst(SIG_RbDst),
        .SIG_ALUSrc(SIG_ALUSrc),
        .SIG_WBdata(SIG_WBdata),
        .SIG_RegWrite(SIG_RegWrite),
        .SIG_MemRead(SIG_MemRead),
        .SIG_MemWrite(SIG_MemWrite),
        .SIG_BEQ(SIG_BEQ),
        .SIG_BNE(SIG_BNE),
        .SIG_Jump(SIG_Jump),
        .SIG_CALL_RS1(SIG_CALL_RS1),
        .SIG_LoadType(SIG_LoadType),
        .SIG_ExtOp(SIG_ExtOp),
        .SIG_Function(SIG_Function),
        .SIG_ExtHalf(SIG_ExtHalf),
        .SIG_ExtByte(SIG_ExtByte),
        .SIG_Call(SIG_Call),
        .SIG_RET(SIG_RET),
        .SIG_Opcode(opcode)
    );


    RegisterFile registerFile(
        .ReadData1(busA),
        .ReadData2(busB),
        .WriteData(WB_BusW),
        .ReadRegister1(ra),
        .ReadRegister2(rb),
        .WriteRegister(WB_RegW),
        .RegRead(1'b1),
        .RegWrite(WB_SIG_RegWrite)
    );

    //call rs1 address
    assign callRs1Address = busA;

    // compare rs1 address with rigster rd and set SIG_EQ
    Comparator comparator(
        .SIG_EQ(SIG_EQ),
        .valueA(busA),
        .valueB(busB)
    );
    


endmodule