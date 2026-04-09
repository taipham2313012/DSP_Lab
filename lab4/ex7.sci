x = [1, 2, -3, 2, 1];
h = [1, 0, -1, -1, 1];
N = length(x);
y_circ_fold = zeros(1, N);

for n = 0:N-1
    sum_val = 0;
    for k = 0:N-1
        idx = pmodulo(n - k, N);
        sum_val = sum_val + h(k+1) * x(idx+1);
    end
    y_circ_fold(n+1) = sum_val;
end

disp("Kết quả tích chập vòng (Folding and Shifting):");
disp(y_circ_fold);

x = x';
h = [1, 0, -1, -1, 1];
N = length(x);
H_circ = zeros(N, N);

for i = 1:N
    for j = 1:N
        H_circ(i, j) = h(pmodulo(i - j, N) + 1);
    end
end

y_circ_matrix = H_circ * x;
disp("Ma trận vòng H_circ:");
disp(H_circ);
disp("Kết quả tích chập vòng (Matrix Method):");
disp(y_circ_matrix');

n = 0:N-1;
clf();

subplot(3,1,1);
plot2d3(n, x, 2);
xtitle("Tín hiệu x(n)", "n", "Biên độ");

subplot(3,1,2);
plot2d3(n, y_circ_fold, 5, rect=[min(n)-1, min(y_circ_fold)-0.5, max(n)+1, max(y_circ_fold)+0.5]);
xtitle("Circular Convolution: y(n)", "n", "Biên độ");

subplot(3,1,3);
plot2d3(n, y_circ_fold.^2, 3, rect=[min(n)-1, min(y_circ_fold.^2), max(n)+1, max(y_circ_fold.^2)]);
xtitle("Năng lượng tín hiệu y(n) vòng", "n", "y(n)^2");
