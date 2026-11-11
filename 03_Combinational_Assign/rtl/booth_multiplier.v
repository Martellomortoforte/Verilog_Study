`timescale 1ns/1ps

module booth_multiplier(
	input wire signed [7:0] Multiplier,
	input wire signed [7:0] Multiplicand,
	output wire signed [15:0] Product
);

	wire [2:0] SSM3,SSM2,SSM1,SSM0;
	wire [15:0] PPR3,PPR2,PPR1,PPR0;
	wire c3,c2,c1,c0;
	wire s3,s2,s1,s0;
	wire [15:0] W_PPR3,W_PPR2,W_PPR1,W_PPR0;
	wire [15:0] Act_PPR3,Act_PPR2,Act_PPR1,Act_PPR0;

	wire [15:0] Sum0,Sum1;
	wire [15:0] Carry_Out0,Carry_Out1;

	assign SSM3 = Multiplier[7:5];
	assign SSM2 = Multiplier[5:3];
	assign SSM1 = Multiplier[3:1];
	assign SSM0 = {Multiplier[1:0],1'b0};

	assign W_PPR0 = PPR0;
	assign W_PPR1 = PPR1 << 2;
	assign W_PPR2 = PPR2 << 4;
	assign W_PPR3 = PPR3 << 6;

	assign s3 = PPR3[15];
	assign s2 = PPR2[15];
	assign s1 = PPR1[15];
	assign s0 = PPR0[15];

	assign Act_PPR0 = {5'b0,~s0,s0,s0,8'b0} + W_PPR0;
	assign Act_PPR1 = {4'b0,1'b1,~s1,10'b0} + W_PPR1;
	assign Act_PPR2 = {2'b0,1'b1,~s2,12'b0} + W_PPR2;
	assign Act_PPR3 = {1'b1,~s3,14'b0} + W_PPR3;

	assign Product = Sum1 + (Carry_Out1 << 1);

	FA_16bit CSA0(
		.A(Act_PPR0),
		.B(Act_PPR1),
		.C(Act_PPR2),
		.Sum(Sum0),
		.Carry_Out(Carry_Out0)
	);

	FA_16bit CSA1(
		.A(Sum0),
		.B(Carry_Out0 << 1),
		.C(Act_PPR3),
		.Sum(Sum1),
		.Carry_Out(Carry_Out1)
	);

	booth_encoder enc0(
		.Multiplicand(Multiplicand),
		.SSM(SSM0),
		.PPR(PPR0),
		.c(c0)
	);
	booth_encoder enc1(
		.Multiplicand(Multiplicand),
		.SSM(SSM1),
		.PPR(PPR1),
		.c(c1)
	);

        booth_encoder enc2(
                .Multiplicand(Multiplicand),
                .SSM(SSM2),
                .PPR(PPR2),
                .c(c2)
        );

        booth_encoder en3(
                .Multiplicand(Multiplicand),
                .SSM(SSM3),
                .PPR(PPR3),
                .c(c3)
        );



endmodule

