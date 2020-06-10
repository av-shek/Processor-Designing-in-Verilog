module mux3bit21(a,b,select,y);
input [2:0]a;
input [2:0]b;
input select;
output [2:0]y;

assign y=select?b:a;
endmodule

