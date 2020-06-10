The following project contains the design and implementation of an 8 – bit processor in the hardware description language Verilog. The motivation for the project was the semester project assignment given to us for completion. This document contains the code, data path and the explanation for the various components of CPU done in accordance with the guidelines given in the question. The practical implementation and designing of a data path lead to a better understanding of the interconnections between the components of a CPU. It gives us the bigger or macro level image rather than individual components or micro level aspects. The whole is bigger than the sum of it parts. We have understood this saying during our project time.

# Components
The following implementation is that of an 8-bit processor which has 16-bit instructions.
Following is the list of components we used in our processor:
1. Program Counter (PC): A mod 1 counter of size 8bit.
2. Instruction Memory (IMEM): A memory with 16-bit rows, 256 in number. 1 port
read.
3. Instruction Register (IR): A 16-bit register.
4. Control Unit (CU): A combinational signal generating block.
5. Register file: Contains 8 registers each of size 8-bit. 2 port read; 1 port write
simultaneously.
6. Arithmetic and Logical Unit (ALU): Performs arithmetic operations and generates
the result with flags.
7. Data Memory (DMEM): A memory with 8-bit rows, 256 in number.
8. Other implementation specific logics.
