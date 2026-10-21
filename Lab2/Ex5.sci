clf;
n = -1:1;
x = [1 3 -2];

x_reverse = x($: -1:1);
xe = (x + x_reverse) / 2;
xo = (x - x_reverse) / 2;

disp(xe);
disp(xo); 
subplot(3,1,1)
plot2d3(n,x)
title('x(n)'); xlabel('n'); ylabel('Amplitude')

subplot(3,1,2)
plot2d3(n, xe)
title('Even component xe(n)'); xlabel('n'); ylabel('Ampltidue')

subplot(3,1,3)
plot2d3(n,xo)
title('Odd component xo(n)'); xlabel('n'); ylabel('Amplitude')


