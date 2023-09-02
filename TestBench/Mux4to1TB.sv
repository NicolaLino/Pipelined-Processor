`timescale 1ns / 1ps

module TestBench_Mux4to1;
    // Define signals for the DUT (Design Under Test)
    reg [31:0] data0, data1, data2, data3;
    reg [1:0] select;
    wire [31:0] result;

    // Instantiate the Mux4to1 module
    Mux4to1 uut (
        .result(result),
        .data0(data0),
        .data1(data1),
        .data2(data2),
        .data3(data3),
        .select(select)
    );

    // Initialize inputs
    initial begin
        data0 = 32'h11111111;
        data1 = 32'h22222222;
        data2 = 32'h33333333;
        data3 = 32'h44444444;
        select = 2'b00;

        // Specify the dumpfile and dumpvars
        $dumpfile("MUX4to1.vcd"); // Specify the VCD file name here
        $dumpvars(0, TestBench_Mux4to1); // Dump all signals in the current 

        // Apply inputs and monitor outputs
        #10 data0 = 32'h55555555;
        select = 2'b01;
        #10 data1 = 32'h66666666;
        select = 2'b10;
        #10 data2 = 32'h77777777;
        select = 2'b11;
        #10 data3 = 32'h88888888;



        // Monitor the results
        $display("Time\tSelect\tResult");
        $monitor("%0t\t%h\t%h", $time, select, result);
        
        // Finish simulation
        $finish;
    end
endmodule
