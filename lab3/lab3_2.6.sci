n = -3:10; // Khoảng thời gian khảo sát
k = 2;     // Độ trễ

// Hàm định nghĩa tín hiệu x(n) = 1 với 0 <= n <= 3
function res = x_func(t)
    res = zeros(t);
    res(t >= 0 & t <= 3) = 1;
endfunction

// CÂU (B): Hệ thống y(n) = x(n^2)
clf()
// 1. Tính y(n) = x(n^2) sau đó dịch trễ thành y(n-k)
yn_b = zeros(n);
for i = 1:length(n)
    n_sq = n(i)^2;
    if (n_sq >= 0 & n_sq <= 3) then yn_b(i) = 1; end
end
yn_delayed_b = [zeros(1, k), yn_b(1:$-k)]; // Dịch y(n) sang phải k đơn vị

// 2. Tính y2(n) = T[x(n-k)] = x((n^2)-k)
y2n_b = zeros(n);
for i = 1:length(n)
    idx = n(i)^2 - k;
    if (idx >= 0 & idx <= 3) then y2n_b(i) = 1; end
end

// Vẽ đồ thị cho (b)
f1 = scf(0); f1.figure_name = "Cau (b): y(n) = x(n^2)";
subplot(2,1,1); plot2d3(n, yn_delayed_b); xtitle("y(n-2)", "n", "x");
subplot(2,1,2); plot2d3(n, y2n_b); xtitle("y2(n) = T[x(n-2)]", "n", "x");

// CÂU (C): Hệ thống y(n) = x(n) - x(n-1)
// 1. y(n-k)
yn_c = x_func(n) - x_func(n-1);
yn_delayed_c = [zeros(1, k), yn_c(1:$-k)];

// 2. y2(n) = T[x(n-k)] = x(n-k) - x(n-k-1)
y2n_c = x_func(n-k) - x_func(n-k-1);

// Vẽ đồ thị cho (c)
f2 = scf(1); f2.figure_name = "Cau (c): y(n) = x(n) - x(n-1)";
subplot(2,1,1); plot2d3(n, yn_delayed_c); xtitle("y(n-2)", "n", "x");
subplot(2,1,2); plot2d3(n, y2n_c); xtitle("y2(n) = T[x(n-2)]", "n", "x");

// CÂU (D): Hệ thống y(n) = n*x(n)
// 1. y(n-k) = (n-k) * x(n-k)
yn_delayed_d = (n-k) .* x_func(n-k);

// 2. y2(n) = T[x(n-k)] = n * x(n-k)
y2n_d = n .* x_func(n-k);

// Vẽ đồ thị cho (d)
f3 = scf(2); f3.figure_name = "Cau (d): y(n) = n*x(n)";
subplot(2,1,1); plot2d3(n, yn_delayed_d); xtitle("y(n-2)", "n", "x");
subplot(2,1,2); plot2d3(n, y2n_d); xtitle("y2(n) = T[x(n-2)]", "n", "x");
