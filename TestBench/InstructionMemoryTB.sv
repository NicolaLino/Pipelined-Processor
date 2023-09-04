`timescale 1ns / 1ps

module InstructionMemoryTB;
    
    reg [31:0] address;
    wire [31:0] instruction;
    
    // Instantiate the InstructionMemory module
    InstructionMemory instr_mem(
        .instruction(instruction),
        .address(address)
    );
    
    
    initial begin

        $display("Starting simulation");
        $dumpfile("InstructionMemory_TB.vcd");
		$dumpvars;
                
        // Simulate some instructions in instrmem
 		$readmemb("instructions.txt", instr_mem.instrmem);		   
		
		#100
        #100 address = 0;
        $display("Resetting the module");
        #100 address = 4;
        $display("Instruction at address 4: %h", instruction);
        #100 address = 8;
        $display("Instruction at address 8: %h", instruction);
		#100 address = 12;
        $display("Instruction at address 12: %h", instruction);
        
        
        $display("Simulation finished");
        $finish;
    end
    
endmodule
