module registers(reset, read1, read2, writeData, RegWrite, readData1, readData2);
	input wire reset;
	input wire  [4:0] read1;
	input wire  [4:0] read2;
	input wire  [4:0] RegWrite;
	input wire  [31:0] writeData;
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
		if(RegWrite==1)begin
			regs[RegWrite]=writeData;
		end
		regs[0]=0;
	end	
endmodule 