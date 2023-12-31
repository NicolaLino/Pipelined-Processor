`timescale 1 ps / 100 fs

/*
    File Name: StackPointer.v
    Description: This file contains the code for Stack Pointer module.
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


module StackPointer (
    output reg [31:0] data_output,
    output reg is_empty = 1'b1,
    output reg is_full = 1'b0,
    input wire [31:0] data_input,
    input wire stack_push,
    input wire stack_pop,
    input wire clk
    );

    localparam STACK_DEPTH = 4'b1111; 

    reg [31:0] stack_memory [3:0]; 
    reg [3:0] stack_pointer = 4'b0000; 
	reg empty_status = 1;
	reg full_status = 0;

    always @(posedge clk) begin
        if (stack_push && !full_status) begin
            stack_memory[stack_pointer] <= data_input;
            stack_pointer <= stack_pointer + 4'b0001;
        end
        if (stack_pop && !empty_status) begin
            stack_pointer <= stack_pointer - 4'b0001;
        end

        if (stack_pointer == 4'b0000) begin
            is_empty <= 1'b1;
            is_full <= 1'b0;
        end else if (stack_pointer == STACK_DEPTH) begin
            is_full <= 1'b1;
            is_empty <= 1'b0;
        end else begin
            is_full <= 1'b0;
            is_empty <= 1'b0;
        end
    end		  
	
	always @(stack_pointer) begin
        if (stack_pointer == 4'b0000) begin
            empty_status <= 1'b1;
            full_status <= 1'b0;
        end else if (stack_pointer == STACK_DEPTH) begin
            full_status <= 1'b1;
            empty_status <= 1'b0;
        end else begin
            full_status <= 1'b0;
            empty_status <= 1'b0;
        end
    end

    always @(stack_pointer or is_empty) begin
        if (!is_empty) begin
            data_output <= stack_memory[stack_pointer - 4'b0001];
        end
    end
endmodule