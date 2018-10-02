pkg load statistics
pkg load optim

##############  VARIABLES ###############
numClasses = 3
NumNeuron=4
<<<<<<< HEAD
lambda = 1
threshold = 0.0001
total = 40
batchproportion = 1
batchSize = total*batchproportion
style = "horizontal"
#########################################

[X,Y]=create_data(total, numClasses, style);
Y
=======
lambda = 5
threshold = 0.001
total = 1000
batchproportion = 1
batchSize = total*batchproportion
style= "radial"

[X,Y]=create_data(100, numClasses, "vertical");


>>>>>>> c685660da3f120145438d14b0177d546ff9efe78

W1=weight_generator(NumNeuron,columns(X)+1);

W2=weight_generator(columns(Y),rows(W1)+1);

<<<<<<< HEAD
[W1,W2]=train(W1,W2,X,Y,lambda,batchSize,threshold);
W1
=======
[X,Y]=create_data(100,3,style);
[W1,W2]=train(W1,W2,X,Y,lambda,batchSize,threshold);
>>>>>>> c685660da3f120145438d14b0177d546ff9efe78

#Visualizacion de datos;
figure(1);
plot_data(X,Y);
figure(2);
view(W1,W2,400,5);

# Evaluación de resultados
[Xev,Yev]=create_data(total, numClasses, style);
testY = predict(W1, W2, Xev);
CM = conf_matrix(Yev, testY, 3);
