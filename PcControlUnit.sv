`timescale 1 ps / 100 fs

/*
    File Name: PcControlUnit.v
    Description: This file contains the PcControlUnit module which is used to control the PC source.
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


module PcControlUnit(
    output [2:0] PcSourceOut,
    output SIG_KillOut,
    input SIG_Jump,
    input SIG_Ret,
    input SIG_Bne,
    input SIG_Beq,
    input SIG_CallRs1,
    input SIG_Call,
    input SIG_Eq
);

    reg [2:0] PcSource;
    reg SIG_Kill;

    //PcSource = 3'b000; Pc+4
    //PcSource = 3'b001; jump
    //PcSource = 3'b010; branch
    //PcSource = 3'b011; call rs1
    //PcSource = 3'b100; Ret

    always @(*)
    begin
        // Default values
        PcSource = 3'b000;
        SIG_Kill = 1'b0;

        // Control logic for PcSource
        if (SIG_Ret) begin
            PcSource = 3'b100; // Set to Ret
            SIG_Kill = 1'b1;
        end else if (SIG_Jump || SIG_Call) begin
            PcSource = 3'b001; // Set to jump
            SIG_Kill = 1'b1; 
        end else if ((SIG_Beq && SIG_Eq) || (SIG_Bne && !SIG_Eq)) begin
            PcSource = 3'b010; // Set to branch
            SIG_Kill = 1'b1;
        end else if (SIG_CallRs1) begin
            PcSource = 3'b011; // Set to call rs1
            SIG_Kill = 1'b1;
        end else begin
            PcSource = 3'b000; // Set to Pc+4
            SIG_Kill = 1'b0;
        end
    end

    // Assign module outputs to internal signals
    assign PcSourceOut = PcSource;
    assign SIG_KillOut = SIG_Kill;

endmodule
