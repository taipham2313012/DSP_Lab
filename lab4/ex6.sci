x = [1, 2, -3, 2, 1];
h = [1, 0, -1];
//Fold và shift
nx = length(x); nh = length(h);
ny = nx + nh - 1;
y_fold = zeros(1, ny);

x_padded = [zeros(1, nh-1), x, zeros(1, nh-1)];
h_flipped = h($:-1:1); // Folding

for n = 1:ny
    y_fold(n) = sum(x_padded(n:n+nh-1) .* h_flipped);
end

disp("Kết quả tích chập (Folding and Shifting):");
disp(y_fold);

//Ma trận
x = x';
N = length(x); M = length(h);
L = N + M - 1;
H = zeros(L, N);

for j = 1:N
    H(j:j+M-1, j) = h';
end

y_matrix = H * x;
disp("Ma trận tích chập H:");
disp(H);
disp("Kết quả tích chập (Matrix Method):");
disp(y_matrix');

n = 0:length(y_fold)-1;
clf();

subplot(3,1,1);
plot2d3(0:length(x)-1, x, 2);
xtitle("Tín hiệu x(n)", "n", "Biên độ");

subplot(3,1,2);
plot2d3(n, y_fold, 5, rect=[min(n)-1, min(y_fold)-0.5, max(n)+1, max(y_fold)+0.5]);
xtitle("Tín hiệu y(n)", "n", "Biên độ");

subplot(3,1,3);
plot2d3(n, y_fold.^2, 3, rect=[min(n)-1, min(y_fold.^2), max(n)+1, max(y_fold.^2)]);
xtitle("Năng lượng của tín hiệu y(n)", "n", "y(n)^2");
