module fir32_lowpass(
input clk,
input rst_n,
input signed [7:0] x_in,
output reg signed [15:0] y_out
);

parameter N=32;

reg signed [7:0] delay[0:N-1];
reg signed [7:0] coeff[0:N-1];

integer i;
reg signed [15:0] sum;

initial begin

coeff[0]=1;
coeff[1]=1;
coeff[2]=2;
coeff[3]=2;
coeff[4]=3;
coeff[5]=4;
coeff[6]=5;
coeff[7]=6;
coeff[8]=7;
coeff[9]=8;
coeff[10]=9;
coeff[11]=10;
coeff[12]=11;
coeff[13]=12;
coeff[14]=13;
coeff[15]=14;

coeff[16]=14;
coeff[17]=13;
coeff[18]=12;
coeff[19]=11;
coeff[20]=10;
coeff[21]=9;
coeff[22]=8;
coeff[23]=7;
coeff[24]=6;
coeff[25]=5;
coeff[26]=4;
coeff[27]=3;
coeff[28]=2;
coeff[29]=2;
coeff[30]=1;
coeff[31]=1;

end


always@(posedge clk or negedge rst_n)
begin

if(!rst_n)
begin

for(i=0;i<N;i=i+1)
delay[i]<=0;

y_out<=0;

end

else
begin

for(i=N-1;i>0;i=i-1)
delay[i]<=delay[i-1];

delay[0]<=x_in;

sum=0;

for(i=0;i<N;i=i+1)
sum=sum+delay[i]*coeff[i];

y_out<=sum>>>6;

end

end

endmodule
