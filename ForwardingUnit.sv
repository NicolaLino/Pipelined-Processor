`timescale 1 ps / 100 fs

/*
    File Name: ForwardingUnit.sv
    Description: Forwarding Unit module for the processor that will be used to forward the data from the EX/MEM and MEM/WB pipeline registers to the ALU.
    Created by (Author Name): 
    Creation Date:  9/2/2023
    Contributors: 
    Last Modified Date: 9/2/2023
    Version: 1.0
    Copyright (c) Orion VLSI Technologies, 2023
    This unpublished material is proprietary to Orion VLSI Technologies.
    All Rights Reserved Worldwide.
    Anything described herein is considered business secrets and confidential.
    Reproduction or distribution, in whole or in part, is
    forbidden except by express written permission of Orion VLSI Technologies.
*/


module ForwardingUnit(
    output [1:0] ForwardA,
    output [1:0] ForwardB,
    input [4:0] EX_Rs1,
    input [4:0] EX_Rs2,
    input [4:0] MEM_Rd,
    input [4:0] WB_Rd,
    input MEM_RegWrite,
    input WB_RegWrite,
);


    reg [1:0] ForwardA;
    reg [1:0] ForwardB;

    always @(*) begin
        {ForwardA, ForwardB} = 2'b00;

        // Determine forwarding control signals for Rs1 (ForwardA)
        if (MEM_RegWrite && EX_Rs1 == MEM_Rd) ForwardA = 2'b01; //
        else if (WB_RegWrite && EX_Rs1 == WB_Rd) ForwardA = 2'b10;

        // Determine forwarding control signals for Rs2 (ForwardB)
        if (MEM_RegWrite && EX_Rs2 == MEM_Rd) ForwardB = 2'b01; //
        else if (WB_RegWrite && EX_Rs2 == WB_Rd) ForwardB = 2'b10;

    end
    
endmodule
