`timescale 1 ps / 100 fs
/*
    File Name: Register32Bit.v
    Description: 32 bit register
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

//////////////////////////////////////////////////	 32 bit register 		  
module Register32Bit(
    output wire [31:0] data_out,
    input wire [31:0] data_in,
    input wire enable,
    input wire clk,
    input wire reset,
    );
    reg [31:0] reg_data;

    always @(posedge clk or posedge reset) begin
        if (reset)
            reg_data <= 0;
        else if (enable)
            reg_data <= data_in;
    end

    assign data_out = reg_data;
endmodule
