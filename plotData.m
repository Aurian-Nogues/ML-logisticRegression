
function plotData(X, y)
% plots data in a 2d chart, + for positives and o for negatives.
%X needs to be a Mx2 matrix (i.e. 2 features)

%create new figure
figure;
hold on;

%get which entries are positive or negative
positive_index = find(y == 1);
negative_index = find(y == 0);

% plot positive values
plot(X(positive_index, 1), X(positive_index,2), 'LineWidth', 1, 'MarkerSize', 8,'k+');
hold on;
plot(X(negative_index, 1), X(negative_index,2),'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
xlabel('Exam 1 score');% adds axis label;
ylabel('Exam 2 score'); % add y label;
legend('Admitted', 'Not admitted'); % add legend


% =========================================================================

hold off;

end