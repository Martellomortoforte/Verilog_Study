module bitwise_exercise2(
	input wire [3:0] a,
	input wire [3:0] b,
	output wire [3:0] and_result,
	output wire [3:0] or_result,
	output wire [3:0] xor_result,
	output wire [3:0] not_result
);

	assign and_result = a & b;
	assign or_result = a | b;
	assign xor_result = a^b;
	assign not_result = ~a;

endmodule
