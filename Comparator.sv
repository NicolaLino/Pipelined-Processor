`timescale 1 ps / 100 fs 

/*
    File Name: Comparator.v
    Description: 32 bit comparator module
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

module Comparator(
    output wire SIG_EQ,
    input wire [31:0] valueA,
    input wire [31:0] valueB,
);
    assign SIG_EQ = (valueA == valueB) ? 1'b1 : 1'b0;
endmodule






