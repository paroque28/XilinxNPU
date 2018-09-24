function [W1,W2]=unpackweight(w,sW1,sW2)

    rW1=sW1(1,1); # de filas de W1
    cW1=sW1(1,2); # de colunmas de W1
    rW2=sW2(1,1); # de filas de W2
    cW2=sW2(1,2); # de columnas de W2
    W1=reshape(w(1:(rW1*cW1)),rW1,cW1);
    W2=reshape(w(rW1*cW1+1:rows(w)),rW2,cW2);
endfunction;