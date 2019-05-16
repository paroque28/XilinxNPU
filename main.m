pkg load statistics
pkg load optim

##############  VARIABLES ###############
numClasses = 3
NumNeuron=64
lambda = 1
threshold = 0.00001
total = 1000
batchproportion = 0.7
batchSize = total*batchproportion
style = "radial"
#########################################

[X,Y]=create_data(total, numClasses, style);

hold off;
figure(1);
plot_data(X,Y);
refresh(1);
W1=weight_generator(NumNeuron,columns(X)+1);

W2=weight_generator(columns(Y),rows(W1)+1);

[W1,W2]=train(W1,W2,X,Y,lambda,batchSize,threshold);

#Visualizacion de datos;
figure(2);
view(W1,W2,400,5);

# Evaluación de resultados
[XEval,YEval]=create_data(total, numClasses, style);
YPredict = predict(W1, W2, XEval);
[C,Sen,Pre,F1] = confusion(YEval, YPredict)
waitfor(0)