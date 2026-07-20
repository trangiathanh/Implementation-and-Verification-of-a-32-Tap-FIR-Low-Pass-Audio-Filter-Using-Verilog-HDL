Fs = 48000;
Ts = 1/Fs;
T = 0.05;

t = 0:Ts:T;

x1 = sin(2*pi*1000*t);
x2 = sin(2*pi*10000*t);

x = x1 + x2;

h = [1 1 2 2 3 4 5 6 7 8 9 10 11 12 13 14 ...
     14 13 12 11 10 9 8 7 6 5 4 3 2 2 1 1]/64;

y = filter(h,1,x);

figure;
subplot(2,1,1);
plot(t,x);
title('Input Signal');

subplot(2,1,2);
plot(t,y);
title('Output Signal');
