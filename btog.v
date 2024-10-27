`timescale 1ns / 1ps

module btog(
  input [3:0] bin,
  output [3:0] gray
);
  assign gray[3] = bin[3];
  assign gray[2] = bin[3]^bin[2];
  assign gray[1] = bin[2]^bin[1];
  assign gray[0] = bin[1]^bin[0];
endmodule

module test;
  reg [3:0] bin;
  wire [3:0] gray;

  btog uut (bin, gray);

  integer i;

  initial begin
    for (i = 0; i < 9; i = i + 1) begin
      bin <= i;

      #5;
      $display("bin = 0b%0b, gray = 0b%0b", bin, gray);
    end

    $finish;
  end
endmodule
