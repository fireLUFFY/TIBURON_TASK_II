`timescale 1ns / 1ns
`include "decoder3_8.v"
module dec3_8_testbench;

 reg [2:0] a;
 wire [7:0] y;

 dec3_8 uut( .Y(y), .A(a));

 always begin
     $dumpfile("decoder3_8.vcd");
     $dumpvars(0,dec3_8_testbench);

     a = 3'b000;
     #10 a = 3'b001;
     #10 a = 3'b010;
     #10 a = 3'b011;

     #10 a = 3'b100;
     #10 a = 3'b101;
     #10 a = 3'b110;
     #10 a = 3'b111;

     #20 $finish;
 end

initial begin
    
    $display("time\t a[2] |  a[1]| a[0]\t   y7| y6| y5| y4| y3| y2| y1| y0");
    $monitor("%g\t   %b  |   %b  |  %b\t   %b | %b |  %b|  %b|  %b|  %b|  %b|  %b",$time, a[2], a[1], a[0], y[7], y[6], y[5], y[4], y[3], y[2], y[1], y[0]);

    #100 $finish;
end

endmodule