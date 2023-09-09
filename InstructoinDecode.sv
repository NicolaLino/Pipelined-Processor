`timescale 1 ps / 100 fs 

/*
    File Name: InstructionDecode.sv
    Description: istruction decode stage of the pipeline
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


module InstructionDecode(
    output [31:0] callRs1Address,
    output [31:0] branchAddress,
    output [31:0] jumpAddress,
    output [31:0] immExtend,
    output [31:0] busA,
    output [31:0] busB,
    output [4:0] rigsterD,
    //signals in fetch stage
    output SIG_EQ,
    output SIG_BEQ,
    output SIG_BNE,
    output SIG_RET,
    output SIG_Call,
    output SIG_Jump,
    output SIG_CALL_RS1,
    //signals in execute stage
    output SIG_ALUSrc,
    output [4:0] SIG_Function,
    //signals in memory stage
    output SIG_ExtByte,
    output SIG_ExtHalf,
    output [1:0] SIG_MemWrite,
    output [1:0] SIG_LoadType,
    output SIG_MemRead,
    //signals in write back stage
    output SIG_WBdata,
    output SIG_RegWrite,
    //inputs
    input [31: 0] instruction,
    input [31: 0] PC4,
    //input form write back stage to write in register file
    input [31:0] WB_BusW,
    input [4:0] WB_RegW,
    input WB_SIG_RegWrite,
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