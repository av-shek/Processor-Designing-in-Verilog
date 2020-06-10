module ir(iw,op,Ra,Rb,Rd,func,imm,addr);
input [15:0] iw; output [3:0]op; 
output [2:0] Ra, Rb, Rd, func; output [5:0] imm; 
output  [6:0] addr;
assign op = iw[15:12]; 
assign Ra = iw[8:6]; 
assign Rb = iw[5:3];
assign Rd = iw[11:9];
assign func = iw[2:0];
assign imm[5:3] = iw[11:9];
assign imm[2:0] = iw[2:0];
assign addr = iw[6:0];
endmodule
