% VARIABLES
numClasses = 3
NumNeuron = 64
lambda = 1
threshold = 0.0001
total = 1000
batchproportion = 0.6
batchSize = total*batchproportion
style = "radial"
%

[X,Y]=create_data(total, numClasses, style);

hold off;
figure(1);
plot_data(X,Y);
refresh(1);
W1=weight_generator(NumNeuron,size(X,2)+1);

W2=weight_generator(size(Y,2),size(W1,1)+1);

[W1,W2]=train(W1,W2,X,Y,lambda,batchSize,threshold);

%Visualizacion de datos;
figure(2);
view_prediction(W1,W2,400);

% Evaluacion de resultados
[XEval,YEval]=create_data(total, numClasses, style);
YPredict = predict(W1, W2, XEval);
[C,Sen,Pre,F1] = confusion(YEval, YPredict)
waitfor(0)