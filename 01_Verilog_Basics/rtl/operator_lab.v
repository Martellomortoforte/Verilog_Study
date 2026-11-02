module operator_lab(
	input wire [3:0] a,
	input wire [3:0] b,
	output wire [4:0] add_result,
	output wire [3:0] and_result,
	output wire 	  logic_result, //If you didn't assign the size of output wire, then it means its size is 1bit.
	output wire [3:0] shift_result
);

	assign add_result = {1'b0,a} + {1'b0,b};
	assign and_result = a & b;
	assign logic_result = a&&b;
	assign shift_result = a<<1;

endmodule
