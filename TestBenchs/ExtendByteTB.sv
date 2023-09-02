`timescale 1 ps / 100 fs

module TestBench_ExtendByte;
    // Define signals for the DUT (Design Under Test)
    reg [7:0] byte;
    reg SIG_ExtByte;
    wire [31:0] extendedValue;

    // Instantiate the ExtendByte module
    ExtendByte uut (
        .extendedValue(extendedValue),
        .byte(byte),
        .SIG_ExtByte(SIG_ExtByte)
    );

    // Initialize inputs
    initial begin
        byte = 8'hFF; // Input byte to be extended
        SIG_ExtByte = 1; // Sign extension (change to 0 for zero extension)

        // Specify the dumpfile and dumpvars
        $dumpfile("ExtendByte.vcd"); // Specify the VCD file name here
        $dumpvars(0, TestBench_ExtendByte); // Dump all signals in the current scope


        // Apply inputs
        #10 byte = 8'h3F; // Change the input byte

        // Monitor the results
        $display("Time\tByte\tSIG_ExtByte\tExtendedValue");
        $monitor("%0t\t%h\t%b\t%h", $time, byte, SIG_ExtByte, extendedValue);

        // Finish simulation
        $finish;
    end
endmodule
