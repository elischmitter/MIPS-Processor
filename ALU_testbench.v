module ALU_testbench;
	parameter timeDelay = 10; 
	parameter DATA_WIDTH = 2;
	reg [DATA_WIDtH-1:0] a,b,
	reg clk;
	reg [2;0]opcode;
	wire out, less;
	ALU a (a, b, opcode, out,less, clk);
	initial
	begin 
		a=2'b10;b=01;opcode = 3'b010
		#(timeDelay) opcode=3'b110;
		#(timeDelay) opcode=3'b000;
	 	#(timeDelay) opcode=3'b001;
		#(timeDelay) opcode=3'b111;
		#100
	 end
endmodule	 
