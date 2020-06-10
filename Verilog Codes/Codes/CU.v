module CU(op,jump,memtoreg,memwrite,regwrite,ALUsrc,branch);
input [3:0]op;
output jump,memtoreg,memwrite,regwrite,ALUsrc,branch;
assign jump=op[1]&(~op[0]);
assign memtoreg=op[1];
assign memwrite=op[3]&op[2];
assign regwrite=(~op[3]&~op[1])|(~op[2]&op[0]);
assign ALUsrc=op[2]|op[3];
assign branch=op[3]&(~op[1]);
endmodule

