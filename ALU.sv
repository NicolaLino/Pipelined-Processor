`timescale 1 ps / 100 fs
/*
    File Name: ALU
    Description: ALU module forlogical and arithmatical oparations in execution stage
    Created by (Author Name): FAYEZ BACKLEH
    Creation Date:  8/27/2023
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

////////////////////////////////////////////////// ALU 32bit 
module ALU(Output, carryOut, zero, overflow, negative, BussA, BussB, Shamt, controlSignal);
	// alu outputs
	
	output overflow, negative, zero, carryOut;
	output signed [31:0] Output;
	// alu inputs
	
	
	input signed [31:0] BussA;
	input signed [31:0] BussB;
	input [4:0] Shamt;
	input [3:0] controlSignal;

	// registers declarations
	reg signed [31:0] BussBComp;
	reg signed [31:0] Output;
	reg overflow, negative, zero, carryOut;
	
	
	reg [15:0] halfWordA;
    reg [15:0] halfWordB;      
    halfWordA = BussA[15:0];
    halfWordB = BussB[15:0];
    
    
    reg [7:0] byteA;
    reg [7:0] byteB;
    byteA = BussA[7:0];
    byteB = BussB[7:0];	
	
	
	// control signals
	parameter 	
				
				ADD  = 5'b00000,
				SUB  = 5'b00001,
				OR   = 5'b00010,
				AND  = 5'b00011,

				XOR  = 5'b00100,
				SLL  = 5'b00101,
				SLR  = 5'b00110,
				SRA  = 5'b00111,
				
				ADDI = 5'b01000,
				ORI  = 5'b01001,
				ANDI = 5'b01010,
				XORI = 5'b01011,
				
				LW = 5'b01100,
				LH = 5'b01101,
				LHU = 5'b01110,				
				LB = 5'b01111,
				LBU = 5'b10000,

				SW = 5'b10001,
				SH = 5'b10010,
				SB = 5'b10011,

				//BEQ = 5'b10100,
				//BNE = 5'b10101,
				
				//JUMP = 5'b10110,
				//CALL = 5'b10111,
				//CALL = 5'b11000,
				//RET = 5'b11001,
				
	
	always @(BussA, BussB, controlSignal, Shamt) begin
		case (controlSignal)
		
			ADD: begin
					Output = BussA + BussB;
					carryOut = (BussA[31] && BussB[31]) || (!Output[31] && (BussA[31] || BussB[31]));
					if ((BussA[31] && BussB[31]) && !Output[31]) overflow = 1'b1;
					else if ((!BussA[31] && !BussB[31]) && Output[31]) overflow = 1'b1;
					else overflow = 1'b0;
				end
			
			SUB: begin
				BussBComp = ~BussB + 1;
				Output = BussA + BussBComp;
				carryOut = (BussA[31] && BussBComp[31]) || (!Output[31] && (BussA[31] || BussBComp[31]));
				if ((BussA[31] && BussBComp[31]) && !Output[31]) overflow = 1'b1;
				else if ((!BussA[31] && !BussBComp[31]) && Output[31]) overflow = 1'b1;
				else overflow = 1'b0;
			end
			
			OR: begin
				Output = BussA | BussB;
				overflow = 1'b0;
				carryOut = 1'b0;
			end
			
		
			AND: begin
				Output = BussA & BussB;
				overflow = 1'b0;
				carryOut = 1'b0;
			end
			
			
			XOR: begin
				Output = BussA ^ BussB;
				overflow = 1'b0;
				carryOut = 1'b0;
			end
			
			SLL: begin
				Output = BussA << Shamt;
				overflow = 1'b0;
				carryOut = 1'b0;
			end
			
			
			SLR: begin
				Output = BussA >> Shamt;
				overflow = 1'b0;
				carryOut = 1'b0;
			end
			
			SRA: begin
				Output = BussA >>> Shamt;
				overflow = 1'b0;
				carryOut = 1'b0;
			end
					


			ADDI: begin
					Output = BussA + BussB;
					carryOut = (BussA[31] && BussB[31]) || (!Output[31] && (BussA[31] || BussB[31]));
					if ((BussA[31] && BussB[31]) && !Output[31]) overflow = 1'b1;
					else if ((!BussA[31] && !BussB[31]) && Output[31]) overflow = 1'b1;
					else overflow = 1'b0;
			end
			
		
			ORI: begin
				Output = BussA | BussB;
				overflow = 1'b0;
				carryOut = 1'b0;
			end
			
		
			ANDI: begin
				Output = BussA & BussB;
				overflow = 1'b0;
				carryOut = 1'b0;
			end
			
			
			XORI: begin
				Output = BussA ^ BussB;
				overflow = 1'b0;
				carryOut = 1'b0;
			end
			
		
		LW: begin
					Output = BussA + BussB;
					carryOut = (BussA[31] && BussB[31]) || (!Output[31] && (BussA[31] || BussB[31]));
					if ((BussA[31] && BussB[31]) && !Output[31]) overflow = 1'b1;
					else if ((!BussA[31] && !BussB[31]) && Output[31]) overflow = 1'b1;
					else overflow = 1'b0;
			end
				
				
		LH: begin
		            Output = BussA + BussB;
					carryOut = (BussA[31] && BussB[31]) || (!Output[31] && (BussA[31] || BussB[31]));
					if ((BussA[31] && BussB[31]) && !Output[31]) overflow = 1'b1;
					else if ((!BussA[31] && !BussB[31]) && Output[31]) overflow = 1'b1;
					else overflow = 1'b0;
			end
			
			
			
					
		LB: begin
					Output = BussA + BussB;
					carryOut = (BussA[31] && BussB[31]) || (!Output[31] && (BussA[31] || BussB[31]));
					if ((BussA[31] && BussB[31]) && !Output[31]) overflow = 1'b1;
					else if ((!BussA[31] && !BussB[31]) && Output[31]) overflow = 1'b1;
					else overflow = 1'b0;
			end
			
				
		LHU: begin
					
					Output = BussA + BussB;
					carryOut = (BussA[31] && BussB[31]) || (!Output[31] && (BussA[31] || BussB[31]));
					if ((BussA[31] && BussB[31]) && !Output[31]) overflow = 1'b1;
					else if ((!BussA[31] && !BussB[31]) && Output[31]) overflow = 1'b1;
					else overflow = 1'b0;
		end
		
		
		LBU: begin
					Output = BussA + BussB;
					carryOut = (BussA[31] && BussB[31]) || (!Output[31] && (BussA[31] || BussB[31]));
					if ((BussA[31] && BussB[31]) && !Output[31]) overflow = 1'b1;
					else if ((!BussA[31] && !BussB[31]) && Output[31]) overflow = 1'b1;
					else overflow = 1'b0;
		end
				
				
		SW: begin
			Output = BussA + BussB;
			carryOut = (BussA[31] && BussB[31]) || (!Output[31] && (BussA[31] || BussB[31]));
			if ((BussA[31] && BussB[31]) && !Output[31]) overflow = 1'b1;
			else if ((!BussA[31] && !BussB[31]) && Output[31]) overflow = 1'b1;
			else overflow = 1'b0;
		end
			
			
		SH: begin
			
			Output = BussA + BussB;
			carryOut = (BussA[31] && BussB[31]) || (!Output[31] && (BussA[31] || BussB[31]));
			if ((BussA[31] && BussB[31]) && !Output[31]) overflow = 1'b1;
			else if ((!BussA[31] && !BussB[31]) && Output[31]) overflow = 1'b1;
			else overflow = 1'b0;
		end
		
		
		SB: begin
			
			Output = BussA + BussB;
			carryOut = (BussA[31] && BussB[31]) || (!Output[31] && (BussA[31] || BussB[31]));
			if ((BussA[31] && BussB[31]) && !Output[31]) overflow = 1'b1;
			else if ((!BussA[31] && !BussB[31]) && Output[31]) overflow = 1'b1;
			else overflow = 1'b0;
		end
		

			default: begin
				Output = 32'bx;
				overflow = 1'bx;
				carryOut = 1'bx;
			end
		endcase
	end
	// zero and negative for all cases
	always @(Output) begin
		if (!Output) zero = 1'b1;
		else zero = 1'b0;

		if (Output[31]) negative = 1'b1;
		else negative = 1'b0;
	end
endmodule
