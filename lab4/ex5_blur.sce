// Exercise 5 - Image Blur (Scilab 2026)
[X, Y] = meshgrid(linspace(0,1,100), linspace(0,1,100));

// Tao anh
gradient_bg = X * 120 + Y * 80;
circle1 = double((X-0.35).^2 + (Y-0.6).^2 < 0.05^2) * 60;
circle2 = double((X-0.7).^2  + (Y-0.3).^2 < 0.08^2) * 50;
noise = grand(100, 100, "unf", -15, 15);
img_gray = max(0, min(255, gradient_bg + circle1 + circle2 + noise));

// Blur 3x3
[r, c] = size(img_gray);
img_blur = img_gray;
for i = 2:r-1
    for j = 2:c-1
        img_blur(i,j) = mean(img_gray(i-1:i+1, j-1:j+1));
    end
end

// Colormap gray thu cong
gray256 = [(0:255)/255, (0:255)/255, (0:255)/255];
gray256 = matrix(gray256, 256, 3);

// Hien thi
scf(1);
clf();

// Colormap
gcf().color_map = gray256;

// Chia khung thành 1 hàng, 2 cột

subplot(1,2,1);
Matplot(img_gray);
title("Original");

subplot(1,2,2);
Matplot(img_blur);
title("Blurred");
