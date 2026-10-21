// Quick numerical check for (e): x(n+16) should equal x(n)
n = 0:20;
x = cos(%pi*n/2) - sin(%pi*n/8) + 3*cos(%pi*n/4 + %pi/3);
disp(x(1:5))        // n = 0..4
disp(x(17:21))       // n = 16..20, should match n=0..4
