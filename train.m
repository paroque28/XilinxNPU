function [W1,W2]=train(W1,W2,X,Y,lambda,batchSize)

    threshold = 0.00005;
    counter = 0;

    X=[ones(rows(X),1),X];
    w=packweight(W1,W2);

    W1size=size(W1);
    W2size=size(W2);
    XY = [X,Y];
    XY_samples = XY(randi(length(XY),batchSize,1),:)

    X_samples = XY_samples(:,1:columns(X))
    Y_samples = XY_samples(:,columns(X)+1:end)
    #Backpropagation
    do
        counter=counter+1;
        J1=target(W1,W2,X_samples,Y_samples);
        [gW1,gW2]=gradtarget(W1,W2,X_samples,Y_samples);

        w=packweight(W1,W2);
        dw=packweight(gW1,gW2);
        w=w-lambda*dw;
        
        [W1,W2]=unpackweight(w,W1size,W2size);
        
        J=target(W1,W2,X,Y);


    until(abs(J1-J)<=threshold);
    J
    counter
endfunction;