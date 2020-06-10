module dc1(b,y);
input b;
output [2:0]y;

reg [2:0]y;

always @(*)
begin
if(~b)   y=3'b000;
else if(b)  y=3'b010;
end

endmodule

