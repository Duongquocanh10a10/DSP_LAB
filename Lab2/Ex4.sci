n = -5:5;
ur = n .* bool2s(n>0)
disp(n); disp(ur);
plot2d3(n,ur)
title(' Unit ramp signal ur(n)')
xlabel('n')
ylabel('Amplitude')
