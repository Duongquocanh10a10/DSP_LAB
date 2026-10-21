x = [0, 1/3, 2/3, 1, 1, 1, 1];  o = 4;        // n = -3..3
// (b1) fold then delay by 4
[y1, o1] = fold(x, o);   [y1, o1] = delay(y1, o1, 4);
// (b2) delay by 4 then fold
[y2, o2] = delay(x, o, 4);   [y2, o2] = fold(y2, o2);
// (c) x(-n+4): same as b1
