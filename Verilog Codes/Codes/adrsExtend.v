
module adrsExtend(ads,extendedads);

input [6:0] ads;
output [7:0] extendedads;

 assign extendedads[6:0]=ads[6:0];
 assign extendedads[7]=0;

 
endmodule

