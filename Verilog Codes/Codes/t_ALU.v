module t_ALU;
reg [2:0]opr;
reg [7:0]A; wire iszero;
reg [7:0]B;
wire [7:0]result;
initial
begin
    opr=3'b100; A=8'b00001000; B=8'b00000001;
	$monitor("result is %8b, %b",result,iszero);
    $finish;
end
ALU c(opr,A,B,result,iszero);
endmodule