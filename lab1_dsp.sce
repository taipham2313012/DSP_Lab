// ===================== EX 1.1 =====================
x = 1:4;
y = 5:8;

v1 = x + 1
v2 = x .* y

t = linspace(0, %pi, 10);
v3 = sin(t)

// ===================== EX 1.2 =====================
// Analog signal xa(t)
f0 = 50; T0 = 1/f0;
t = linspace(0, 5*T0, 1000);
xa = 3*sin(100*%pi*t);

// Discrete signal x(n) - Fs = 300
Fs = 300; Ts = 1/Fs;
N_period = 6; // period of x(n): N = Fs/f0 = 6
n = 0 : 5*N_period - 1;
xn = 3*sin(100*%pi*n*Ts);

// Quantized signal xq(n) - truncated, delta = 0.1
delta = 0.1;
xq = floor(xn / delta) * delta;

// Plot all in one window
figure(1);

subplot(3,1,1);
plot(t, xa);
title('xa(t) - Analog');
xlabel('t (s)'); ylabel('Amplitude');
xgrid();

subplot(3,1,2);
plot2d3(n, xn);
title('x(n) - Discrete (Fs=300)');
xlabel('n'); ylabel('Amplitude');
xgrid();

subplot(3,1,3);
plot2d3(n, xq);
title('xq(n) - Quantized (delta=0.1, truncate)');
xlabel('n'); ylabel('Amplitude');
xgrid();
