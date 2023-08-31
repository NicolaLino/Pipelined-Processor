

/*
    File Name: ControlUnit.v
    Description: Control Unit in decode stage for all control signals
    Created by (Author Name): Dana & Hala
    Creation Date:  8/31/2023
    Contributors: Adam
    Last Modified Date: 8/31/2023
    Version: 1.0
    Copyright (c) Orion VLSI Technologies, 2023
    This unpublished material is proprietary to Orion VLSI Technologies.
    All Rights Reserved Worldwide.
    Anything described herein is considered business secrets and confidential.
    Reproduction or distribution, in whole or in part, is
    forbidden except by express written permission of Orion VLSI Technologies.
*/

module ControlUnit (
    output wire  SIG_RaDst,
    output wire  SIG_RbDst,
    output wire  SIG_ALUSrc,
    output wire  SIG_WBdata,
    output wire  SIG_RegWrite,
    output wire  SIG_MemRead,
    output wire  [1:0] SIG_MemWrite,
    output wire  SIG_BEQ,
    output wire  SIG_BNE,
    output wire  SIG_Jump,
    output wire  SIG_CALL_RS1,
    output wire  [1:0] SIG_LoadType,
    output wire  SIG_ExtOp,
    output wire  [4:0] SIG_Function,
    output wire  SIG_ExtHalf,
    output wire  SIG_ExtByte,
    output wire  SIG_Call,
    output wire  SIG_RET,
    input wire [4:0] SIG_Opcode
);

