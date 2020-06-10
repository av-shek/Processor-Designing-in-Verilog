module t_imdextend;

reg [5:0]data;
wire [7:0]result;
initial
begin

     data=8'b100010; 
	$monitor("result is %8b, %6b",result,data);
    $finish;
	
end


imdExtend c(data,result);
endmodule