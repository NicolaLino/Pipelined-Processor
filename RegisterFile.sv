`timescale 1 ps / 100 fs

/*
    File Name: RegisterFile.v
    Description: Register file module for istruction decode stage
    Created by (Author Name): 
    Creation Date:  8/31/2023
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


module RegisterFile(
	ReadData1,//Read data A
	ReadData2, //Read data B
	WriteData, //Write data
	ReadRegister1,//Rs1
	ReadRegister2,//Rs2
	WriteRegister,//Rd
	RegRead, //Read enable
	RegWrite, //Write enable
);
	input [4:0] ReadRegister1, ReadRegister2, WriteRegister;
	input [31:0] WriteData;
	input RegWrite, RegRead;
	output [31:0] ReadData1, ReadData2;

	
	reg [31:0] RegArray [0:31];
	reg [31:0] ReadData1;
	reg [31:0] ReadData2;
	
	//Read data from register
	always @(ReadRegister1 or ReadRegister2 or RegRead) begin
		if (RegRead) begin
			ReadData1 = RegArray[ReadRegister1];
			ReadData2 = RegArray[ReadRegister2];
		end
		else begin
			ReadData1 = ReadData1;
			ReadData2 = ReadData2;
		end
	end

	//Write data to register
	always @(posedge RegWrite) begin
		RegArray[WriteRegister] <= WriteData; //Write data to register
	end
endmodule