`timescale 1ns/1ps

module booth_encoder(
	input wire signed [7:0] Multiplicand,
	input wire [2:0] SSM,
	output reg signed [15:0] PPR,
	output reg c
);

	wire signed [15:0] Ext_Multiplicand;
	assign Ext_Multiplicand = Multiplicand;

	always @(*) begin
		case(SSM)
			3'b000 : begin
				PPR = 16'sd0;
				c=1'b0;
			end
			3'b001 : begin
				PPR =Ext_Multiplicand;
				c=1'b0;
			end
			3'b010 : begin
			       	PPR = Ext_Multiplicand;
				c=1'b0;
			end
			3'b011 : begin
				PPR = Ext_Multiplicand <<< 1;
				c=1'b0;
			end
			3'b100 : begin
				PPR = ~(Ext_Multiplicand <<<1);
				c=1'b1;
			end
			3'b101 : begin
				PPR = ~Ext_Multiplicand;
				c=1'b1;
			end
			3'b110 : begin
				PPR = ~Ext_Multiplicand;
				c=1'b1;
			end
			3'b111 : begin
				PPR = 16'sd0;
				c=1'b0;
			end
			default : begin
				PPR = 16'sd0;
				c=1'b0;
			end
		endcase
	end
endmodule
