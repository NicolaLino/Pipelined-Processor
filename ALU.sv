`timescale 1 ps / 100 fs
/*
    File Name: ALU
    Description: ALU module forlogical and arithmatical oparations in execution stage
    Created by (Author Name): FAYEZ BACKLEH
    Creation Date:  8/27/2023
    Contributors: Adam Shaqir , Hala , dana
    Last Modified Date: 8/30/2023
    Version: 0.5
    Copyright (c) Orion VLSI Technologies, 2023
    This unpublished material is proprietary to Orion VLSI Technologies.
    All Rights Reserved Worldwide.
    Anything described herein is considered business secrets and confidential.
    Reproduction or distribution, in whole or in part, is
    forbidden except by express written permission of Orion VLSI Technologies.
*/


module ALU(aluOuput, carryOut, zero, overflow, negative, BussA, BussB, opcode);
	
    // alu ouputs
	output overflow, negative, zero, carryOut;
	output signed [31:0] aluOuput;
    
	// alu inputs
	input signed [31:0] BussA;
	input signed [31:0] BussB;
	input [4:0] opcode;

	// registers declarations
	reg signed [31:0] BussBComp;
	reg signed [31:0] aluOuput;
	reg overflow, negative, zero, carryOut;
	
	
	// Opcodes of ALU
	parameter 	
				NOOP = 5'b00000,
				ADD  = 5'b00001,
				SUB  = 5'b00010,
				OR   = 5'b00011,
				AND  = 5'b00100,
				XOR  = 5'b00101,
				SLL  = 5'b00110,
				SLR  = 5'b00111,
				SRA  = 5'b01000,
				
				ADDI = 5'b01001,
				ORI  = 5'b01010,
				ANDI = 5'b01011,
				XORI = 5'b01100,
				
				LW = 5'b01101,
				LH = 5'b01110,
				LHU = 5'b01111,				
				LB = 5'b10000,
				LBU = 5'b10001,
				SW = 5'b10010,
				SH = 5'b10011,
				SB = 5'b10100;
				//BEQ = 5'b10101,
				//BNE = 5'b10110,
				
				//JUMP = 5'b10111,
				//CALL = 5'b11000,
				//CALL = 5'b11001,
				//RET = 5'b11010,
				
	always @(BussA, BussB, opcode) begin
		case (opcode)
				// R-type instrucitons
			ADD: begin
				aluOuput = BussA + BussB;
				carryOut = (BussA[31] && BussB[31]) || (!aluOuput[31] && (BussA[31] || BussB[31]));
				if ((BussA[31] && BussB[31]) && !aluOuput[31]) overflow = 1'b1;
				else if ((!BussA[31] && !BussB[31]) && aluOuput[31]) overflow = 1'b1;
				else overflow = 1'b0;
			end
			
			SUB: begin
				BussBComp = ~BussB + 1;
				aluOuput = BussA + BussBComp;
				carryOut = (BussA[31] && BussBComp[31]) || (!aluOuput[31] && (BussA[31] || BussBComp[31]));
				if ((BussA[31] && BussBComp[31]) && !aluOuput[31]) overflow = 1'b1;
				else if ((!BussA[31] && !BussBComp[31]) && aluOuput[31]) overflow = 1'b1;
				else overflow = 1'b0;
			end
			
			OR: begin
				aluOuput = BussA | BussB;
				overflow = 1'b0;
				carryOut = 1'b0;
			end
		
			AND: begin
				aluOuput = BussA & BussB;
				overflow = 1'b0;
				carryOut = 1'b0;
			end
			
			
			XOR: begin
				aluOuput = BussA ^ BussB;
				overflow = 1'b0;
				carryOut = 1'b0;
			end
			
			SLL: begin
				aluOuput = BussA << BussB;
				overflow = 1'b0;
				carryOut = 1'b0;
			end
			
			
			SLR: begin
				aluOuput = BussA >> BussB;
				overflow = 1'b0;
				carryOut = 1'b0;
			end
			
			SRA: begin
				aluOuput = BussA >>> BussB;
				overflow = 1'b0;
				carryOut = 1'b0;
			end
			
			// I-type instructions		
			ADDI: begin
				aluOuput = BussA + BussB;
				carryOut = (BussA[31] && BussB[31]) || (!aluOuput[31] && (BussA[31] || BussB[31]));
				if ((BussA[31] && BussB[31]) && !aluOuput[31]) overflow = 1'b1;
				else if ((!BussA[31] && !BussB[31]) && aluOuput[31]) overflow = 1'b1;
				else overflow = 1'b0;
			end
			
		
			ORI: begin
				aluOuput = BussA | BussB;
				overflow = 1'b0;
				carryOut = 1'b0;
			end
			
		
			ANDI: begin
				aluOuput = BussA & BussB;
				overflow = 1'b0;
				carryOut = 1'b0;
			end
			
			
			XORI: begin
				aluOuput = BussA ^ BussB;
				overflow = 1'b0;
				carryOut = 1'b0;
			end
				
			
			LW: begin
				aluOuput = BussA + BussB;
				carryOut = (BussA[31] && BussB[31]) || (!aluOuput[31] && (BussA[31] || BussB[31]));
				if ((BussA[31] && BussB[31]) && !aluOuput[31]) overflow = 1'b1;
				else if ((!BussA[31] && !BussB[31]) && aluOuput[31]) overflow = 1'b1;
				else overflow = 1'b0;
			end
					
					
			LH: begin
				aluOuput = BussA + BussB;
				carryOut = (BussA[31] && BussB[31]) || (!aluOuput[31] && (BussA[31] || BussB[31]));
				if ((BussA[31] && BussB[31]) && !aluOuput[31]) overflow = 1'b1;
				else if ((!BussA[31] && !BussB[31]) && aluOuput[31]) overflow = 1'b1;
				else overflow = 1'b0;
			end
				
				
				
						
			LB: begin
					aluOuput = BussA + BussB;
					carryOut = (BussA[31] && BussB[31]) || (!aluOuput[31] && (BussA[31] || BussB[31]));
					if ((BussA[31] && BussB[31]) && !aluOuput[31]) overflow = 1'b1;
					else if ((!BussA[31] && !BussB[31]) && aluOuput[31]) overflow = 1'b1;
					else overflow = 1'b0;
			end
				
					
			LHU: begin
				aluOuput = BussA + BussB;
				carryOut = (BussA[31] && BussB[31]) || (!aluOuput[31] && (BussA[31] || BussB[31]));
				if ((BussA[31] && BussB[31]) && !aluOuput[31]) overflow = 1'b1;
				else if ((!BussA[31] && !BussB[31]) && aluOuput[31]) overflow = 1'b1;
				else overflow = 1'b0;
			end
			
			LBU: begin
				aluOuput = BussA + BussB;
				carryOut = (BussA[31] && BussB[31]) || (!aluOuput[31] && (BussA[31] || BussB[31]));
				if ((BussA[31] && BussB[31]) && !aluOuput[31]) overflow = 1'b1;
				else if ((!BussA[31] && !BussB[31]) && aluOuput[31]) overflow = 1'b1;
				else overflow = 1'b0;
			end
					
					
			SW: begin
				aluOuput = BussA + BussB;
				carryOut = (BussA[31] && BussB[31]) || (!aluOuput[31] && (BussA[31] || BussB[31]));
				if ((BussA[31] && BussB[31]) && !aluOuput[31]) overflow = 1'b1;
				else if ((!BussA[31] && !BussB[31]) && aluOuput[31]) overflow = 1'b1;
				else overflow = 1'b0;
			end
				
				
			SH: begin
				aluOuput = BussA + BussB;
				carryOut = (BussA[31] && BussB[31]) || (!aluOuput[31] && (BussA[31] || BussB[31]));
				if ((BussA[31] && BussB[31]) && !aluOuput[31]) overflow = 1'b1;
				else if ((!BussA[31] && !BussB[31]) && aluOuput[31]) overflow = 1'b1;
				else overflow = 1'b0;
			end
			
			
			SB: begin
				aluOuput = BussA + BussB;
				carryOut = (BussA[31] && BussB[31]) || (!aluOuput[31] && (BussA[31] || BussB[31]));
				if ((BussA[31] && BussB[31]) && !aluOuput[31]) overflow = 1'b1;
				else if ((!BussA[31] && !BussB[31]) && aluOuput[31]) overflow = 1'b1;
				else overflow = 1'b0;
			end
			
			default: begin
				aluOuput = 32'bx;
				overflow = 1'bx;
				carryOut = 1'bx;
			end
		endcase
	end
	
	
	// zero and negative for all cases
	always @(aluOuput) begin
		if (!aluOuput) zero = 1'b1;
		else zero = 1'b0;

		if (aluOuput[31]) negative = 1'b1;
		else negative = 1'b0;
	end
endmodule