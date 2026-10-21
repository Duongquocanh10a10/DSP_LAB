n1 = -1:4; x1 = [1 -1 0 0 2 -4];
n2 = -1:3; x2 = [-2 3 1 0 -3];

// y1(n) = x1(n-2) : shift support by +2
ny1 = n1 + 2; y1 = x1;

// y2(n) = x2(1-n): reverse then relabel
ny2 = 1 - n2; y2 = x2;
[ny2, idx] = gsort(ny2, 'g', 'i'); y2 = y2(idx);

disp(ny1); disp(y1)
disp(ny2); disp(y2)

ny3 = ny1; y3 = y1 + y2;
disp(ny3); disp(y3);
