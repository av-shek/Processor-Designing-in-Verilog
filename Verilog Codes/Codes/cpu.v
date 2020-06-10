module cpu;

wire [7:0] addri,addrb,immex,addrex,d2,d1,b,wdata,ra,rb;
wire [2:0] imfunc,func,oper,Ra,Rd,Rb,wraddr,rd1;
wire [3:0] op;
wire [5:0] imm; 
wire [6:0] addr; 
wire [15:0] iw;
wire  jump,memtoreg,memwrite,regwrite,alusrc,branch,iszero; 
reg clk0,clk1, reset,load,enable;

pc pc0(addri,load,addrb, enable, clk1, reset);

imem imem0(addrb,iw);

ir ir0(iw,op,Ra,Rb,Rd,func,imm,addr);

CU CU0(op,jump,memtoreg,memwrite,regwrite,alusrc,branch);

regfile regfile0(clk0,regwrite,wraddr,wdata,Ra,ra,Rb,rb);

ALU ALU0(oper,ra,b,d2,iszero);

datamemory dmem0(clk0,memwrite,d2,rb,d1);

mux3bit21 mux2(Rd,Rb,alusrc,wraddr);

//mux3bit21 mux3(Rb,Rd,alusrc,rd2);

mux3bit21 mux4(func,imfunc,alusrc,oper);

mux8bit21 mux1(rb,immex,alusrc^branch,b);

mux8bit21 mux5(d2,d1,memtoreg,wdata);

mux8bit21 mux6 (immex,addrex,jump,addri);

bitextender bitex(imm,immex);

adrsExtend adrex(addr,addrex);

dc1 dc0(branch,imfunc);

always @ (*) load = jump | (branch & iszero); 


initial begin
enable = 1; reset = 0; load = 0; clk0 = 0; clk1 = 0;
//$monitor ("clk= %b,%b; ra = %b,%d ; rb= %b,%d;immex = %b,%d; wdata = %b,%d",clk0,clk1,ra,ra,rb,rb,immex,immex,wdata,wdata);
 $monitor("addr = %d",addrb);
 #100 $finish;
end


always #2 clk0 = ~clk0; 
always #4 clk1 = ~clk1;
endmodule