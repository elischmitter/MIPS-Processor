module ALU (a,  
				b, 
				opcode,
				out,
				less,
				clk
				);

	parameter DATA_WIDTH = 2;
	
	input wire[DATA_WIDTH-1:0] a;
	input wire[DATA_WIDTH-1:0] b;
	input [2:0] opcode;
	input wire clk;
	output reg[DATA_WIDTH-1:0]out;
	output reg less;	
	always@ (*)
	begin
		if(opcode==3'b010)
		begin
			less=0;
		    out<= a+b;
		end
		else if( opcode ==3'b110)
		begin
			less=0;
			out<=a-b;
		end
		else if(	opcode ==3'b000)
		begin
			less=0;	
			out<=a&b;
		end
		else if( opcode == 3'b001)
		begin
			less=0;	
			out<=a|b;
		end
		else if (opcode == 3'b111)
		begin
			if(a<b)
				less<=1;
			else
			   less=0;
		end
	end	
endmodule 

module ALU_testbench;
	parameter timeDelay = 10; 
	parameter DATA_WIDTH = 2;
	reg [DATA_WIDTH-1:0] ain,bin;
	reg clk;
	reg [2:0]opcode;
	wire less;
	wire [DATA_WIDTH-1:0] outtest;
	ALU a (ain, bin, opcode, outtest,less, clk);
	initial
	begin 
		ain=2'b10;bin=2'b01;opcode = 3'b010;
		#(timeDelay) opcode=3'b110;
		#(timeDelay) opcode=3'b000;
	 	#(timeDelay) opcode=3'b001;
		#(timeDelay) opcode=3'b111;
		#(timeDelay) ain=2'b10;bin=2'b11;
		#100;
	 end
endmodule	 


