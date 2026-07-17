`timescale 1ns/1ps

module fir_tb();

reg clk;
reg rst_n;

reg signed [7:0] x_in;
reg signed [7:0] x_clean;

wire signed [15:0] y_out;

fir32_lowpass uut(

.clk(clk),
.rst_n(rst_n),
.x_in(x_in),
.y_out(y_out)

);

always #10 clk=~clk;

integer n;

initial
begin

clk=0;
rst_n=0;

x_clean=0;
x_in=0;

#50;
rst_n=1;

for(n=0;n<150;n=n+1)
begin

// t?o tín hi?u th?p t?n

if(n<25)
x_clean=20;

else if(n<50)
x_clean=40;

else if(n<75)
x_clean=20;

else if(n<100)
x_clean=-20;

else if(n<125)
x_clean=-40;

else
x_clean=20;


// thêm nhi?u cao t?n

if(n%2==0)
x_in=x_clean+15;
else
x_in=x_clean-15;

#20;

end

#1000;
$stop;

end

endmodule
