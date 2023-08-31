`timescale 1 ps / 100 fs


module ExtendImmediate(
    output wire [31:0] extImm,
    input wire [16:0] imm17,
    input wire SIG_ExtOp,
);
    wire [15:0] immSign;
    wire [31:0] immUnsigned;

    assign immSign = {{16{imm17[16]}}, imm17};
    assign immUnsigned = {16'b0, imm17};

    assign extImm = SIG_ExtOp ? immSign : immUnsigned;
endmodule
