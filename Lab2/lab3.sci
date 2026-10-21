// ---------- helpers ----------
function plot_sig(x, o, ttl)
    n = (1:length(x)) - o;       // time axis from the origin index
    plot2d3(n, x);               // stem-like plot
    a = gca();
    a.x_location = "origin";     // draw the n-axis through y = 0
    xtitle(ttl, "n", "amplitude");
    xgrid();
endfunction

// align two signals on a common axis: returns padded vectors and the origin index L
function [a, b, L] = align(x1n, o1, x2n, o2)
    L = max(o1, o2);
    R = max(length(x1n) - o1, length(x2n) - o2);
    N = L + R;
    a = zeros(1, N);  b = zeros(1, N);
    a(L-o1+1 : L-o1+length(x1n)) = x1n;
    b(L-o2+1 : L-o2+length(x2n)) = x2n;
endfunction
function [yn, yorigin] = delay(xn, xorigin, k)
    yn = xn;
    yorigin = xorigin - k;
    if yorigin < 1 then
        pad = 1 - yorigin;                 // number of zeros to prepend
        yn = [zeros(1, pad), xn];
        yorigin = 1;
    end
    scf();
    subplot(2,1,1); plot_sig(xn, xorigin, "x(n)");
    subplot(2,1,2); plot_sig(yn, yorigin, "y(n) = x(n - " + string(k) + ")");
endfunction

function [yn, yorigin] = advance(xn, xorigin, k)
    yn = xn;
    yorigin = xorigin + k;
    if yorigin > length(xn) then
        yn = [xn, zeros(1, yorigin - length(xn))];
    end
    scf();
    subplot(2,1,1); plot_sig(xn, xorigin, "x(n)");
    subplot(2,1,2); plot_sig(yn, yorigin, "y(n) = x(n + " + string(k) + ")");
endfunction
function [yn, yorigin] = fold(xn, xorigin)
    yn = xn($:-1:1);
    yorigin = length(xn) - xorigin + 1;
    scf();
    subplot(2,1,1); plot_sig(xn, xorigin, "x(n)");
    subplot(2,1,2); plot_sig(yn, yorigin, "y(n) = x(-n)");
endfunction
function [yn, yorigin] = add(x1n, x1origin, x2n, x2origin)
    [a, b, L] = align(x1n, x1origin, x2n, x2origin);
    yn = a + b;
    yorigin = L;
    scf();
    subplot(3,1,1); plot_sig(x1n, x1origin, "x1(n)");
    subplot(3,1,2); plot_sig(x2n, x2origin, "x2(n)");
    subplot(3,1,3); plot_sig(yn,  yorigin,  "y(n) = x1(n) + x2(n)");
endfunction
function [yn, yorigin] = multi(x1n, x1origin, x2n, x2origin)
    [a, b, L] = align(x1n, x1origin, x2n, x2origin);
    yn = a .* b;
    yorigin = L;
    scf();
    subplot(3,1,1); plot_sig(x1n, x1origin, "x1(n)");
    subplot(3,1,2); plot_sig(x2n, x2origin, "x2(n)");
    subplot(3,1,3); plot_sig(yn,  yorigin,  "y(n) = x1(n) . x2(n)");
endfunction
function [yn, yorigin] = convolution(xn, xorigin, hn, horigin)
    Nx = length(xn);  Nh = length(hn);
    yn = zeros(1, Nx + Nh - 1);
    for i = 1:Nx
        for j = 1:Nh
            yn(i+j-1) = yn(i+j-1) + xn(i) * hn(j);
        end
    end
    yorigin = xorigin + horigin - 1;
    scf();
    subplot(3,1,1); plot_sig(xn, xorigin, "x(n)");
    subplot(3,1,2); plot_sig(hn, horigin, "h(n)");
    subplot(3,1,3); plot_sig(yn, yorigin, "y(n) = x(n) * h(n)");
endfunction
