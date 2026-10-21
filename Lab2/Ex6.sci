clf;
n1 = 0:3;   x1 = [0 1 3 -2];
n2 = -1:2;  x2 = [0 1 2 3];

n_common = -1:3;
x1f = zeros(1, length(n_common));
x1f(n1 - n_common(1) + 1) = x1;

x2f = zeros(1, length(n_common));
x2f(n2 - n_common(1) + 1) = x2;

y = x1f + x2f;

subplot(3,1,1)
plot2d3(n_common, x1f)
title('x1(n)'); xlabel('n'); ylabel('Amplitude')

subplot(3,1,2)
plot2d3(n_common, x2f)
title('x2(n)'); xlabel('n'); ylabel('Amplitude')

subplot(3,1,3)
plot2d3(n_common, y)
title('y(n) = x1(n) + x2(n)'); xlabel('n'); ylabel('Amplitude')
