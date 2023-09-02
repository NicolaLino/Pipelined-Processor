`timescale 1ns / 1ps
module TestBench_Mux2to1;
    // Define signals for the DUT (Design Under Test)
    reg [31:0] data0;
    reg [31:0] data1;
    reg select;
    wire [31:0] result;
    // Instantiate the Mux2to1 module
    Mux2to1 uut (
        .result(result),
        .data0(data0),
        .data1(data1),
        .select(select)
    );

    // Test stimulus
    initial begin
        // Initialize data inputs and select
        data0 = 32'h12345678;
        data1 = 32'hABCDEF01;
        select = 1'b0; // Select data0 initially


        // Specify the dumpfile and dumpvars
        $dumpfile("dumpM2t1.vcd"); // Specify the VCD file name here
        $dumpvars(0, TestBench_Mux2to1); // Dump all signals in the current scope


        // Apply inputs and monitor output
        $display("Time\tData0\tData1\tSelect\tResult");
        for (select = 0; select <= 1; select = select + 1) begin
            $monitor("%0t\t%h\t%h\t%d\t%h", $time, data0, data1, select, result);
            #10; // Advance simulation time
        end
        // Finish simulation
        $finish;
    end
endmodule