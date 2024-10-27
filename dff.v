`timescale 1ns / 1ps

module d_ff(
  input d, rst, clk,
  output reg out
);
  always @ (posedge clk)
    begin
      if (!rst) out <= 0;
      else out <= d;
    end
endmodule

module test;
  reg d, rst, clk;
  wire out;

  d_ff uut (d, rst, clk, out);

  initial begin
    rst <= 0;
    d <= 0;
    #5;

    $display("d=%0d, rst=%0d, clk=%0d, out=%0d", d, rst, clk, out);
    d = 1;
    #10;

    $display("d=%0d, rst=%0d, clk=%0d, out=%0d", d, rst, clk, out);
    d = 0;
    #10;

    $display("d=%0d, rst=%0d, clk=%0d, out=%0d", d, rst, clk, out);
    d = 1;
    rst = 1;
    #10;

    $display("d=%0d, rst=%0d, clk=%0d, out=%0d", d, rst, clk, out);
    $finish;
  end

  always begin
    clk = 0;
    #10;
    clk = 1;
    #10;
  end
endmodule
