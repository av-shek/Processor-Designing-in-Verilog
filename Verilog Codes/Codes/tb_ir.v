module 
tb_ir;
reg [15:0] iw = 16'b0000010001100101;
wire [3:0]op; wire [2:0] Ra,Rb,Rd,func; wire [5:0]imm; wire [6:0]addr;
ir r(iw,op,Ra,Rb,Rd,func,imm,addr);
initial $monitor("iw = %b, op = %b, Ra = %b, Rb = %b, Rd = %b, func = %b, imm = %b, addr = %b",iw,op,Ra,Rb,Rd,func,imm,addr);
endmodule