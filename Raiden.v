`define TimeExpire 32'd1000
`define TimeExpire_KEY 25'b00010000000000000000000000
`define bullet 32'd50000000
module Raiden(row, col, clk, rst, keypadRow, keypadCol, segDec, segUn);

// clock
input clk, rst;
reg [31:0]clk_cnt;
reg div_clk;

// dot matrix scanline
output [7:0]row;
output [15:0]col;

reg [7:0]row;
reg [15:0]col;
reg [15:0]scan_row[7:0];
reg [3:0]scanline;

wire [15:0]enemyRow[7:0];



//enemy bullet
reg [15:0] enemy_Bullet[7:0];
reg [31:0] bullet_cnt;
wire isfire;

//player die
reg die;
reg [15:0] playerRow[2:0];
reg blink;

//win
reg final;

// keypad variables
output [3:0]keypadRow;
input [3:0]keypadCol;

reg [31:0]keypadDelay;
reg keypadTrigger;

// player settings
wire [2:0]playerPos;
wire [2:0]enemyPos_row;
wire [1:0]enemyPos_col;
wire fire;

wire clk_out;

reg [3:0]reborn;
reg if_shot;
reg [15:0]bullets[7:0];

// score
reg [31:0]score;

output [6:0]segDec;
output [6:0]segUn;

// keypad module
Keypad key(clk, rst, keypadRow, keypadCol, playerPos, fire);

// enemy module
Enemy en(clk, rst, enemyPos_row,enemyPos_col, clk_out, isfire);

// score module
Score sc(score, segDec, segUn);

// dot matrixes cycle
always @(posedge clk) begin
	if (!rst) begin
		clk_cnt <= 32'd0;
		div_clk <= 1'b1;
	end
	
	else begin
		if (clk_cnt == `TimeExpire) begin
			div_clk <= ~div_clk;
			clk_cnt <= 32'd0;
		end
		else begin
			clk_cnt <= clk_cnt + 32'd1;
		end
	end
end

// dot matrix col assign
always @(posedge div_clk) begin
	if (!rst) begin
		scanline <= 7;
		col <= 16'b0000000000000000;
	end
	else begin
		row <= ~(1 << scanline);
		scanline <= scanline - 1;

		col <= scan_row[scanline];
	end
end

