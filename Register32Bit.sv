`timescale 1 ps / 100 fs


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