parameter 
        ADD  = 5'b00001,
        SUB  = 5'b00010,
        OR  = 5'b00011,
        AND  = 5'b00100,
        XOR  = 5'b00101,
        SLL  = 5'b00110,
        SLR  = 5'b00111,
        SRA = 5'b01000,
        ADDI  = 5'b01001,
        ORI = 5'b01010,
        ANDI = 5'b01011,
        XORI= 5'b01100,
        LW= 5'b01101,
        LH = 5'b01110,
        LHU = 5'b01111,
        LB = 5'b10000,
        LBU = 5'b10001,
        SW = 5'b10010,
        SH = 5'b10011,
        SB = 5'b10100,
        BEQ = 5'b10101,
        BNE = 5'b10110,
        JUMP = 5'b10111,
        CALL = 5'b11000,
        CALL_RS1= 5'b11001,
        RET = 5'b11010;
    
    always @(*)
        begin
            case (SIG_Opcode)
                            
                                    
                ADD: begin // ADD
                    SIG_RaDst = 1'b0;
                    SIG_RbDst = 1'b1;
                    SIG_ALUSrc = 1'b0;
                    SIG_WBdata = 1'b0;
                    SIG_RegWrite = 1'b1;
                    SIG_MemRead = 1'b0;
                    SIG_MemWrite = 2'b00;
                    SIG_BEQ = 1'b0;
                    SIG_BNE = 1'b0;
                    SIG_Jump= 1'b0;
                    SIG_CALL_RS1 = 1'b0;
                    SIG_LoadType = 2'b00;
                    SIG_ExtOp = 1'b0;
                    SIG_Function = 5'b00001;
                    SIG_ExtHalf = 1'b0;
                    SIG_ExtByte = 1'b0;
                    SIG_Call = 1'b0;
                    SIG_RET = 1'b0;
                end
                
                    
                SUB: begin // SUB
                    SIG_RaDst = 1'b0;
                    SIG_RbDst = 1'b1;
                    SIG_ALUSrc = 1'b0;
                    SIG_WBdata = 1'b0;
                    SIG_RegWrite = 1'b1;
                    SIG_MemRead = 1'b0;
                    SIG_MemWrite = 2'b00;
                    SIG_BEQ = 1'b0;
                    SIG_BNE = 1'b0;
                    SIG_Jump= 1'b0;
                    SIG_CALL_RS1 = 1'b0;
                    SIG_LoadType = 2'b00;
                    SIG_ExtOp = 1'b0;
                    SIG_Function = 5'b00010;
                    SIG_ExtHalf = 1'b0;
                    SIG_ExtByte = 1'b0;
                    SIG_Call = 1'b0;
                    SIG_RET = 1'b0;
                    
                end

                OR: begin // OR
                    SIG_RaDst = 1'b0;
                    SIG_RbDst = 1'b1;
                    SIG_ALUSrc = 1'b0;
                    SIG_WBdata = 1'b0;
                    SIG_RegWrite = 1'b1;
                    SIG_MemRead = 1'b0;
                    SIG_MemWrite = 2'b00;
                    SIG_BEQ = 1'b0;
                    SIG_BNE = 1'b0;
                    SIG_Jump= 1'b0;
                    SIG_CALL_RS1 = 1'b0;
                    SIG_LoadType = 2'b00;
                    SIG_ExtOp = 1'b0;
                    SIG_Function = 5'b00011;
                    SIG_ExtHalf = 1'b0;
                    SIG_ExtByte = 1'b0;
                    SIG_Call = 1'b0;
                    SIG_RET = 1'b0;
                    
                end

                AND: begin // AND
                    SIG_RaDst = 1'b0;
                    SIG_RbDst = 1'b1;
                    SIG_ALUSrc = 1'b0;
                    SIG_WBdata = 1'b0;
                    SIG_RegWrite = 1'b1;
                    SIG_MemRead = 1'b0;
                    SIG_MemWrite = 2'b00;
                    SIG_BEQ = 1'b0;
                    SIG_BNE = 1'b0;
                    SIG_Jump= 1'b0;
                    SIG_CALL_RS1 = 1'b0;
                    SIG_LoadType = 2'b00;
                    SIG_ExtOp = 1'b0;
                    SIG_Function = 5'b00100;
                    SIG_ExtHalf = 1'b0;
                    SIG_ExtByte = 1'b0;
                    SIG_Call = 1'b0;
                    SIG_RET = 1'b0;
                    
                end

                XOR: begin // XOR
                    SIG_RaDst = 1'b0;
                    SIG_RbDst = 1'b1;
                    SIG_ALUSrc = 1'b0;
                    SIG_WBdata = 1'b0;
                    SIG_RegWrite = 1'b1;
                    SIG_MemRead = 1'b0;
                    SIG_MemWrite = 2'b00;
                    SIG_BEQ = 1'b0;
                    SIG_BNE = 1'b0;
                    SIG_Jump= 1'b0;
                    SIG_CALL_RS1 = 1'b0;
                    SIG_LoadType = 2'b00;
                    SIG_ExtOp = 1'b0;
                    SIG_Function = 5'b00101;
                    SIG_ExtHalf = 1'b0;
                    SIG_ExtByte = 1'b0;
                    SIG_Call = 1'b0;
                    SIG_RET = 1'b0;
                    
                end

                SLL: begin // SLL
                    SIG_RaDst = 1'b0;
                    SIG_RbDst = 1'b1;
                    SIG_ALUSrc = 1'b0;
                    SIG_WBdata = 1'b0;
                    SIG_RegWrite = 1'b1;
                    SIG_MemRead = 1'b0;
                    SIG_MemWrite = 2'b00;
                    SIG_BEQ = 1'b0;
                    SIG_BNE = 1'b0;
                    SIG_Jump= 1'b0;
                    SIG_CALL_RS1 = 1'b0;
                    SIG_LoadType = 2'b00;
                    SIG_ExtOp = 1'b0;
                    SIG_Function = 5'b00110;
                    SIG_ExtHalf = 1'b0;
                    SIG_ExtByte = 1'b0;
                    SIG_Call = 1'b0;
                    SIG_RET = 1'b0;
                    
                end

                SLR: begin // SLR
                    SIG_RaDst = 1'b0;
                    SIG_RbDst = 1'b1;
                    SIG_ALUSrc = 1'b0;
                    SIG_WBdata = 1'b0;
                    SIG_RegWrite = 1'b1;
                    SIG_MemRead = 1'b0;
                    SIG_MemWrite = 2'b00;
                    SIG_BEQ = 1'b0;
                    SIG_BNE = 1'b0;
                    SIG_Jump= 1'b0;
                    SIG_CALL_RS1 = 1'b0;
                    SIG_LoadType = 2'b00;
                    SIG_ExtOp = 1'b0;
                    SIG_Function = 5'b00111;
                    SIG_ExtHalf = 1'b0;
                    SIG_ExtByte = 1'b0;
                    SIG_Call = 1'b0;
                    SIG_RET = 1'b0;
                    
                end

                SRA: begin // SRA
                    SIG_RaDst = 1'b0;
                    SIG_RbDst = 1'b1;
                    SIG_ALUSrc = 1'b0;
                    SIG_WBdata = 1'b0;
                    SIG_RegWrite = 1'b1;
                    SIG_MemRead = 1'b0;
                    SIG_MemWrite = 2'b00;
                    SIG_BEQ = 1'b0;
                    SIG_BNE = 1'b0;
                    SIG_Jump= 1'b0;
                    SIG_CALL_RS1 = 1'b0;
                    SIG_LoadType = 2'b00;
                    SIG_ExtOp = 1'b0;
                    SIG_Function = 5'b01000;
                    SIG_ExtHalf = 1'b0;
                    SIG_ExtByte = 1'b0;
                    SIG_Call = 1'b0;
                    SIG_RET = 1'b0;
                    
                end
                
                ADDI: begin // ADDI
                    SIG_RaDst = 1'b0;
                    SIG_RbDst = 1'bx;
                    SIG_ALUSrc = 1'b1;
                    SIG_WBdata = 1'b0;
                    SIG_RegWrite = 1'b1;
                    SIG_MemRead = 1'b0;
                    SIG_MemWrite = 2'b00;
                    SIG_BEQ = 1'b0;
                    SIG_BNE = 1'b0;
                    SIG_Jump= 1'b0;
                    SIG_CALL_RS1 = 1'b0;
                    SIG_LoadType = 2'b00;
                    SIG_ExtOp = 1'b1;
                    SIG_Function = 5'b01001;
                    SIG_ExtHalf = 1'b0;
                    SIG_ExtByte = 1'b0;
                    SIG_Call = 1'b0;
                    SIG_RET = 1'b0;
                    
                end
                
                ORI: begin // ORI
                    SIG_RaDst = 1'b0;
                    SIG_RbDst = 1'bx;
                    SIG_ALUSrc = 1'b1;
                    SIG_WBdata = 1'b0;
                    SIG_RegWrite = 1'b1;
                    SIG_MemRead = 1'b0;
                    SIG_MemWrite = 2'b00;
                    SIG_BEQ = 1'b0;
                    SIG_BNE = 1'b0;
                    SIG_Jump= 1'b0;
                    SIG_CALL_RS1 = 1'b0;
                    SIG_LoadType = 2'b00;
                    SIG_ExtOp = 1'b0;
                    SIG_Function = 5'b01010;
                    SIG_ExtHalf = 1'b0;
                    SIG_ExtByte = 1'b0;
                    SIG_Call = 1'b0;
                    SIG_RET = 1'b0;
                    
                end
                
                ANDI : begin // ANDI
                    SIG_RaDst = 1'b0;
                    SIG_RbDst = 1'bx;
                    SIG_ALUSrc = 1'b1;
                    SIG_WBdata = 1'b0;
                    SIG_RegWrite = 1'b1;
                    SIG_MemRead = 1'b0;
                    SIG_MemWrite = 2'b00;
                    SIG_BEQ = 1'b0;
                    SIG_BNE = 1'b0;
                    SIG_Jump= 1'b0;
                    SIG_CALL_RS1 = 1'b0;
                    SIG_LoadType = 2'b00;
                    SIG_ExtOp = 1'b0;
                    SIG_Function = 5'b01011;
                    SIG_ExtHalf = 1'b0;
                    SIG_ExtByte = 1'b0;
                    SIG_Call = 1'b0;
                    SIG_RET = 1'b0;
                
                end
                
                XORI : begin // XORI
                    SIG_RaDst = 1'b0;
                    SIG_RbDst = 1'bx;
                    SIG_ALUSrc = 1'b1;
                    SIG_WBdata = 1'b0;
                    SIG_RegWrite = 1'b1;
                    SIG_MemRead = 1'b0;
                    SIG_MemWrite = 2'b00;
                    SIG_BEQ = 1'b0;
                    SIG_BNE = 1'b0;
                    SIG_Jump= 1'b0;
                    SIG_CALL_RS1 = 1'b0;
                    SIG_LoadType = 2'b00;
                    SIG_ExtOp = 1'b0;
                    SIG_Function = 5'b01100;
                    SIG_ExtHalf = 1'b0;
                    SIG_ExtByte = 1'b0;
                    SIG_Call = 1'b0;
                    SIG_RET = 1'b0;
                
                end
                
                LW : begin // LW
                    SIG_RaDst = 1'b0;
                    SIG_RbDst = 1'bx;
                    SIG_ALUSrc = 1'b1;
                    SIG_WBdata = 1'b1;
                    SIG_RegWrite = 1'b1;
                    SIG_MemRead = 1'b1;
                    SIG_MemWrite = 2'b00;
                    SIG_BEQ = 1'b0;
                    SIG_BNE = 1'b0;
                    SIG_Jump= 1'b0;
                    SIG_CALL_RS1 = 1'b0;
                    SIG_LoadType = 2'b00;
                    SIG_ExtOp = 1'b1;
                    SIG_Function = 5'b01100;
                    SIG_ExtHalf = 1'b0;
                    SIG_ExtByte = 1'b0;
                    SIG_Call = 1'b0;
                    SIG_RET = 1'b0;
                
                end
                LH : begin // LH
                    SIG_RaDst = 1'b0;
                    SIG_RbDst = 1'bx;
                    SIG_ALUSrc = 1'b1;
                    SIG_WBdata = 1'b1;
                    SIG_RegWrite = 1'b1;
                    SIG_MemRead = 1'b1;
                    SIG_MemWrite = 2'b00;
                    SIG_BEQ = 1'b0;
                    SIG_BNE = 1'b0;
                    SIG_Jump= 1'b0;
                    SIG_CALL_RS1 = 1'b0;
                    SIG_LoadType = 2'b01;
                    SIG_ExtOp = 1'b1;
                    SIG_Function = 5'b01110;
                    SIG_ExtHalf = 1'b1;
                    SIG_ExtByte = 1'b0;
                    SIG_Call = 1'b0;
                    SIG_RET = 1'b0;
                    
                end

                LHU: begin // LHU     
                    SIG_RaDst = 1'b0;
                    SIG_RbDst = 1'bx;
                    SIG_ALUSrc = 1'b1;
                    SIG_WBdata = 1'b1;
                    SIG_RegWrite = 1'b1;
                    SIG_MemRead = 1'b1;
                    SIG_MemWrite = 2'b0;
                    SIG_BEQ = 1'b0;
                    SIG_BNE = 1'b0;
                    SIG_Jump= 1'b0;
                    SIG_CALL_RS1 = 1'b0;
                    SIG_LoadType = 2'b01;
                    SIG_ExtOp = 1'b1;
                    SIG_Function = 5'b01111;
                    SIG_ExtHalf = 1'b0;
                    SIG_ExtByte = 1'b1;
                    SIG_Call = 1'b0;
                    SIG_RET = 1'b0;
                end
                
                LB: begin // LB      
                    SIG_RaDst = 1'b0;
                    SIG_RbDst = 1'bx;
                    SIG_ALUSrc = 1'b1;
                    SIG_WBdata = 1'b1;
                    SIG_RegWrite = 1'b1;
                    SIG_MemRead = 1'b1;
                    SIG_MemWrite = 2'b0;
                    SIG_BEQ = 1'b0;
                    SIG_BNE = 1'b0;
                    SIG_Jump= 1'b0;
                    SIG_CALL_RS1 = 1'b0;
                    SIG_LoadType = 2'b00;
                    SIG_ExtOp = 1'b1;
                    SIG_Function = 5'b10000;
                    SIG_ExtHalf = 1'b0;
                    SIG_ExtByte = 1'b1;
                    SIG_Call = 1'b0;
                    SIG_RET = 1'b0;
                end
                
                LBU: begin // LBU       
                    SIG_RaDst = 1'b0;
                    SIG_RbDst = 1'bx;
                    SIG_ALUSrc = 1'b1;
                    SIG_WBdata = 1'b1;
                    SIG_RegWrite = 1'b1;
                    SIG_MemRead = 1'b1;
                    SIG_MemWrite = 2'b0;
                    SIG_BEQ = 1'b0;
                    SIG_BNE = 1'b0;
                    SIG_Jump= 1'b0;
                    SIG_CALL_RS1 = 1'b0;
                    SIG_LoadType = 2'b00;
                    SIG_ExtOp = 1'b1;
                    SIG_Function = 5'b10001;
                    SIG_ExtHalf = 1'b0;
                    SIG_ExtByte = 1'b0;
                    SIG_Call = 1'b0;
                    SIG_RET = 1'b0;
                end
                
                SW: begin // SW
                    SIG_RaDst = 1'b0;
                    SIG_RbDst = 1'b0;
                    SIG_ALUSrc = 1'b1;
                    SIG_WBdata = 1'bx;
                    SIG_RegWrite = 1'b0;
                    SIG_MemRead = 1'b0;
                    SIG_MemWrite = 2'b1;
                    SIG_BEQ = 1'b0;
                    SIG_BNE = 1'b0;
                    SIG_Jump= 1'b0;
                    SIG_CALL_RS1 = 1'b0;
                    SIG_LoadType = 2'b00;
                    SIG_ExtOp = 1'b1;
                    SIG_Function = 5'b10010;
                    SIG_ExtHalf = 1'b0;
                    SIG_ExtByte = 1'b0;
                    SIG_Call = 1'b0;
                    SIG_RET = 1'b0;
                end
                
                SH: begin // SH
                    SIG_RaDst = 1'b0;
                    SIG_RbDst = 1'b0;
                    SIG_ALUSrc = 1'b1;
                    SIG_WBdata = 1'bx;
                    SIG_RegWrite = 1'b0;
                    SIG_MemRead = 1'b0;
                    SIG_MemWrite = 2'b0;
                    SIG_BEQ = 1'b0;
                    SIG_BNE = 1'b0;
                    SIG_Jump= 1'b0;
                    SIG_CALL_RS1 = 1'b0;
                    SIG_LoadType = 2'b00;
                    SIG_ExtOp = 1'b1;
                    SIG_Function = 5'b10011;
                    SIG_ExtHalf = 1'b0;
                    SIG_ExtByte = 1'b0;
                    SIG_Call = 1'b0;
                    SIG_RET = 1'b0;
                end
                
                SB: begin // SB
                    SIG_RaDst = 1'b0;
                    SIG_RbDst = 1'b0;
                    SIG_ALUSrc = 1'b1;
                    SIG_WBdata = 1'bx;
                    SIG_RegWrite = 1'b0;
                    SIG_MemRead = 1'b0;
                    SIG_MemWrite = 2'b1;
                    SIG_BEQ = 1'b0;
                    SIG_BNE = 1'b0;
                    SIG_Jump= 1'b0;
                    SIG_CALL_RS1 = 1'b0;
                    SIG_LoadType = 2'b00;
                    SIG_ExtOp = 1'b1;
                    SIG_Function = 5'b10100;
                    SIG_ExtHalf = 1'b0;
                    SIG_ExtByte = 1'b0;
                    SIG_Call = 1'b0;
                    SIG_RET = 1'b0;
                end
                
                BEQ: begin // BEQ
                    SIG_RaDst = 1'b0;
                    SIG_RbDst = 1'b1;
                    SIG_ALUSrc = 1'bx;
                    SIG_WBdata = 1'bx;
                    SIG_RegWrite = 1'bx;
                    SIG_MemRead = 1'bx;
                    SIG_MemWrite = 2'bx;
                    SIG_BEQ = 1'b1;
                    SIG_BNE = 1'b0;
                    SIG_Jump= 1'b0;
                    SIG_CALL_RS1 = 1'b0;
                    SIG_LoadType = 2'b00;
                    SIG_ExtOp = 1'b1;
                    SIG_Function = 5'b10101;
                    SIG_ExtHalf = 1'b0;
                    SIG_ExtByte = 1'b0;
                    SIG_Call = 1'b0;
                    SIG_RET = 1'b0;
                end
                
                
                BNE: begin // BNE
                    SIG_RaDst = 1'b0;
                    SIG_RbDst = 1'b1;
                    SIG_ALUSrc = 1'bx;
                    SIG_WBdata = 1'bx;
                    SIG_RegWrite = 1'bx;
                    SIG_MemRead = 1'bx;
                    SIG_MemWrite = 2'bx;
                    SIG_BEQ = 1'b0;
                    SIG_BNE = 1'b1;
                    SIG_Jump= 1'b0;
                    SIG_CALL_RS1 = 1'b0;
                    SIG_LoadType = 2'b00;
                    SIG_ExtOp = 1'b1;
                    SIG_Function = 5'b10110;
                    SIG_ExtHalf = 1'b0;
                    SIG_ExtByte = 1'b0;
                    SIG_Call = 1'b0;
                    SIG_RET = 1'b0;
                end
                
                JUMP: begin // JUMP
                    SIG_RaDst = 1'b0;
                    SIG_RbDst = 1'b1;
                    SIG_ALUSrc = 1'bx;
                    SIG_WBdata = 1'bx;
                    SIG_RegWrite = 1'bx;
                    SIG_MemRead = 1'bx;
                    SIG_MemWrite = 2'bx;
                    SIG_BEQ = 1'b0;
                    SIG_BNE = 1'b0;
                    SIG_Jump= 1'b1;
                    SIG_CALL_RS1 = 1'b0;
                    SIG_LoadType = 2'b00;
                    SIG_ExtOp = 1'b0;
                    SIG_Function = 5'b10111;
                    SIG_ExtHalf = 1'b0;
                    SIG_ExtByte = 1'b0;
                    SIG_Call = 1'b0;
                    SIG_RET = 1'b0;
                end
                
                CALL: begin // CALL
                    SIG_RaDst = 1'b0;
                    SIG_RbDst = 1'b1;
                    SIG_ALUSrc = 1'bx;
                    SIG_WBdata = 1'bx;
                    SIG_RegWrite = 1'bx;
                    SIG_MemRead = 1'bx;
                    SIG_MemWrite = 2'bx;
                    SIG_BEQ = 1'b0;
                    SIG_BNE = 1'b0;
                    SIG_Jump= 1'b0;
                    SIG_CALL_RS1 = 1'b0;
                    SIG_LoadType = 2'b00;
                    SIG_ExtOp = 1'b0;
                    SIG_Function = 5'b11000;
                    SIG_ExtHalf = 1'b0;
                    SIG_ExtByte = 1'b0;
                    SIG_Call = 1'b1;
                    SIG_RET = 1'b0;
                end
                
                CALL_RS1: begin // CALL_RS1
                    SIG_RaDst = 1'b1;
                    SIG_RbDst = 1'bx;
                    SIG_ALUSrc = 1'bx;
                    SIG_WBdata = 1'bx;
                    SIG_RegWrite = 1'bx;
                    SIG_MemRead = 1'bx;
                    SIG_MemWrite = 2'bx;
                    SIG_BEQ = 1'b0;
                    SIG_BNE = 1'b0;
                    SIG_Jump= 1'b0;
                    SIG_CALL_RS1 = 1'b1;
                    SIG_LoadType = 2'b00;
                    SIG_ExtOp = 1'b0;
                    SIG_Function = 5'b11001;
                    SIG_ExtHalf = 1'b0;
                    SIG_ExtByte = 1'b0;
                    SIG_Call = 1'b0;
                    SIG_RET = 1'b0;
                    
                end
                    
                RET: begin // RET
                    SIG_RaDst = 1'b0;
                    SIG_RbDst = 1'b1;
                    SIG_ALUSrc = 1'bx;
                    SIG_WBdata = 1'bx;
                    SIG_RegWrite = 1'bx;
                    SIG_MemRead = 1'bx;
                    SIG_MemWrite = 2'bx;
                    SIG_BEQ = 1'b0;
                    SIG_BNE = 1'b0;
                    SIG_Jump= 1'b0;
                    SIG_CALL_RS1 = 1'b0;
                    SIG_LoadType = 2'b00;
                    SIG_ExtOp = 1'b0;
                    SIG_Function = 5'b11010;
                    SIG_ExtHalf = 1'b0;
                    SIG_ExtByte = 1'b0;
                    SIG_Call = 1'b0;
                    SIG_RET = 1'b1;
                    
                end
            endcase
        end 
endmodule
