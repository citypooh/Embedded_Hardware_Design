module project(clk,sw,led,disp);
	input clk;
	input [15:0] sw;
	output [15:0] led;
	output [6:0] disp;
	reg[4:0] random;
	reg[15:0] example = 16'b0010110010101101;
	reg xorex;
	reg [3:0] count;
	reg[15:0] led;
	reg clk1 = 0;
	reg[31:0] cnt;
	parameter endgame = 3;
	integer i;
	
	always @(negedge clk) begin
		if(cnt == 24999999) begin
			cnt <= 0;
			clk1 <= 1;
		end
		else begin
			cnt <= cnt+1;
			clk1 <= 0;
		end
	end
	
	always @(negedge clk1)begin
			random ={example[12],example[9],example[7],example[3],example[1]};
			xorex = (example[12]^example[9]^example[7]^example[3]^example[1]);
			
			for(i=0; i<15;i=i+1) begin
				example[i] = example[i+1];
			end
			example[15] = xorex;
	end
	
	always @(negedge clk1)begin
		case(random)
			5'b00001 : led <= 16'b0000000000000001;
			5'b00010 : led <= 16'b0000000000000010;
			5'b00011 : led <= 16'b0000000000000100;
			5'b00100 : led <= 16'b0000000000001000;
			5'b00101 : led <= 16'b0000000000010000;
			5'b00110 : led <= 16'b0000000000100000;
			5'b00111 : led <= 16'b0000000001000000;
			5'b01000 : led <= 16'b0000000010000000;
			5'b01001 : led <= 16'b0000000100000000;
			5'b01010 : led <= 16'b0000001000000000;
			5'b01011 : led <= 16'b0000010000000000;
			5'b01100 : led <= 16'b0000100000000000;
			5'b01101 : led <= 16'b0001000000000000;
			5'b01110 : led <= 16'b0010000000000000;
			5'b01111 : led <= 16'b0100000000000000;
			5'b10000 : led <= 16'b1000000000000000;
			default : led <= 16'b0000000000000000;
		endcase
		
		if(led == 16'b0000000000000001)begin
			if(sw[0]==1)
				count <= count + 1;
		end
		else if(led == 16'b0000000000000010)begin
			if(sw[1]==1)
				count <= count + 1;
		end
		else if(led == 16'b0000000000000100)begin
			if(sw[2]==1)
				count <= count + 1;
		end
		else if(led == 16'b0000000000001000)begin
			if(sw[3]==1)
				count <= count + 1;
		end
		else if(led == 16'b0000000000010000)begin
			if(sw[4]==1)
				count <= count + 1;
		end
		else if(led == 16'b0000000000100000)begin
			if(sw[5]==1)
				count <= count + 1;
		end
		else if(led == 16'b0000000001000000)begin
			if(sw[6]==1)
				count <= count + 1;
		end
		else if(led == 16'b0000000010000000)begin
			if(sw[7]==1)
				count <= count + 1;
		end
		else if(led == 16'b0000000100000000)begin
			if(sw[8]==1)
				count <= count + 1;
		end
		else if(led == 16'b0000001000000000)begin
			if(sw[9]==1)
				count <= count + 1;
		end
		else if(led == 16'b0000010000000000)begin
			if(sw[10]==1)
				count <= count + 1;
		end
		else if(led == 16'b0000100000000000)begin
			if(sw[11]==1)
				count <= count + 1;
		end
		else if(led == 16'b0001000000000000)begin
			if(sw[12]==1)
				count <= count + 1;
		end
		else if(led == 16'b0010000000000000)begin
			if(sw[13]==1)
				count <= count + 1;
		end
		else if(led == 16'b0100000000000000)begin
			if(sw[14]==1)
				count <= count + 1;
		end
		else if(led == 16'b1000000000000000)begin
			if(sw[15]==1)
				count <= count + 1;
		end
		else count <= count;
		
		if(count == endgame)begin
			led <= 16'b1111111111111111;
			count <= 0;
		end
	end
	
	led7 u1 (count,disp);
		
endmodule

module led7(bcd,disp);
	input [3:0] bcd;
	output [6:0] disp;
	reg [6:0] display;
	assign disp = ~display;

	always @(bcd) begin
		case (bcd)
			0: display=7'b111_1110;
			1: display=7'b011_0000;
			2: display=7'b110_1101;
			3: display=7'b111_1001;
			4: display=7'b011_0011;
			5: display=7'b101_1011;
			6: display=7'b101_1111;
			7: display=7'b111_0000; 
			8: display=7'b111_1111;
			9: display=7'b111_1011;
			10: display=7'b111_0111;
			11: display=7'b001_1111;
			12: display=7'b100_1110;
			13: display=7'b011_1101;
			14: display=7'b100_1111;
			15: display=7'b100_0111;
			default: display = 7'b000_0000;
		endcase
	end
endmodule
