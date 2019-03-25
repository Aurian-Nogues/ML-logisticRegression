#machine learning: logistic regression

These are two machine learning algorithms for Octave / Matlab to perform predictions using logistic regression algorithms.

data_linear.txt contains a training data set for the linear regression algorithm. The data represents results for 2 tests taken by students and wether or not they got admitted to university. test 1 score / test 2 score / uni admission (0 = no, 1 = yes)

data_nonLinear.txt contains a training data set for the non linear regression algorithm. The data represents results for 2 test scores performed on microchips and wether or not they passed quality check (0 = no, 1 = yes)

sigmoid.m takes X * theta as an input and returns the probability that the input should be classified as 1

plotData.m is a function that takes as input a features matrix mx2 and the result vector y mx1 and returns a plot of the data

costFunction.m takes as an input:
    - theta vector
    - X features matrix
    - y results vector
    - lambda regularization parameter
and returns:
    - J cost of using theta and lambda
    - grad the gradient of the cost function

predict.m takes a theta vector and X matrix as an input and returns a vector p containing the classification of the training exemples as 0 or 1. It is used to assess accuracy of predictions

plotBoundary.m plots the boundaries of the classification algorithm depending on theta values.

mapFeature.m takes 2 features vector as an input and returns a new polynomial matrix of higher degree containing more features.

training_algo_linear.m is a script that takes the data_linear.txt database, trains a linear logistic regression algorithm on it, draws classification boundaries, assess classification accuracy, takes user input for new values and returns probability to be classified as 1.

training_algo_nonLinear.m is a script that takes the data_nonLinear.txt database, adds more features to the X matrix, trains a non linear logistic regression algorithm on it, draws classification boundaries, assess classification accuracy, takes user input for new values and returns probability to be classified as 1.

