function out = mapFeature(X1, X2)
% feature mapping function to polynomial features
% maps the two input features to quadratic features
% returns a new feature matrix with more features 
%  X1, X2, X1.^2, X2.^2, X1*X2, X1*X2.^2, etc..

degree = 6;
out = ones(size(X1(:,1)));
for i = 1:degree
    for j = 0:i
        out(:, end+1) = (X1.^(i-j)).*(X2.^j);
    end
end


