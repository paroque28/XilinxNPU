function conf_mat = conf_matrix (Yev, testY, size=3)

  testY = round(testY);

  S=sum(Yev&testY);
  a= S(1,1);
  e= S(1,2);
  k= S(1,3);
  A1=Yev(:,1);
  A2=Yev(:,2);
  A3=Yev(:,3);
  B=testY(:,1);
  C=testY(:,2);
  D=testY(:,3);
  FPY1=B&(~A1);

  d=sum(FPY1&A2);
  f=abs(d+e-sum(A2));
  c=abs(f+k-sum(D));
  b=abs(a+c-sum(A1));
  g=abs(a+d-sum(B));
  h=abs(g+k-sum(A3));


  #Sensitividad para cada clase
  Sy1=a/(a+b+c);
  Sy2=e/(e+b+f);
  Sy3=k/(k+c+f);

  #Precisión de cada clase
  Py1=a/(a+d+g);
  Py2=e/(e+d+h);
  Py3=k/(k+g+h);

  conf_mat=[a b c Sy1; d e f Sy2; g h k Sy3; Py1 Py2 Py3 0] #Matriz de confusión con valores derivados

endfunction;
