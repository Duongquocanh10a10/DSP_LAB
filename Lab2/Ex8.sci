/*
clf;
n = -2:1;
x = [1 -2 3 6];

// --- y1(n) = x(-n): fold, then plot against its own valid range ---
n_y1 = -1:2;
y1 = [6 3 -2 1];

subplot(2,1,1)
plot2d3(n, x)
title('x(n)'); xlabel('n'); ylabel('Amplitude')
subplot(2,1,2)
plot2d3(n_y1, y1)
title('y1(n) = x(-n)'); xlabel('n'); ylabel('Amplitude')
*/
// --- y2(n) = x(n+3): advance ---

clf;
n_y2 = -5:-2;
y2 = [1 -2 3 6];

subplot(2,1,1)
plot2d3(n, x)
title('x(n)'); xlabel('n'); ylabel('Amplitude')
subplot(2,1,2)
plot2d3(n_y2, y2)
title('y2(n) = x(n+3)'); xlabel('n'); ylabel('Amplitude')
/*
// --- y3(n) = 2*x(-n-2): fold + shift + scale ---
clf;
n_y3 = -3:0;
y3 = [12 6 -4 2];

subplot(2,1,1)
plot2d3(n, x)
title('x(n)'); xlabel('n'); ylabel('Amplitude')
subplot(2,1,2)
plot2d3(n_y3, y3)
title('y3(n) = 2x(-n-2)'); xlabel('n'); ylabel('Amplitude')

*/
