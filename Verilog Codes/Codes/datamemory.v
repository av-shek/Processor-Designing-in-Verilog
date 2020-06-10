module datamemory(clk,memWrite,adr,writedata,outdata);
input clk,memWrite; 
input [7:0] adr, writedata;
reg [7:0] dmem [255:0] ;
output reg [7:0]outdata;

initial dmem[13] = 7;

always@(posedge clk) 
begin
	
	if(memWrite==1) begin
		dmem[adr]= writedata;
		$display("dmemadr = %d; wdat = %d",adr,dmem[adr]);
	end
    else
     	outdata = dmem[adr];
end		
endmodule

