k1 = -1;
k0 = -8;
%% PHẦN 1: quét nhiều giá trị T của mô hình thứ nhất
T_list = [2];   % các giá trị T bạn muốn so sánh

figure;
hold on;
grid on;

colors = lines(length(T_list) + 1); % +1 để chừa màu cho mô hình thứ hai
legends_text = cell(1, length(T_list) + 1);

for k = 1:length(T_list)

    % gán T vào base workspace để Simulink dùng
    T = T_list(k); %#ok<NASGU>
    assignin('base', 'T', T);

    % chạy mô hình thứ nhất (ví dụ bài 2 - có block Transfer Fcn [1 0]/[T 1])
    simOut = sim('bai2111', 'ReturnWorkspaceOutputs', 'on');
    % đổi 'ex1_closed' thành tên file simulink của bài 2 của bạn

    % lấy dữ liệu y_out xuất từ To Workspace
    y_struct = simOut.get('y_out');   % nếu biến khác tên, đổi ở đây
    t = y_struct.time;
    y = y_struct.signals.values;

    % vẽ đường cho T hiện tại
    plot(t, y, 'LineWidth', 2, 'Color', colors(k,:));

    % ghi chú legend
    legends_text{k} = sprintf('T = %.3f', T_list(k));
end


%% PHẦN 2: chạy mô hình thứ hai và vẽ chung
% ví dụ: mô hình bài 1 (dùng Derivative block thay vì Transfer Fcn)
% mô hình này giả sử không phụ thuộc biến T, hoặc dùng logic khác

%simOut2 = sim('bai12', 'ReturnWorkspaceOutputs', 'on');
% đổi 'ex1_derivative' thành tên file simulink thứ hai (ví dụ bài 1)

%y_struct2 = simOut2.get('y_out');   % cùng tên biến To Workspace hoặc đổi nếu khác
%t2 = y_struct2.time;
%y2 = y_struct2.signals.values;

% vẽ đường mô hình thứ hai
%plot(t2, y2, 'LineWidth', 2, 'LineStyle', '--', 'Color', colors(end,:));

% thêm chú thích cho đường này vào legend
legends_text{end} = 'задание 1';

%% PHẦN 3: trang trí chung
xlabel('t (s)');
ylabel('y(t)');
title('Cопоставление графиков');
legend(legends_text, 'Location', 'best');
hold off;
