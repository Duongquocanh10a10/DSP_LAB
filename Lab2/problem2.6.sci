// ===================================================================
// Problem 2.6 - time-invariance tests (self-contained)
// Load: exec('D:\DSP_LAB\Lab2\problem2.6.sci', -1)
// Each "function" / "endfunction" must be on its own line.
// ===================================================================

// ---------- basic helpers ----------
function plot_sig(x, o, ttl)
    n = (1:length(x)) - o;
    plot2d3(n, x);
    a = gca();
    a.x_location = "origin";
    xtitle(ttl, "n", "amplitude");
    xgrid();
endfunction

function [a, b, L] = align(x1n, o1, x2n, o2)
    L = max(o1, o2);
    R = max(length(x1n) - o1, length(x2n) - o2);
    N = L + R;
    a = zeros(1, N);  b = zeros(1, N);
    a(L-o1+1 : L-o1+length(x1n)) = x1n;
    b(L-o2+1 : L-o2+length(x2n)) = x2n;
endfunction

// delay without plotting: y(n) = x(n-k)
function [yn, yorigin] = delay_np(xn, xorigin, k)
    yn = xn;
    yorigin = xorigin - k;
    if yorigin < 1 then
        yn = [zeros(1, 1 - yorigin), xn];
        yorigin = 1;
    end
endfunction

// ---------- the three systems ----------
function [y, oy] = sysA(x, o)          // y(n) = x(n^2)
    nmax = length(x) - o;
    m = floor(sqrt(nmax));
    y = zeros(1, 2*m+1);
    oy = m + 1;
    for i = -m:m
        idx = i^2 + o;
        if idx >= 1 & idx <= length(x) then
            y(i+oy) = x(idx);
        end
    end
endfunction

function [y, oy] = sysC(x, o)          // y(n) = x(n) - x(n-1)
    [d, od] = delay_np(x, o, 1);
    [a, b, L] = align(x, o, d, od);
    y = a - b;
    oy = L;
endfunction

function [y, oy] = sysD(x, o)          // y(n) = n * x(n)
    y = ((1:length(x)) - o) .* x;
    oy = o;
endfunction

// ---------- display helpers ----------
function set_nrange(nmin, nmax)
    a = gca();
    b = a.data_bounds;
    a.data_bounds = [nmin, b(1,2); nmax, b(2,2)];
endfunction

function show_sig(ttl, x, o)
    mprintf("%s\n", ttl);
    disp([(1:length(x)) - o; x]);
endfunction

// ---------- full six-step time-invariance test ----------
function ti_full(f, x, o, k, nm, nmin, nmax)
    [y,  oy ] = f(x, o);               // (2) y(n)  = T[x(n)]
    [yd, oyd] = delay_np(y, oy, k);    // (3) yd(n) = y(n-k)
    [x2, o2 ] = delay_np(x, o, k);     // (4) x2(n) = x(n-k)
    [y2, oy2] = f(x2, o2);             // (5) y2(n) = T[x2(n)]

    mprintf("\n===== %s , k = %d =====\n", nm, k);
    show_sig("(1) x(n):",                 x,  o);
    show_sig("(2) y(n) = T[x(n)]:",       y,  oy);
    show_sig("(3) yd(n) = y(n-k):",       yd, oyd);
    show_sig("(4) x2(n) = x(n-k):",       x2, o2);
    show_sig("(5) y2(n) = T[x2(n)]:",     y2, oy2);

    [p, q, L] = align(yd, oyd, y2, oy2);
    if max(abs(p - q)) < 1e-12 then
        mprintf("(6) y2(n) == y(n-k) for this input. This does NOT prove TI.\n");
    else
        mprintf("(6) y2(n) <> y(n-k)  =>  system is NOT time-invariant.\n");
    end

    scf();
    subplot(5,1,1); plot_sig(x,  o,   "(1) x(n)");              set_nrange(nmin, nmax);
    subplot(5,1,2); plot_sig(y,  oy,  "(2) y(n) = T[x(n)]");    set_nrange(nmin, nmax);
    subplot(5,1,3); plot_sig(yd, oyd, "(3) yd(n) = y(n-k)");    set_nrange(nmin, nmax);
    subplot(5,1,4); plot_sig(x2, o2,  "(4) x2(n) = x(n-k)");    set_nrange(nmin, nmax);
    subplot(5,1,5); plot_sig(y2, oy2, "(5) y2(n) = T[x2(n)]");  set_nrange(nmin, nmax);
endfunction
