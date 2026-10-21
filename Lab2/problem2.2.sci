x = [1 1 1 1 .5 .5];  o = 2;
[a,oa] = delay(x, o, 2);                                   // (a)
[b,ob] = fold(x, o);  [b,ob] = delay(b, ob, 4);            // (b)
[c,oc] = advance(x, o, 2);                                 // (c)
u = [1 1 1 1 0 0];                                         // u(2-n) for n = -1..4
[d,od] = multi(x, o, u, o);                                // (d)
[e1,oe1] = delay(x, o, 1);  dl = [0 0 0 1];                // delta(n-3), n = 0..3
[e,oe] = multi(e1, oe1, dl, 1);                            // (e)
// (f) x(n^2): loop over n = -2..2
nn = -2:2;  f = zeros(1, length(nn));
for i = 1:length(nn)
    idx = nn(i)^2 + o;                                     // index of x(n^2)
    if idx >= 1 & idx <= length(x) then f(i) = x(idx); end
end
scf(); plot_sig(f, 3, "x(n^2)");
// (g), (h)
[xf, of] = fold(x, o);
[s, os] = add(x, o, xf, of);       xe = s/2;               // even part
[dff, od2] = add(x, o, -xf, of);   xo = dff/2;             // odd part
scf(); subplot(2,1,1); plot_sig(xe, os, "even part");
subplot(2,1,2); plot_sig(xo, od2, "odd part");
