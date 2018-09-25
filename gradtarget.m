function [gW1,gW2]=gradtarget(W1,W2,X,Y)

  # usage gradtarget(W1,W2,X,Y)
  #
  # This function evaluates the gradient of the target function on W1 and W2.
  #
  # W1: weights matrix between input and hidden layer
  # W2: weights matrix between the hidden and the output layer
  # X:  training set holding on the rows the input data, plus a final column
  #     equal to 1
  # Y:  labels of the training set

  #############################################
  #Copia identica de predict para obtener pasos intermedios
  #############################################
  p1=[ones(rows(X),1),X]'*W1'; # p1 = W1*[1 X]'

  g1=1./(1+e.^-p1); #funcion de activacion capa de entrada y escondida
  activacion1=[ones(rows(g1),1),g1]; # Se agregan los unos

  p2=activacion1*W2'; # p2  = W2*[1 X]'
  Y_hat=1./(1+e.^-p2); #funcion de activacion capa de salida
  ################################################

  #Back-propagation
  sigmak=(Y-Y_hat);

  sumaDeltaj=delta2*W2(:,2:end);
  derivZj=(1-g1).*g1;
  sigmaJ=derivZj.*sumaDeltaj;

  gW1= sigmaJ'*X;
  gW2= delta2'*activacion1;

  #############################################
  #Normalización
  #############################################
  m=rows(X);
  gW1=gW1./m; #gradiente de la matriz W1
  gW2=gW2./m; #gradiente de la matriz W2
endfunction;
