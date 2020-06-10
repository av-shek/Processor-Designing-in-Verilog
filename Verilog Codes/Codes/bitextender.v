
module bitextender(data,extendedData);

input [5:0] data;
output [7:0] extendedData;

 assign extendedData[5:0]=data[5:0];
 assign extendedData[6]=data[5];
 assign extendedData[7]=data[5];

 
endmodule

