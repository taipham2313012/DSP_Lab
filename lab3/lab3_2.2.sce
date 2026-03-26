//  x(n) = {1, 1, 1, 1, 0.5, 0.5},  n = -1 : 4,  origin n=0
n_orig = -1:4;
x_orig = [1, 1, 1, 1, 0.5, 0.5];

// Helper: lay gia tri x tai chi so tuy y (tra ve 0 neu ngoai mien)
function v = xval(k)
    idx = find(n_orig == k);
    if isempty(idx) then v = 0; else v = x_orig(idx); end
endfunction

// Helper: ve stem cho 1 subplot
function draw_stem(n_vec, x_vec, ttl)
    plot2d3(n_vec, x_vec);
    plot([min(n_vec)-0.5, max(n_vec)+0.5], [0, 0], 'k-');
    title(ttl); xlabel('n'); ylabel('x');
    ax = gca(); ax.box = 'on';
    ax.data_bounds = [min(n_vec)-0.5, min(x_vec)-0.3;
                      max(n_vec)+0.5, max(x_vec)+0.3];
endfunction
scf(0); clf();
draw_stem(n_orig, x_orig, 'x(n)');
//  (a)  x(n-2)
scf(1); clf();
n_a = -1:6;
x_a = [];
for k = n_a, x_a = [x_a, xval(k-2)]; end
draw_stem(n_a,    x_a,    'x(n-2)');

//  (b)  x(4-n)  --  guong + dich
scf(2); clf();
n_b = -2:5;
x_b = [];
for k = n_b, x_b = [x_b, xval(4-k)]; end
draw_stem(n_b,    x_b,    'x(4-n)');

//  (c)  x(n+2)  --  som 2 mau
scf(3); clf();
n_c = -3:4;
x_c = [];
for k = n_c, x_c = [x_c, xval(k+2)]; end
draw_stem(n_c,    x_c,    'x(n+2)');

//  (d)  x(n)*u(2-n)
scf(4); clf();
n_d = -2:5;
x_d = [];
for k = n_d
    if k <= 2 then u = 1; else u = 0; end
    x_d = [x_d, xval(k) * u];
end
draw_stem(n_d,    x_d,    'x(n)u(2-n)');

//  (e)  x(n-1)*delta(n-3)
scf(5); clf();
n_e = -2:5;
x_e = [];
for k = n_e
    if k == 3 then d = 1; else d = 0; end
    x_e = [x_e, xval(k-1) * d];
end
draw_stem(n_e,    x_e,    'x(n-1)*delta(n-3)');

//  (f)  x(n^2)
scf(6); clf();
n_f = -2:4;
x_f = [];
for k = n_f, x_f = [x_f, xval(k^2)]; end
draw_stem(n_f,    x_f,    'x(n^2)');

//  (g)  Phan chan  xe(n) = 0.5*[x(n) + x(-n)]
scf(7); clf();
n_g = -4:4;
x_g = [];
for k = n_g, x_g = [x_g, 0.5*(xval(k) + xval(-k))]; end
draw_stem(n_g,    x_g,    'xe(n) = 0.5[x(n)+x(-n)][even]');

//  (h)  Phan le  xo(n) = 0.5*[x(n) - x(-n)]
scf(8); clf();
n_h = -4:4;
x_h = [];
for k = n_h, x_h = [x_h, 0.5*(xval(k) - xval(-k))]; end
draw_stem(n_h,    x_h,    'xo(n) = 0.5[x(n)-x(-n)][odd]');
