`timescale 1ns / 1ps

module gtob(
  input [3:0] gray,
  output [3:0] bin
);
  assign bin[3] = gray[3];
  assign bin[2] = gray[3]^gray[2];
  assign bin[1] = gray[3]^gray[2]^gray[1];
  assign bin[0] = gray[3]^gray[2]^gray[1]^gray[0];
endmodule

module test;
  reg [3:0] gray;
  wire [3:0] bin;

  gtob uut (gray, bin);

  integer i;

  initial begin
    for (i = 0; i < 9; i = i + 1) begin
      gray <= i;

      #5;
      $display("bin = 0b%0b, gray = 0b%0b", bin, gray);
    end

    $finish;
  end
endmodule