// keypad clk cycle
always @(posedge clk) begin
	if (!rst) begin
		keypadDelay <= 0;
		keypadTrigger = 0;
		keypadTrigger = 1;
	end
	else begin
		if (keypadDelay == `TimeExpire_KEY) begin
			keypadDelay <= 0;
			keypadTrigger <= ~keypadTrigger;
		end
		else begin
			keypadDelay <= keypadDelay + 1;
		end
	end
end

always @(posedge clk_out) begin
	if (!rst) begin
		reborn <= 0;
	end
	else if (if_shot) begin
		reborn <= reborn + 1;
	end
	else if (!if_shot) begin
		reborn = 0;
	end
end

// bullet fire and move
always @(posedge keypadTrigger) begin
	if (!rst) begin
		bullets[0] = 0;
		bullets[1] = 0;
		bullets[2] = 0;
		bullets[3] = 0;
		bullets[4] = 0;
		bullets[5] = 0;
		bullets[6] = 0;
		bullets[7] = 0;
		
		playerRow[0] = 16'b0000000000000001;
		playerRow[1] = 16'b0000000000000111;
		playerRow[2] = 16'b0000000000000001;
		blink = 0;
		final = 0;
		
		
		if_shot = 0;
		score = 0;
		
		die = 0;
		
	end
	else begin
		
		
		bullets[0] = bullets[0] << 1;
		bullets[1] = bullets[1] << 1;
		bullets[2] = bullets[2] << 1;
		bullets[3] = bullets[3] << 1;
		bullets[4] = bullets[4] << 1;
		bullets[5] = bullets[5] << 1;
		bullets[6] = bullets[6] << 1;
		bullets[7] = bullets[7] << 1;
		
		blink = ~blink;		
		
		if(score >= 15) begin
			playerRow[0] = playerRow[0] << 1;
			playerRow[1] = playerRow[1] << 1;
			playerRow[2] = playerRow[2] << 1;
			if(playerRow[1] == 16'b1110000000000000) begin
				final = 1;
			end
		end
		
		
	end
	
	
	if (reborn == 5) begin
		if_shot = 0;
	end

	
	if (fire) begin
		bullets[playerPos] = bullets[playerPos] | 16'b0000000000001000;
	end

	if (!if_shot && !die && !final) begin
		if ((bullets[enemyPos_row - 1] & 16'b0100000000000000) != 0) begin
			if_shot <= 1;
			bullets[enemyPos_row - 1] = bullets[enemyPos_row - 1] ^ (bullets[enemyPos_row - 1] & 16'b0100000000000000); 
			score = score + 1;
		end
		if ((bullets[enemyPos_row] & 16'b0110000000000000) != 0) begin
			if_shot <= 1;
			bullets[enemyPos_row] = bullets[enemyPos_row] ^ (bullets[enemyPos_row] & 16'b0110000000000000); 
			score = score + 3;
		end
		if ((bullets[enemyPos_row + 1] & 16'b0100000000000000) != 0) begin
			if_shot <= 1;
			bullets[enemyPos_row + 1] = bullets[enemyPos_row + 1] ^ (bullets[enemyPos_row + 1] & 16'b0100000000000000); 
			score = score + 1;
		end
	end
	
	
	if(!die) begin
		if((enemy_Bullet[playerPos - 1] & 16'b0000000000000001) != 0) begin
			die <= 1;
		end
		if((enemy_Bullet[playerPos] & 16'b0000000000000111) != 0) begin
			die <= 1;
		end
		if((enemy_Bullet[playerPos + 1] & 16'b0000000000000001) != 0) begin
			die <= 1;
		end
	end
	
end

// dot matrixes update
always @(posedge clk) begin
	if (!rst) begin
		scan_row[0] = 0;
		scan_row[1] = 0;
		scan_row[2] = 0;
		scan_row[3] = 0;
		scan_row[4] = 0;
		scan_row[5] = 0;
		scan_row[6] = 0;
		scan_row[7] = 0;
		
	end
	else begin
		scan_row[0] = 0;
		scan_row[1] = 0;
		scan_row[2] = 0;
		scan_row[3] = 0;
		scan_row[4] = 0;
		scan_row[5] = 0;
		scan_row[6] = 0;
		scan_row[7] = 0;
		
		
		if(!die) begin
			if(score < 15) begin 
				// draw player on the scanline
				if (scanline == playerPos - 1)
					scan_row[scanline] = 16'b0000000000000001 | scan_row[scanline];
				if (scanline == playerPos)
					scan_row[scanline] = 16'b0000000000000111 | scan_row[scanline];
				if (scanline == playerPos + 1)
					scan_row[scanline] = 16'b0000000000000001 | scan_row[scanline];	
						
				// draw enemy on the scanline if enemy is alive
				if (!if_shot) begin
					if (scanline == enemyPos_row - 1)
						scan_row[scanline] = 16'b100000000000000 | scan_row[scanline];
					if (scanline == enemyPos_row)
						scan_row[scanline] = 16'b110000000000000 | scan_row[scanline];
					if (scanline == enemyPos_row + 1)
						scan_row[scanline] = 16'b100000000000000 | scan_row[scanline];
				end
				
				// draw bullets of the player on the scanline
				scan_row[scanline] = scan_row[scanline] | bullets[scanline] | enemy_Bullet[scanline];
			end
			else if(score >= 15 && !final)begin
				scan_row[0] = 16'b1110000000000000;
				scan_row[1] = 16'b1111000000000000;
				scan_row[2] = 16'b1111000000000000;
				scan_row[3] = 16'b1111100000000000;
				scan_row[4] = 16'b1111100000000000;
				scan_row[5] = 16'b1111000000000000;
				scan_row[6] = 16'b1111000000000000;
				scan_row[7] = 16'b1110000000000000;
				
				if(blink) begin
					if (scanline == playerPos - 1)
						scan_row[scanline] = playerRow[0] | scan_row[scanline];
					if (scanline == playerPos)
						scan_row[scanline] = playerRow[1] | scan_row[scanline];
					if (scanline == playerPos + 1)
						scan_row[scanline] = playerRow[2] | scan_row[scanline];
				end
			end
		end
	
		else if(die)begin
			scan_row[7] = 16'b0000000000000000;
			scan_row[6] = 16'b0000000000000000;
			scan_row[5] = 16'b0111001001110100;
			scan_row[4] = 16'b0100010100100100;
			scan_row[3] = 16'b0111011100100100;
			scan_row[2] = 16'b0100010100100100;
			scan_row[1] = 16'b0100010101110111;
			scan_row[0] = 16'b0000000000000000;
			
			if(blink) begin
				scan_row[0] = 0;
				scan_row[1] = 0;
				scan_row[2] = 0;
				scan_row[3] = 0;
				scan_row[4] = 0;
				scan_row[5] = 0;
				scan_row[6] = 0;
				scan_row[7] = 0;
			end	
		end
	end
end

always @ (posedge clk) begin

	if(!rst) begin
		bullet_cnt <= 0;
		enemy_Bullet[0] = 0;
		enemy_Bullet[1] = 0;
		enemy_Bullet[2] = 0;
		enemy_Bullet[3] = 0;
		enemy_Bullet[4] = 0;
		enemy_Bullet[5] = 0;
		enemy_Bullet[6] = 0;
		enemy_Bullet[7] = 0;
	end
	else begin
		if(bullet_cnt == `bullet) begin
			bullet_cnt <= 0;
			enemy_Bullet[0] = enemy_Bullet[0] >> 1;
			enemy_Bullet[1] = enemy_Bullet[1] >> 1;
			enemy_Bullet[2] = enemy_Bullet[2] >> 1;
			enemy_Bullet[3] = enemy_Bullet[3] >> 1;
			enemy_Bullet[4] = enemy_Bullet[4] >> 1;
			enemy_Bullet[5] = enemy_Bullet[5] >> 1;
			enemy_Bullet[6] = enemy_Bullet[6] >> 1;
			enemy_Bullet[7] = enemy_Bullet[7] >> 1;
			
			
			if(isfire  && !if_shot) begin
				enemy_Bullet[enemyPos_row] = enemy_Bullet[enemyPos_row] | 16'b0001000000000000;
			end
		end
		else begin
			bullet_cnt <= bullet_cnt + 1;
		end
	end


end

endmodule 