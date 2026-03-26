// Định nghĩa tín hiệu x(n)
function y = x(n)
    y = zeros(n)
    for i = 1:length(n)
        ni = n(i)
        if (ni >= -3 & ni <= -1) then
            y(i) = 1 + ni/3
        elseif (ni >= 0 & ni <= 3) then
            y(i) = 1
        else
            y(i) = 0
        end
    end
endfunction

// Dải n
n = -6:6;
xn = x(n);

// (a) Vẽ x(n)
scf(1); clf(1);
plot2d3(n, xn, style=2, rect=[-6.5,-0.2,6.5,1.2])
xtitle('x(n)','n','x')
xgrid()

// (b1) Gấp rồi trễ 4: x(-n+4)
n1 = n;
y1 = x(-n1+4);
scf(2); clf(2);
plot2d3(n1, y1, style=2, rect=[-6.5,-0.2,6.5,1.2])
xtitle('x(-n+4) = fold then delay','n','x')
xgrid()

// (b2) Trễ rồi gấp: x(-n-4)
y2 = x(-n1-4);
scf(3); clf(3);
plot2d3(n1, y2, style=2, rect=[-6.5,-0.2,6.5,1.2])
xtitle('x(-n-4) = delay then fold','n','x')
xgrid()

// (c) Trực tiếp x(-n+4) (giống hình b1)
