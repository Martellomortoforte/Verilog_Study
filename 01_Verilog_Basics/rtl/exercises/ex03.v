module shift_exercise3(
	input wire [7:0] data,
	output wire [7:0] left_result,
	output wire [7:0] right_result
);

	assign left_result = data << 2;
	assign right_result = data >> 2;

endmodule
