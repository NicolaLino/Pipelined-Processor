`timescale 1ps / 100fs


module InstructoinFetch_TB;
    reg [31:0] callRs1Address;
    reg [31:0] branchAddress;
    reg [31:0] jumpAddress;
    reg SIG_Jump;
    reg SIG_RET;
    reg SIG_BNE;
    reg SIG_BEQ;
    reg SIG_CALL_RS1;
    reg SIG_Call;
    reg SIG_EQ;
    reg clk;
    reg reset;
    
    wire [31:0] instruction;
    wire [31:0] PC4;

    // Instantiate the module
    InstructoinFetch IFetch (
        .instruction(instruction),
        .PC4(PC4),
        .callRs1Address(callRs1Address),
        .branchAddress(branchAddress),
        .jumpAddress(jumpAddress),
        .SIG_Jump(SIG_Jump),
        .SIG_RET(SIG_RET),
        .SIG_BNE(SIG_BNE),
        .SIG_BEQ(SIG_BEQ),
        .SIG_CALL_RS1(SIG_CALL_RS1),
        .SIG_Call(SIG_Call),
        .SIG_EQ(SIG_EQ),
        .clk(clk),
        .reset(reset)
    );

    // Clock generation
    always begin
        #50 clk = ~clk;
    end

    // Initialize signals
    initial begin
        callRs1Address = 32'h11111111;
        branchAddress = 32'h22222222;
        jumpAddress = 32'h33333333;
        SIG_Jump = 1'b0;
        SIG_RET = 1'b0;
        SIG_BNE = 1'b0;
        SIG_BEQ = 1'b0;
        SIG_CALL_RS1 = 1'b0;
        SIG_Call = 1'b0;
        SIG_EQ = 1'b0;
        clk = 0;
        reset = 0;
        
        // Apply reset
        reset = 1;
        #100 reset = 0;

        // Add your test scenarios here
        
        // Example: Trigger a jump instruction
        #100;
        SIG_Jump = 1'b1;
        SIG_RET = 1'b0;
        SIG_BNE = 1'b0;
        SIG_BEQ = 1'b0;
        SIG_CALL_RS1 = 1'b0;
        SIG_Call = 1'b0;
        SIG_EQ = 1'b0;

        // Example: Trigger a branch instruction
        #100;
        SIG_BNE = 1'b1;
        SIG_Jump = 1'b0;
        SIG_RET = 1'b0;
        SIG_BEQ = 1'b0;
        SIG_CALL_RS1 = 1'b0;
        SIG_Call = 1'b0;
        SIG_EQ = 1'b0;


        // Example: Trigger a call instruction
        #100;
        SIG_CALL_RS1 = 1'b1;
        SIG_Jump = 1'b0;
        SIG_RET = 1'b0;
        SIG_BNE = 1'b0;
        SIG_BEQ = 1'b0;
        SIG_Call = 1'b0;
        SIG_EQ = 1'b0;


        #100;
        SIG_RET = 1'b1;
        SIG_CALL_RS1 = 1'b1;
        SIG_Jump = 1'b0;
        SIG_BNE = 1'b0;
        SIG_BEQ = 1'b0;
        SIG_Call = 1'b0;
        SIG_EQ = 1'b0;

        
        #100;
        SIG_Jump = 1'b0;
        SIG_RET = 1'b0;
        SIG_BNE = 1'b0;
        SIG_BEQ = 1'b0;
        SIG_CALL_RS1 = 1'b0;
        SIG_Call = 1'b0;
        SIG_EQ = 1'b0;

        #100;

        // Finish simulation
        $finish;
    end

endmodule
