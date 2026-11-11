`timescale 1ns/1ps

module FA_16bit(
	input wire [15:0] A,
	input wire [15:0] B,
	input wire [15:0] C,
	output wire [15:0] Sum,
	output wire [15:0] Carry_Out
);

	assign Sum =(A^B)^C;
	assign Carry_Out = (A & B) | ((A^B) & C);

endmodule
