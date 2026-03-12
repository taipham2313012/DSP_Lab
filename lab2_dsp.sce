// ===================== EX 2 =====================
n = -5:5;
msignal = bool2s(n >= 0);
figure(1); plot2d3(n, msignal, rect=[-5, 0, 5, 5]);
title('Ex2: Unit Step u(n)'); xlabel('n'); ylabel('Amplitude');


// ===================== EX 3 =====================
n = -5:5;
msignal = bool2s(n == 0);
figure(2); plot2d3(n, msignal, rect=[-5, 0, 5, 5]);
title('Ex3: Unit Impulse d(n)'); xlabel('n'); ylabel('Amplitude');

// ===================== EX 4 =====================
n = -5:5;
ur = n .* bool2s(n >= 0);
figure(3); plot2d3(n, ur, rect=[-5, 0, 5, 5]);
title('Ex4: Unit Ramp ur(n)'); xlabel('n'); ylabel('Amplitude');

// ===================== EX 5 =====================
// x(n) = {1, 3, -2}, origin at index 1 (3 is at n=0)
xv = [1, 3, -2];
nx = -1:1;

// Even and Odd components require x(-n)
// Extend to common range
n_min = -2; n_max = 2;
n_full = n_min:n_max;
x_full = zeros(1, length(n_full));
for i = 1:length(nx)
    idx = nx(i) - n_min + 1;
    x_full(idx) = xv(i);
end
x_fold = x_full($:-1:1);

xe = 0.5 * (x_full + x_fold);
xo = 0.5 * (x_full - x_fold);

figure(4);
subplot(3,1,1); plot2d3(n_full, x_full, style=2);
title('Ex5: x(n)'); xlabel('n'); ylabel('x(n)');
subplot(3,1,2); plot2d3(n_full, xe, style=5);
title('Even xe(n)'); xlabel('n'); ylabel('xe(n)');
subplot(3,1,3); plot2d3(n_full, xo, style=3);
title('Odd xo(n)'); xlabel('n'); ylabel('xo(n)');

// ===================== EX 6 =====================
// x1(n)={0,1,3,-2}, origin at n=0; x2(n)={0,1,2,3}, origin at n=-1
nx1 = 0:3; x1v = [0, 1, 3, -2];
nx2 = -1:2; x2v = [0, 1, 2, 3];

n6_min = min(min(nx1), min(nx2));
n6_max = max(max(nx1), max(nx2));
n6 = n6_min:n6_max;
x1 = zeros(1, length(n6)); x2 = zeros(1, length(n6));
for i = 1:length(nx1), x1(nx1(i)-n6_min+1) = x1v(i); end
for i = 1:length(nx2), x2(nx2(i)-n6_min+1) = x2v(i); end
y6 = x1 + x2;

figure(5);
subplot(3,1,1); plot2d3(n6, x1); title('Ex6: x1(n)'); xlabel('n'); ylabel('x1(n)');
subplot(3,1,2); plot2d3(n6, x2, style=5); title('x2(n)'); xlabel('n'); ylabel('x2(n)');
subplot(3,1,3); plot2d3(n6, y6, style=3); title('y(n)=x1(n)+x2(n)'); xlabel('n'); ylabel('y(n)');

// ===================== EX 7 =====================
y7 = x1 .* x2;
figure(6);
subplot(3,1,1); plot2d3(n6, x1); title('Ex7: x1(n)'); xlabel('n'); ylabel('x1(n)');
subplot(3,1,2); plot2d3(n6, x2, style=5); title('x2(n)'); xlabel('n'); ylabel('x2(n)');
subplot(3,1,3); plot2d3(n6, y7, style=3); title('y(n)=x1(n)*x2(n)'); xlabel('n'); ylabel('y(n)');

// ===================== EX 8 =====================
// x(n) = {1, -2, 3(up), 6} -> n = -2:1
nx8 = -2:1;
x8 = [1, -2, 3, 6];

// y1(n) = x(-n)
y1 = [6, 3, -2, 1]; ny1 = -1:2;

// y2(n) = x(n+3)
ny2 = nx8 - 3; // -5:-2

// y3(n) = 2*x(-n-2)
ny3 = ny1 - 2; // -3:0
y3 = 2 * y1;

figure(7);
subplot(2,1,1); plot2d3(nx8, x8); title("x(n)");
subplot(2,1,2); plot2d3(ny1, y1, style=2); title("y1(n) = x(-n)");
figure(8);
subplot(2,1,1); plot2d3(nx8, x8); title("x(n)");
subplot(2,1,2); plot2d3(ny2, x8, style=5); title("y2(n) = x(n+3)");
figure(9);
subplot(2,1,1); plot2d3(nx8, x8); title("x(n)");
subplot(2,1,2); plot2d3(ny3, y3, style=3); title("y3(n) = 2x(-n-2)");
