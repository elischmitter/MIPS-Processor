module registers(reset, read1, read2, writeData, RegWrite, readData1, readData2,regWriteC);
	input  reset;
	input  regWriteC;
	input   [4:0] read1;
	input   [4:0] read2;
	input   [4:0] RegWrite;
	input   [31:0] writeData;
	output reg [31:0] readData1;
	output reg [31:0] readData2;
	
	reg [31:0] regs[31:0];
	
	integer i;
	always @ (*)
	begin
		if(reset) begin
			for(i=0; i<32; i=i+1)begin
				regs[i]=0;
			end
		end 
		readData1=regs[read1];
		readData2=regs[read2];
		if(regWriteC==1)begin
			regs[RegWrite]=writeData;
		end
		regs[0]=0;
	end	
endmodule 



module registers_testbench;
	parameter timeDelay = 10;
	reg regWritect;
	reg resett;
	reg  [4:0] read1t;
	reg  [4:0] read2t;
	reg  [4:0] RegWritet;
	reg  [31:0] writeDatat;
	wire [31:0] readData1t;
	wire [31:0] readData2t;
	wire regWritet;
	registers a (resett, read1t, read2t, writeDatat, RegWritet, readData1t, readData2t,regWritect);
	
	initial
	begin 
		resett=1;
		#(timeDelay) resett=0; read1t=0000;read2t=0001;
		#(timeDelay) writeDatat=32'hf;RegWritet=5'b00100; regWritect=1;
		#100;
	 end
endmodule 