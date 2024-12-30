`timescale 1ns/10ps

module top();
    reg clk;
    reg rst;
    wire out;

    parameter int div_value = 3;
    parameter int SIM_TIME = 1000;
    parameter int CLK_PERIOD = 10;

    div_by_n #(div_value) dut(
        .clk(clk),
        .rst(rst),
        .out(out)
    );

    initial begin: clk_gen
        clk = 0;
        forever #(CLK_PERIOD / 2) clk = ~clk;
    end

    initial begin: rst_gen
        rst = 0;
        #10 rst = 1;
    end

    initial begin
        #(SIM_TIME) $finish;
    end

endmodule