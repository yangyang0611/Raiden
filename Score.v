module Score(score, seven_dis, seven_dis1);

input [31:0]score;
output [6:0]seven_dis;
output [6:0]seven_dis1;

reg [6:0]seven_dis;
reg [6:0]seven_dis1;

 
always@(score) //?
begin
	case(score)
	32'd0:
	begin
		seven_dis = 7'b1000000;//0
		seven_dis1 = 7'b1000000;//0
	end 
	32'd1: 
	begin
		seven_dis = 7'b1000000;//0
		seven_dis1 = 7'b1111001;//1
	end
	32'd2: 
	begin
		seven_dis = 7'b1000000;//0
		seven_dis1 = 7'b0100100;//2
	end 
	32'd3: 
	begin
		seven_dis = 7'b1000000;//0
		seven_dis1 =  7'b0110000;//3
	end 
	32'd4: 
	begin
		seven_dis = 7'b1000000;//0
		seven_dis1 =  7'b0011001;//4
	end 
	32'd5: 
	begin
		seven_dis = 7'b1000000;//0
		seven_dis1 = 7'b0010010;//5
	end 
	32'd6: 
	begin
		seven_dis = 7'b1000000;//0
		seven_dis1 = 7'b0000010;//6
	end 
	32'd7: 
	begin
		seven_dis = 7'b1000000;//0
		seven_dis1 = 7'b1111000;//7
	end 
	32'd8: 
	begin
		seven_dis = 7'b1000000;//0
		seven_dis1 = 7'b0000000;//8
	end 
	32'd9: 
	begin
		seven_dis = 7'b1000000;//0
		seven_dis1 = 7'b0010000;//9
	end 
	32'd10: 
	begin
		seven_dis = 7'b1111001;//1
		seven_dis1 = 7'b1000000;//0
	end 
	32'd11: 
	begin
		seven_dis = 7'b1111001;//1
		seven_dis1 = 7'b1111001;//1
	end 
	32'd12: 
	begin
		seven_dis = 7'b1111001;//1
		seven_dis1 = 7'b0100100;//2
	end 
	32'd13:
	begin
		seven_dis = 7'b1111001;//1
		seven_dis1 = 7'b0110000;//3
	end 
	32'd14:
	begin
		seven_dis = 7'b1111001;//1
		seven_dis1 =  7'b0011001;//4
	end 
	32'd15:
	begin
		seven_dis = 7'b1111001;//1
		seven_dis1 = 7'b0010010;//5
	end 
	32'd16:
	begin
		seven_dis = 7'b1111001;//1
		seven_dis1 = 7'b0000010;//6
	end 
	32'd17:
	begin
		seven_dis = 7'b1111001;//1
		seven_dis1 = 7'b1111000;//7
	end 
	32'd18:
	begin
		seven_dis = 7'b1111001;//1
		seven_dis1 = 7'b0000000;//8
	end 
	32'd19:
	begin
		seven_dis = 7'b1111001;//1
		seven_dis1 = 7'b0010000;//9
	end 
	32'd20:
	begin
		seven_dis = 7'b0100100;//2
		seven_dis1 = 7'b1000000;//0
	end 
	32'd21:
	begin
		seven_dis = 7'b0100100;//2
		seven_dis1 = 7'b1111001;//1
	end 
	32'd22:
	begin
		seven_dis = 7'b0100100;//2
		seven_dis1 = 7'b0100100;//2
	end 
	32'd23:
	begin
		seven_dis = 7'b0100100;//2
		seven_dis1 =  7'b0110000;//3
	end 
	32'd24:
	begin
		seven_dis = 7'b0100100;//2
		seven_dis1 =  7'b0011001;//4
	end 
	32'd25:
	begin
		seven_dis = 7'b0100100;//2
		seven_dis1 = 7'b0010010;//5
	end 
	32'd26:
	begin
		seven_dis = 7'b0100100;//2
		seven_dis1 = 7'b0000010;//6
	end 
	32'd27:
	begin
		seven_dis = 7'b0100100;//2
		seven_dis1 = 7'b1111000;//7
	end 
	32'd28:
	begin
		seven_dis = 7'b0100100;//2
		seven_dis1 = 7'b0000000;//8
	end 
	32'd29:
	begin
		seven_dis = 7'b0100100;//2
		seven_dis1 = 7'b0010000;//9
	end 
	32'd30:
	begin
		seven_dis = 7'b0110000;//3
		seven_dis1 = 7'b1000000;//0
	end 
	32'd31:	
	begin
		seven_dis = 7'b0110000;//3
		seven_dis1 = 7'b1111001;//1
	end 
	32'd32:
	begin
		seven_dis = 7'b0110000;//3
		seven_dis1 = 7'b0100100;//2
	end 
	32'd33:
	begin
		seven_dis = 7'b0110000;//3
		seven_dis1 =  7'b0110000;//3
	end 
	32'd34:
	begin
		seven_dis = 7'b0110000;//3
		seven_dis1 =  7'b0011001;//4
	end 
	32'd35:
	begin
		seven_dis = 7'b0110000;//3
		seven_dis1 = 7'b0010010;//5
	end 
	32'd36:
	begin
		seven_dis = 7'b0110000;//3
		seven_dis1 = 7'b0000010;//6
	end 
	32'd37:
	begin
		seven_dis = 7'b0110000;//3
		seven_dis1 = 7'b1111000;//7
	end 
	32'd38:
	begin
		seven_dis = 7'b0110000;//3
		seven_dis1 = 7'b0000000;//8
	end 
	32'd39:
	begin
		seven_dis = 7'b0110000;//3
		seven_dis1 = 7'b0010000;//9
	end 
	32'd40:
	begin
		seven_dis = 7'b0011001;//4
		seven_dis1 = 7'b1000000;//0
	end 
	32'd41:
	begin
		seven_dis = 7'b0011001;//4
		seven_dis1 = 7'b1111001;//1
	end 
	32'd42:
	begin
		seven_dis = 7'b0011001;//4
		seven_dis1 = 7'b0100100;//2
	end 
	32'd43:
	begin
		seven_dis = 7'b0011001;//4
		seven_dis1 =  7'b0110000;//3
	end 
	32'd44:
	begin
		seven_dis = 7'b0011001;//4
		seven_dis1 =  7'b0011001;//4
	end 
	32'd45:
	begin
		seven_dis = 7'b0011001;//4
		seven_dis1 = 7'b0010010;//5
	end 
	32'd46:
	begin
		seven_dis = 7'b0011001;//4
		seven_dis1 = 7'b0000010;//6
	end 
	32'd47:
	begin
		seven_dis = 7'b0011001;//4
		seven_dis1 = 7'b1111000;//7
	end 
	32'd48:
	begin
		seven_dis = 7'b0011001;//4
		seven_dis1 = 7'b0000000;//8
	end 
	32'd49:
	begin
		seven_dis = 7'b0011001;//4
		seven_dis1 = 7'b0010000;//9
	end 
	32'd50: 
	begin
		seven_dis = 7'b0010010;//5
		seven_dis1 = 7'b1000000;//0
	end
	32'd51: 
	begin
		seven_dis = 7'b0010010;//5
		seven_dis1 =  7'b1111001;//1
	end
	32'd52: 
	begin
		seven_dis = 7'b0010010;//5
		seven_dis1 = 7'b0100100;//2
	end
	32'd53: 
	begin
		seven_dis = 7'b0010010;//5
		seven_dis1 = 7'b0110000;//3
	end
	32'd54: 
	begin
		seven_dis = 7'b0010010;//5
		seven_dis1 = 7'b0011001;//4
	end
	32'd55: 
	begin
		seven_dis = 7'b0010010;//5
		seven_dis1 = 7'b0010010;//5
	end
	32'd56: 
	begin
		seven_dis = 7'b0010010;//5
		seven_dis1 = 7'b0000010;//6
	end
	32'd57: 
	begin
		seven_dis = 7'b0010010;//5
		seven_dis1 = 7'b1111000;//7
	end
	32'd58: 
	begin
		seven_dis = 7'b0010010;//5
		seven_dis1 = 7'b0000000;//8
	end
	32'd59: 
	begin
		seven_dis = 7'b0010010;//5
		seven_dis1 = 7'b0010000;//9 
	end
	32'd60: 
	begin
		seven_dis = 7'b0000010;//6
		seven_dis1 = 7'b1000000;//0
	end
	32'd61: 
	begin
		seven_dis = 7'b0000010;//6
		seven_dis1 =  7'b1111001;//1
	end
	32'd62: 
	begin
		seven_dis = 7'b0000010;//6
		seven_dis1 = 7'b0100100;//2
	end
	32'd63: 
	begin
		seven_dis = 7'b0000010;//6
		seven_dis1 = 7'b0110000;//3
	end
	32'd64: 
	begin
		seven_dis = 7'b0000010;//6
		seven_dis1 = 7'b0011001;//4
	end
	32'd65: 
	begin
		seven_dis = 7'b0000010;//6
		seven_dis1 = 7'b0010010;//5
	end
	32'd66: 
	begin
		seven_dis = 7'b0000010;//6
		seven_dis1 = 7'b0000010;//6
	end
	32'd67: 
	begin
		seven_dis = 7'b0000010;//6
		seven_dis1 = 7'b1111000;//7
	end
	32'd68: 
	begin
		seven_dis = 7'b0000010;//6
		seven_dis1 = 7'b0000000;//8
	end
	32'd69: 
	begin
		seven_dis = 7'b0000010;//6
		seven_dis1 = 7'b0010000;//9 
	end
	32'd70: 
	begin
		seven_dis = 7'b1111000;//7
		seven_dis1 = 7'b1000000;//0
	end
	32'd71: 
	begin
		seven_dis = 7'b1111000;//7
		seven_dis1 =  7'b1111001;//1
	end
	32'd72: 
	begin
		seven_dis = 7'b1111000;//7
		seven_dis1 = 7'b0100100;//2
	end
	32'd73: 
	begin
		seven_dis = 7'b1111000;//7
		seven_dis1 = 7'b0110000;//3
	end
	32'd74: 
	begin
		seven_dis = 7'b1111000;//7
		seven_dis1 = 7'b0011001;//4
	end
	32'd75: 
	begin
		seven_dis = 7'b1111000;//7
		seven_dis1 = 7'b0010010;//5
	end
	32'd76: 
	begin
		seven_dis =7'b1111000;//7
		seven_dis1 = 7'b0000010;//6
	end
	32'd77: 
	begin
		seven_dis = 7'b1111000;//7
		seven_dis1 = 7'b1111000;//7
	end
	32'd78: 
	begin
		seven_dis = 7'b1111000;//7
		seven_dis1 = 7'b0000000;//8
	end
	32'd79: 
	begin
		seven_dis = 7'b1111000;//7
		seven_dis1 = 7'b0010000;//9 
	end

	32'd80: 
	begin
		seven_dis = 7'b1111000;//7
		seven_dis1 = 7'b1000000;//0
	end
	32'd81: 
	begin
		seven_dis = 7'b1111000;//7
		seven_dis1 =  7'b1111001;//1
	end
	32'd82: 
	begin
		seven_dis = 7'b1111000;//7
		seven_dis1 = 7'b0100100;//2
	end
	32'd83: 
	begin
		seven_dis = 7'b1111000;//7
		seven_dis1 = 7'b0110000;//3
	end
	32'd84: 
	begin
		seven_dis = 7'b1111000;//7
		seven_dis1 = 7'b0011001;//4
	end
	32'd85: 
	begin
		seven_dis = 7'b1111000;//7
		seven_dis1 = 7'b0010010;//5
	end
	32'd86: 
	begin
		seven_dis =7'b1111000;//7
		seven_dis1 = 7'b0000010;//6
	end
	32'd87: 
	begin
		seven_dis = 7'b1111000;//7
		seven_dis1 = 7'b1111000;//7
	end
	32'd88: 
	begin
		seven_dis = 7'b1111000;//7
		seven_dis1 = 7'b0000000;//8
	end
	32'd89: 
	begin
		seven_dis = 7'b1111000;//7
		seven_dis1 = 7'b0010000;//9 
	end
	32'd90: 
	begin
		seven_dis = 7'b0010000;//9 
		seven_dis1 = 7'b1000000;//0
	end
	32'd91: 
	begin
		seven_dis = 7'b0010000;//9 
		seven_dis1 =  7'b1111001;//1
	end
	32'd92: 
	begin
		seven_dis = 7'b0010000;//9 
		seven_dis1 = 7'b0100100;//2
	end
	32'd93: 
	begin
		seven_dis = 7'b0010000;//9 
		seven_dis1 = 7'b0110000;//3
	end
	32'd94: 
	begin
		seven_dis = 7'b0010000;//9 
		seven_dis1 = 7'b0011001;//4
	end
	32'd95: 
	begin
		seven_dis = 7'b0010000;//9 
		seven_dis1 = 7'b0010010;//5
	end
	32'd96: 
	begin
		seven_dis =7'b0010000;//9 
		seven_dis1 = 7'b0000010;//6
	end
	32'd97: 
	begin
		seven_dis = 7'b0010000;//9 
		seven_dis1 = 7'b1111000;//7
	end
	32'd98: 
	begin
		seven_dis = 7'b0010000;//9 
		seven_dis1 = 7'b0000000;//8
	end
	32'd99: 
	begin
		seven_dis = 7'b0010000;//9 
		seven_dis1 = 7'b0010000;//9 
	end 
	endcase 
end
endmodule 