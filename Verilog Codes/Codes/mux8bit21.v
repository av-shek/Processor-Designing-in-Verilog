module mux8bit21(a,b,select,y);
input [7:0]a;
input [7:0]b;
input select;
output [7:0]y;

assign y=select?b:a;
endmodule
