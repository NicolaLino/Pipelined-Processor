`timescale 1 ps / 100 fs

/*
    File Name: HazardDetectionUnit.sv
    Description: Hazard Detection Unit module that detects hazards in the pipeline
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


module HazardDetectionUnit(
    output PcWriteEn,
    output IF_ID_WriteEn,
    output stall
    input EX_MemRead,
    input [4:0] EX_Rs2,
    input [4:0] ID_Rs1,
    input [4:0] ID_Rs2,
    input ID_Opcode,
    );

    
    assign stall = ((ID_Rs1 == EX_Rs2) && (ID_Rs1 != 0) && EX_MemRead) || 
                    ((ID_Rs2 == EX_Rs2) && (ID_Rs2 != 0) && EX_MemRead);

    assign PcWriteEn = !(stall || ((ID_Opcode == 5'b11011) || (ID_Opcode == 5'b11000) || (ID_Opcode == 5'b11001)));

    assign IF_ID_WriteEn = !((stall || EX_MemRead) && ((ID_Rs1 == EX_Rs2) || (ID_Rs2 == EX_Rs2)));

endmodule
```