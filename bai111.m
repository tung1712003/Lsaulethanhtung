a2 = 1;
a1 = 1; 
a0 = -6;
dy = 5;


data = sim('bai11');

t = data.y_out.time;
y = data.y_out.signals.values;

figure;
plot(t, y, 'LineWidth', 2);
grid on;
xlabel('t (s)');
ylabel('y(t)');
title('y(t) - движение pазомкнутой системы');
