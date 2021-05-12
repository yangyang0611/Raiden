`define TimeExpire_KEY 25'b00010000000000000000000000
module Keypad(clk, rst, keypadRow, keypadCol, playPos, fire);

	input clk, rst;
	input [3:0]keypadCol;
	
	output [2:0]playPos;
	reg [2:0]playPos;
	
	output [3:0]keypadRow;

	output fire;

	reg fire;
	
	reg [3:0]keypadRow;
	reg [3:0]keypadBuf;
	reg [24:0]keypadDelay;

	always@(posedge clk)
	begin
		if(!rst)
		begin
			keypadRow = 4'b1110;
			keypadBuf = 4'b0000;
			keypadDelay = 25'd0;
			playPos = 1;
		end
		else
		begin
			if(keypadDelay == `TimeExpire_KEY)
			begin
				keypadDelay = 25'd0;
				
				case({keypadRow, keypadCol})
					8'b1110_1110 : keypadBuf = 4'h7;
					8'b1110_1101 : keypadBuf = 4'h4;
					8'b1110_1011 : begin 
						keypadBuf = 4'h1;
						fire <= ~fire;
					end
					8'b1110_0111 : keypadBuf = 4'h0;
					8'b1101_1110 : keypadBuf = 4'h8;
					8'b1101_1101 : keypadBuf = 4'h5;
					8'b1101_1011 : keypadBuf = 4'h2;
					8'b1101_0111 : keypadBuf = 4'ha;
					8'b1011_1110 : begin 
						keypadBuf = 4'h9;
						if (playPos > 1) begin
							playPos <= playPos - 1;
						end
					end
					8'b1011_1101 : keypadBuf = 4'h6;
					8'b1011_1011 : keypadBuf = 4'h3;
					8'b1011_0111 : keypadBuf = 4'hb;
					8'b0111_1110 : begin 
						keypadBuf = 4'hc;
						if (playPos < 6) begin
							playPos <= playPos + 1;
						end
					end
					8'b0111_1101 : keypadBuf = 4'hd;
					8'b0111_1011 : keypadBuf = 4'he;
					8'b0111_0111 : keypadBuf = 4'hf;
					default     : begin
						keypadBuf = 0;
						fire = 0;
					end


				endcase
				case(keypadRow)
					4'b1110 : keypadRow = 4'b1101;
					4'b1101 : keypadRow = 4'b1011;
					4'b1011 : keypadRow = 4'b0111;
					4'b0111 : keypadRow = 4'b1110;
					default: keypadRow = 4'b1110;
				endcase
			end
			else
				keypadDelay = keypadDelay + 1'b1;
		end
	end
	
endmodule 