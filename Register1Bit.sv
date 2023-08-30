`timescale 1 ps / 100 fs

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
