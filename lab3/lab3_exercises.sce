//Ex1
function [yn, yorigin]=delay(xn, xorigin, k)
    // y(n) = x(n - k)
    yn = xn;
    yorigin = xorigin - k; // Gốc tọa độ dịch sang trái trong vector

    nx = (1:length(xn)) - xorigin;
    ny = (1:length(yn)) - yorigin;

    scf();
    subplot(2,1,1); plot2d3(nx, xn, style=2, rect=[min(nx)-1, min(xn)-0.5, max(nx)+1, max(xn)+0.5]); title("x(n)");
    subplot(2,1,2); plot2d3(ny, yn, style=5, rect=[min(ny)-1, min(yn)-0.5, max(ny)+1, max(yn)+0.5]); title("Tín hiệu delay y(n) = x(n-"+string(k)+")");
endfunction

//Ex2
function [yn, yorigin]=advance(xn, xorigin, k)
    // y(n) = x(n + k)
    yn = xn;
    yorigin = xorigin + k; // Gốc tọa độ dịch sang phải trong vector

    nx = (1:length(xn)) - xorigin;
    ny = (1:length(yn)) - yorigin;

    scf();
    subplot(2,1,1); plot2d3(nx, xn, style=2, rect=[min(nx)-1, min(xn)-0.5, max(nx)+1, max(xn)+0.5]); title("x(n)");
    subplot(2,1,2); plot2d3(ny, yn, style=5, rect=[min(ny)-1, min(yn)-0.5, max(ny)+1, max(yn)+0.5]); title("Tín hiệu advance y(n) = x(n+"+string(k)+")");
endfunction

//Ex3
function [yn, yorigin]=fold(xn, xorigin)
    // y(n) = x(-n)
    yn = xn($:-1:1); // Đảo ngược vector
    yorigin = length(xn) - xorigin + 1;

    nx = (1:length(xn)) - xorigin;
    ny = (1:length(yn)) - yorigin;

    scf();
    subplot(2,1,1); plot2d3(nx, xn, style=2, rect=[min(nx)-1, min(xn)-0.5, max(nx)+1, max(xn)+0.5]); title("x(n)");
    subplot(2,1,2); plot2d3(ny, yn, style=5, rect=[min(ny)-1, min(yn)-0.5, max(ny)+1, max(yn)+0.5]); title("Tín hiệu fold y(n) = x(-n)");
endfunction

// Hàm hỗ trợ căn chỉnh khoảng thời gian (dùng chung cho Add và Multi)
function [x1_new, x2_new, n_new]=align_signals(x1n, x1origin, x2n, x2origin)
    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;

    n_min = min(min(n1), min(n2));
    n_max = max(max(n1), max(n2));
    n_new = n_min:n_max;

    x1_new = zeros(1, length(n_new));
    x2_new = zeros(1, length(n_new));

    x1_new(n1 - n_min + 1) = x1n;
    x2_new(n2 - n_min + 1) = x2n;
endfunction

//Ex4
function [yn, yorigin]=add(x1n, x1origin, x2n, x2origin)
    [x1_adj, x2_adj, n_y] = align_signals(x1n, x1origin, x2n, x2origin);
    yn = x1_adj + x2_adj;
    yorigin = 1 - min(n_y);

    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;

    scf();
    subplot(3,1,1); plot2d3(n1, x1n, style=2, rect=[min(n1)-1, min(x1n)-0.5, max(n1)+1, max(x1n)+0.5]); title("x1(n)");
    subplot(3,1,2); plot2d3(n2, x2n, style=3, rect=[min(n2)-1, min(x2n)-0.5, max(n2)+1, max(x2n)+0.5]); title("x2(n)");
    subplot(3,1,3); plot2d3(n_y, yn, style=5, rect=[min(n_y)-1, min(yn)-0.5, max(n_y)+1, max(yn)+0.5]); title("y(n) = x1(n) + x2(n)");
endfunction

//Ex5
function [yn, yorigin]=multi(x1n, x1origin, x2n, x2origin)
    [x1_adj, x2_adj, n_y] = align_signals(x1n, x1origin, x2n, x2origin);
    yn = x1_adj .* x2_adj;
    yorigin = 1 - min(n_y);

    n1 = (1:length(x1n)) - x1origin;
    n2 = (1:length(x2n)) - x2origin;

    scf();
    subplot(3,1,1); plot2d3(n1, x1n, style=2, rect=[min(n1)-1, min(x1n)-0.5, max(n1)+1, max(x1n)+0.5]); title("x1(n)");
    subplot(3,1,2); plot2d3(n2, x2n, style=3, rect=[min(n2)-1, min(x2n)-0.5, max(n2)+1, max(x2n)+0.5]); title("x2(n)");
    subplot(3,1,3); plot2d3(n_y, yn, style=5, rect=[min(n_y)-1, min(yn)-0.5, max(n_y)+1, max(yn)+0.5]); title("y(n) = x1(n) * x2(n)");
endfunction

//Ex6
function [yn, yorigin]=convolution(xn, xorigin, hn, horigin)
    yn = convol(xn, hn);
    yorigin = xorigin + horigin - 1; // Công thức tính gốc tọa độ cho tích chập

    nx = (1:length(xn)) - xorigin;
    nh = (1:length(hn)) - horigin;
    ny = (1:length(yn)) - yorigin;

    scf();
    subplot(3,1,1); plot2d3(nx, xn, style=2, rect=[min(nx)-1, min(xn)-0.5, max(nx)+1, max(xn)+0.5]); title("Input x(n)");
    subplot(3,1,2); plot2d3(nh, hn, style=3, rect=[min(nh)-1, min(hn)-0.5, max(nh)+1, max(hn)+0.5]); title("System h(n)");
    subplot(3,1,3); plot2d3(ny, yn, style=5, rect=[min(ny)-1, min(yn)-0.5, max(ny)+1, max(yn)+0.5]); title("Output y(n) = x(n)*h(n)");
endfunction
