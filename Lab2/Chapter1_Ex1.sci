// 1. Khởi tạo tham số và tín hiệu
Fs = 8000; 
n = 0:31;

x5 = sin(2*%pi*5000*n/Fs);
a3 = -sin(2*%pi*3000*n/Fs); // Cùng dãy mẫu với x5

x9 = sin(2*%pi*9000*n/Fs);
a1 = sin(2*%pi*1000*n/Fs);  // Cùng dãy mẫu với x9

// 2. Vẽ đồ thị
clf(); // Xóa cửa sổ đồ thị hiện tại (nếu có)

// --- Đồ thị 1: So sánh f = 5000 Hz và f = 3000 Hz (ngược pha) ---
subplot(2, 1, 1);
plot(n, x5, 'ro-', 'Thickness', 1.5); // Đường tròn màu đỏ
plot(n, a3, 'bx--', 'Thickness', 1.5); // Dấu x nét đứt màu xanh
title("So sánh x5 (5000 Hz) và a3 (-3000 Hz)");
xlabel("Chỉ số mẫu n");
ylabel("Biên độ");
legend(["x5 (5000 Hz)", "a3 (-3000 Hz)"], "in_upper_right");
xgrid();

// --- Đồ thị 2: So sánh f = 9000 Hz và f = 1000 Hz ---
subplot(2, 1, 2);
plot(n, x9, 'ro-', 'Thickness', 1.5);
plot(n, a1, 'bx--', 'Thickness', 1.5);
title("So sánh x9 (9000 Hz) và a1 (1000 Hz)");
xlabel("Chỉ số mẫu n");
ylabel("Biên độ");
legend(["x9 (9000 Hz)", "a1 (1000 Hz)"], "in_upper_right");
xgrid();
