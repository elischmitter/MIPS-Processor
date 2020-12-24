module sighnExtend(in, out);
	input wire signed [15:0] in;
	output reg signed  [31:0] out;
	always @ (*)
	begin
		out[31:0]<=$signed(in[15:0]);
	end
endmodule 

module signExtend_testbench;
	parameter timeDelay = 10;
	reg signed [15:0] inT;
	wire signed [31:0] outT;
	sighnExtend a(inT,outT);
	initial
	begin 
		#(timeDelay) inT=16'hffff;
		#(timeDelay) inT=16'h000f;
		#100;
	 end 
endmodule 