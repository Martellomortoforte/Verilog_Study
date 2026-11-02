`timescale 1ns/1ps

module Mini_ALU_exercise5(
	input wire [1:0] sel,
	input wire [3:0] A,
	input wire [3:0] B,
	output wire [4:0] y
);

	wire [4:0] ADD;
	wire [4:0] AND;
	wire [4:0] OR;
	wire [4:0] XOR;
	assign ADD = {1'b0,A} + {1'b0,B};
	assign AND = {1'b0,A} & {1'b0,B};	
	assign OR = {1'b0,A} | {1'b0,B};	
	assign XOR = {1'b0,A} ^ {1'b0,B};	

	assign y = (sel == 2'b00) ?  ADD:
		   (sel == 2'b01) ?  AND:
	           (sel == 2'b10) ?  OR:
	                             XOR;
endmodule
