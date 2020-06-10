module ALU(opr,A,B,result,iszero);
input [2:0] opr; input [7:0]A,B;
output [7:0]result; output iszero;
reg [7:0] result; reg iszero;
always @(*) begin
if(opr==0)
 result=A+B;
else if(opr==2)
 result=A-B;
else if(opr==4)
 result=A&B;
else if(opr==5)
 result=A|B;
if(result == 0) iszero = 1;
end
endmodule

