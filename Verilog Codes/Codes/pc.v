module pc (addri,load,out, enable, clk, reset);
output [7:0] out; input [7:0]addri;
input enable, clk, reset, load;
reg [7:0] out;

initial out = 0;

always @(posedge clk)
	if (load) out <= addri; 
	else if (reset) begin
		out <= 8'b0 ;
	end 
	else if (enable) begin
		out <= out + 1;
	end
endmodule

