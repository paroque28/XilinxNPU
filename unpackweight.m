function [W1,W2]=unpackweight(w,W1size,W2size)

    W1rows=W1size(1,1);W1cols=W1size(1,2);
    W2rows=W2size(1,1);W2cols=W2size(1,2);
    
    W1=reshape(w(1:(W1rows*W1cols)),W1rows,W1cols);
    W2=reshape(w(W1rows*W1cols+1:rows(w)),W2rows,W2cols);
endfunction;