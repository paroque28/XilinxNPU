pkg load statistics;
numClasses = 3;
lambda  = 0.0001
batchSize = 500

# crear datos
[X,Y]=create_data(1000, numClasses);
# plotear datos
#plot_data(X,Y);
NumNeuronas=4;
# +1 por sesgo (constante) en cada capa
W1=weight_generator(NumNeuronas,columns(X)+1);
W2=weight_generator(columns(Y),rows(W1)+1); 

#target(W1,W2,[ones(rows(X),1),X],Y)

train(W1,W2,X,Y,lambda,batchSize);