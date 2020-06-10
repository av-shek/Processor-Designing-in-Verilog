module testbench_CU;
reg [3:0]op=4'b0000;
wire jump,memtoreg,memwrite,regwrite,ALUsrc,branch;
initial
begin
	$monitor("jump is %b,memtoreg is %b,memwrite is %b,regwrite is %b,ALUsrc is %b,branch is %b",jump,memtoreg,memwrite,regwrite,ALUsrc,branch);
    $finish;
end
CU c(op,jump,memtoreg,memwrite,regwrite,ALUsrc,branch);
endmodule