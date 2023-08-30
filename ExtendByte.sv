`timescale 1 ps / 100 fs


module ExtendByte(
    output wire [31:0] extendedValue,
    input wire [7:0] byte,
    input wire ExtByte, // 1 for sign extension, 0 for zero extension
);
    wire [31:0] signExtended;
    wire [31:0] zeroExtended;

    assign signExtended = {{24{byte[7]}}, byte};
    assign zeroExtended = {24'b0, byte};

    assign extendedValue = ExtByte ? signExtended : zeroExtended;
endmodule

