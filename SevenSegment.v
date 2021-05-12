module SevenSegment(in,out);

input [3:0]in;
output [6:0]out;
reg [6:0]out;

	always@(*)
	begin
		case(in)
			4'h0: out = 7'b1_00_0_00_0;
			4'h1: out = 7'b1_11_1_00_1;
			4'h2: out = 7'b0_10_0_10_0;
			4'h3: out = 7'b0_11_0_00_0;
			4'h4: out = 7'b0_01_1_00_1;
			4'h5: out = 7'b0_01_0_01_0;
			4'h6: out = 7'b0_00_0_01_0;
			4'h7: out = 7'b1_11_1_00_0;
			4'h8: out = 7'b0_00_0_00_0;
			4'h9: out = 7'b0_01_0_00_0;
			4'ha: out = 7'b0_00_1_00_0;
			4'hb: out = 7'b0_00_0_01_1;
			4'hc: out = 7'b1_00_0_11_0;
			4'hd: out = 7'b0_10_0_00_1;
			4'he: out = 7'b0_00_0_11_0;
			4'hf: out = 7'b0_00_1_11_0;
		endcase
	end

endmodule 