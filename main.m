pkg load statistics;
numClasses = 3;
<<<<<<< HEAD
lambda  = 0.0001
batchSize = 50
=======
lambda  = 0.001
batchSize = 500
>>>>>>> 8f08747551af8854310c6cfd984f2391cafafb6e

# crear datos
[X,Y]=create_data(100, numClasses);
# plotear datos
#plot_data(X,Y);
NumNeuronas=7;
# +1 por sesgo (constante) en cada capa
W1=weight_generator(NumNeuronas,columns(X)+1);
W2=weight_generator(columns(Y),rows(W1)+1);

<<<<<<< HEAD
#[W1,W2]=train(W1,W2,X,Y,lambda,batchSize);
view(X,Y,W1,W2,100);
=======
#target(W1,W2,[ones(rows(X),1),X],Y)

train(W1,W2,X,Y,lambda,batchSize);
>>>>>>> 8f08747551af8854310c6cfd984f2391cafafb6e
