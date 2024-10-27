`timescale 1ns / 1ps

module mux4_1(
  input [3:0] i,
  input [1:0] s,
  output out
);
  assign out = i[s];
endmodule

module test;
  reg [3:0] i;
  reg [1:0] s;
  wire out;

  integer iter;

  mux4_1 uut (i, s, out);

  initial begin
    i <= 4'b1010;
    s <= 0;

    for (iter = 0; iter < 4; iter = iter + 1) begin
      #5;
      $display("i=0b%0b, s=%0d, out=%0d", i, s, out);
      s <= iter + 1;
    end


    $finish;
  end
endmodule
