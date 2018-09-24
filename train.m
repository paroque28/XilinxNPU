function [W1,W2]=train(W1,W2,X,Y,lambda)

    threshold = 0.00005;
    counter = 0;


    if(columns(X)<3)
        X=[ones(rows(X),1),X];
    endif;


    W1size=size(W1);
    W2size=size(W2);

    w=packweight(W1,W2);


    #gradientes conjugados
    [r,p]=unpackweight(w,W1size,W2size);
    ff= @(w) target(r,p,X,Y); #funcion de error
    df= @(w) gradtarget(r,p,X,Y); #funcion de gradiente

    [w2,v,nev]=cg_min(df,ff,w); #funcion de gradientes conjugados

    #numero de evaluaciones 
    nEva=nev(1,1) #numero de evaluaciones de la función de error

    #Backpropagation
    do
        counter=counter+1;
        J1=target(W1,W2,X,Y);
        [gW1,gW2]=gradtarget(W1,W2,X,Y);

        w=packweight(W1,W2);
        dw=packweight(gW1,gW2);
        w=w-lambda*dw;
        
        [W1,W2]=unpackweight(w,W1size,W2size);
        
        J=target(W1,W2,X,Y);


    until(abs(J1-J)<=threshold);
    J
    counter
endfunction;