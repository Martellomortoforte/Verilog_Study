`timescale 1ns/1ps

module tb_Mini_ALU;

	reg [1:0] sel;
	reg [3:0] A;
	reg [3:0] B;

	wire [4:0] y;

	Mini_ALU_exercise5 dut(
		.sel(sel),
		.A(A),
		.B(B),
		.y(y)
	);

	initial begin
		A = 4'd15;
		B = 4'd15;

		sel = 2'b00;
		#10
		sel = 2'b01;
		#10
		sel = 2'b10;
		#10
		sel = 2'b11;
		#10

		$finish;

	end

endmodule
