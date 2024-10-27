`timescale 1ns / 1ps

// 4-bit
module x3(
  input [3:0] i,
  output [3:0] out
);
  assign out = i + 3;
endmodule

module test;
  reg [3:0] i;
  wire [3:0] out;

  x3 dut (i, out);

  initial begin
    for (i = 0; i < 13; i = i + 1) begin
      #5;
      $display ("i=%0d, out=%0d", i, out);
    end

    $finish;
  end
endmodule
