`timescale 1 ps / 100 fs

module TestBench_ExtendHalfWord;
    // Define signals for the DUT (Design Under Test)
    reg [15:0] halfWord;
    reg SIG_ExtHalf;
    wire [31:0] extendedValue;

    // Instantiate the ExtendHalfWord module
    ExtendHalfWord uut (
        .extendedValue(extendedValue),
        .halfWord(halfWord),
        .SIG_ExtHalf(SIG_ExtHalf)
    );

    // Initialize inputs
    initial begin
        halfWord = 16'hFFFF; // Input half word to be extended
        SIG_ExtHalf = 1; // Sign extension (change to 0 for zero extension)

   // Specify the dumpfile and dumpvars
        $dumpfile("ExtendHalfWord.vcd"); // Specify the VCD file name here
        $dumpvars(0, TestBench_ExtendHalfWord); // Dump all signals in the current scope

        // Apply inputs
        #10 halfWord = 16'h3F3F; // Change the input half word

        // Monitor the results
        $display("Time\tHalfWord\tSIG_ExtHalf\tExtendedValue");
        $monitor("%0t\t%h\t%b\t%h", $time, halfWord, SIG_ExtHalf, extendedValue);

        // Finish simulation
        $finish;
    end
endmodule
