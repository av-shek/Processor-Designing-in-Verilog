module imem (input [7:0] Addr, output [15:0] iw);
reg [15:0] RAM [255:0]; integer i;

/*initial begin
  RAM[0]= 16'b0000010001000000; // add $2,$1,$0
  RAM[1]= 16'b0100011000001110; // addi $1,$0,30
  RAM[2]= 16'b1011000011100001; // lw $4,1($3)
  RAM[3]= 16'b1111001011010001; // sw $2,9($3) 
  RAM[4]= 16'b0010000000000000; // j 0
  for(i=5;i<256;i++) RAM[i] = 0;
  //$writememh("memfile.dat",RAM);
end*/
initial begin 
$readmemb("memfile.dat",RAM);
//for(i=0;i<256;i++) $display("%b ",RAM[i]);
end
assign iw = RAM[Addr]; // word aligned
endmodule


