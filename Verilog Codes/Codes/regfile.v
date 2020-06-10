module regfile
  (input clk,
   input regwrite,
   input [2:0] wrAddr,
   input [7:0] wrData,
   input [2:0] rdAddrA,
   output [7:0] rdDataA,
   input [2:0] rdAddrB,
   output [7:0] rdDataB);

   reg [7:0] regs[7:0]; 
   initial begin regs[0] = 0; regs[1] = 1; regs[3] = 12; 
   end
   assign rdDataA = regs[rdAddrA];
   assign rdDataB = regs[rdAddrB];
   

   always @(posedge clk) begin
      if (regwrite)begin regs[wrAddr] = wrData;
	  $display("wraddr = %d, w = %d",wrAddr,regs[wrAddr]);
	  end
   end 
endmodule
