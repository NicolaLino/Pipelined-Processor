`timescale 1 ps / 100 fs


module ExtendHalfWord(
    output wire [31:0] extendedValue,
    input wire [15:0] halfWord,
    input wire SIG_ExtHalf // 1 for sign extension, 0 for zero extension
);
    wire [31:0] signExtended;
    wire [31:0] zeroExtended;

    assign signExtended = {{16{halfWord[15]}}, halfWord};
    assign zeroExtended = {16'b0, halfWord};

    assign extendedValue = SIG_ExtHalf ? signExtended : zeroExtended;
endmodule
