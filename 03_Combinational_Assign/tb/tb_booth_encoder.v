`timescale 1ns/1ps

module tb_booth_encoder;
	

        reg [2:0] SSM;
        reg [7:0] Multiplicand;
        wire signed [15:0] Act_PPR;

	wire signed [15:0] PPR;
	wire c;


	assign Act_PPR = PPR +{15'b0,c};

	booth_encoder dut(
		.Multiplicand(Multiplicand),
		.PPR(PPR),
		.SSM(SSM),
		.c(c)
	);

	initial begin
		assign Multiplicand = 8'sd5;
		assign SSM = 3'b100;
		#10;
                $display("Multiplicand = %0d, SSM = %b, Act_PPR = %0d",Multiplicand,SSM,Act_PPR);
		assign Multiplicand = 8'sd10;
		assign SSM = 3'b101;
		#10;
		$display("Multiplicand = %0d, SSM = %b, Act_PPR = %0d",Multiplicand,SSM,Act_PPR);
		$finish;
	end
endmodule

 

