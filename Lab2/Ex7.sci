// reuse n_common, x1f, x2f from Exercise 6
y_mult = x1f .* x2f;

subplot(3,1,1)
plot2d3(n_common, x1f)
title('x1(n)'); xlabel('n'); ylabel('Amplitude')

subplot(3,1,2)
plot2d3(n_common, x2f)
title('x2(n)'); xlabel('n'); ylabel('Amplitude')

subplot(3,1,3)
plot2d3(n_common, y_mult)
title('y(n) = x1(n) . x2(n)'); xlabel('n'); ylabel('Amplitude')
