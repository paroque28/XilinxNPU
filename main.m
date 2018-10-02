pkg load statistics
pkg load optim

numClasses = 3
NumNeuron=4
lambda = 5
total = 100
batchproportion = 1
batchSize = total*batchproportion


[X,Y]=create_data(100, numClasses, "vertical");



W1=weight_generator(NumNeuron,columns(X)+1);
W2=weight_generator(columns(Y),rows(W1)+1);

[X,Y]=create_data(100,3,"vertical");
[W1,W2]=train(W1,W2,X,Y,lambda,batchSize);

#Visualizacion de datos;
figure(1);
plot_data(X,Y);
figure(2);
view(W1,W2,400,5);