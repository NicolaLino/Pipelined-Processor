`timescale 1ns / 1ps

module TestBench_Mux8to1;
    // Define signals for the DUT (Design Under Test)
    reg [31:0] data0, data1, data2, data3, data4, data5, data6, data7;
    reg [2:0] select;
    wire [31:0] result;

    // Instantiate the Mux8to1 module
    Mux8to1 uut (
        .result(result),
        .data0(data0),
        .data1(data1),
        .data2(data2),
        .data3(data3),
        .data4(data4),
        .data5(data5),
        .data6(data6),
        .data7(data7),
        .select(select)
    );

    // Initialize inputs
    initial begin
        data0 = 32'h11111111;
        data1 = 32'h22222222;
        data2 = 32'h33333333;
        data3 = 32'h44444444;
        data4 = 32'h55555555;
        data5 = 32'h66666666;
        data6 = 32'h77777777;
        data7 = 32'h88888888;
        select = 3'b000;

        // Specify the dumpfile and dumpvars
        $dumpfile("MUX8to1.vcd"); // Specify the VCD file name here
        $dumpvars(0, TestBench_Mux8to1); // Dump all signals in the current scope

        // Apply inputs and change the select signal to different values
        #10 select = 3'b001;
        #10 select = 3'b010;
        #10 select = 3'b011;
        #10 select = 3'b100;
        #10 select = 3'b101;
        #10 select = 3'b110;
        #10 select = 3'b111;

        // Monitor the results
        $display("Time\tSelect\tResult");
        $monitor("%0t\t%h\t%h", $time, select, result);

        // Finish simulation
        $finish;
    end
endmodule
