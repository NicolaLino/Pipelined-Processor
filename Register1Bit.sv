`timescale 1 ps / 100 fs
/*
    File Name: Register1Bit.v
    Description: 1 bit register
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

module Register1Bit(
    output wire data_out,
    input wire data_in,
    input wire clk,
    input wire reset,
);
    reg reg_data;

    always @(posedge clk or posedge reset) begin
        if (reset)
            reg_data <= 1'b0;
        else
            reg_data <= data_in;
    end

    assign data_out = reg_data;
endmodule
