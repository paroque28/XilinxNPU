pkg load statistics
pkg load optim

##############  VARIABLES ###############
numClasses = 3
NumNeuron=4
lambda = 1
threshold = 0.0001
total = 400
batchproportion = 1
batchSize = total*batchproportion
style = "horizontal"
#########################################

[X,Y]=create_data(total, numClasses, style);
Y

W1=weight_generator(NumNeuron,columns(X)+1);

W2=weight_generator(columns(Y),rows(W1)+1);

[W1,W2]=train(W1,W2,X,Y,lambda,batchSize,threshold);
W1

#Visualizacion de datos;
figure(1);
plot_data(X,Y);
figure(2);
view(W1,W2,400,5);

# Evaluación de resultados
[Xev,Yev]=create_data(total, numClasses, style);
testY = predict(W1, W2, Xev);
CM = conf_matrix(Yev, testY, numClasses)
