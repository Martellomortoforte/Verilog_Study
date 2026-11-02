module concat_exercise4(
        input wire [7:0] data,
        output wire [3:0] upper,
        output wire [3:0] lower,
        output wire [7:0] swapped,
        output wire [15:0] duplicated
);

        assign upper = data[7:4];
        assign lower = data[3:0];
        assign swapped = {data[3:0],data[7:4]};
        assign duplicated = {data[7:0],data[7:0]};

endmodule

