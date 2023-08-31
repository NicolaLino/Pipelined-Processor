`timescale 1 ps / 100 fs

/*
    File Name: ShiftLeft.v
    Description: Shift left 2 module
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


////////////////////////////////////////////////// Shift left 2 module 
module ShiftLeft(Out32, In32);
	output [31:0] Out32;
	input [31:0] In32;
	
	assign Out32 = {In32[29:0],2'b00};
endmodule