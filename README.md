# Pipelined-Processor
this is a pipelined processor with 5 stages (IF,ID,EX,MEM,WB) and it's written in System Verilog
# Components needed to be implemented
- [x] instruction memory
- [x] Arithmetic Logic Unit
- [x] Register File
- [x] 32-bit Adder
- [x] 32-bit Register
- [x] sign extender and unsigned extender 17 imm to 32 
- [x] Extend half word to 32 with signal ExtHalf `sign` or `zero` `unsigned`
- [x] Extend byte to 32 with signal ExtByte `sign` or `zero` `unsigned`
- [x] shift left 2
- [x] 1 bit register for signals
- [x] comparator
- [x] 32-bit MUX 2:1
- [x] 32-bit MUX 4:1
- [x] 32-bit MUX 8:1
- [x] Control Unit
- [x] Data Memory
- [ ] PC Control Unit
- [ ] Hazard Detection Unit
- [ ] Forwarding Unit

# Components needed to be tested and simulated
- [x] instruction memory
- [ ] Arithmetic Logic Unit
- [ ] Register File
- [x] 32-bit Adder
- [ ] 32-bit Register
- [ ] sign extender and unsigned extender 17 imm to 32 
- [ ] Extend half word to 32 with signal ExtHalf `sign` or `zero` `unsigned`
- [ ] Extend byte to 32 with signal ExtByte `sign` or `zero` `unsigned`
- [ ] shift left 2
- [ ] 1 bit register for signals
- [ ] comparator
- [x] 32-bit MUX 2:1
- [x] 32-bit MUX 4:1
- [x] 32-bit MUX 8:1
- [ ] Control Unit
- [ ] Data Memory
- [ ] PC Control Unit
- [ ] Hazard Detection Unit
- [ ] Forwarding Unit
# After finishing the components we will implement the stages
- [ ] connect the components together in fetch stage
- [ ] connect the components together in decode stage
- [ ] connect the components together in execute stage
- [ ] connect the components together in memory stage
- [ ] connect the components together in write back stage


# After finishing the stages we will implement the processor
- [ ] connect the stages together


