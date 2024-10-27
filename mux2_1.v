`timescale 1ns / 1ps

module mux2_1(
  input [1:0] i,
  input s,
  output out
);
  assign out = (s & i[1]) | (s & i[0]);
endmodule

module testbench;
  reg [1:0] i;
  reg s;
  
  wire out;

  mux2_1 uut (i, s, out);

  initial begin
    i[0] = 0;
    i[1] = 1;
    s <= 0;

    #5;
    $display ("i = %0d, s = %0d, out = %0d", i, s, out);
    s <= 1;

    #5;
    $display ("i = %0d, s = %0d, out = %0d", i, s, out);

    $finish;
  end
endmodule
