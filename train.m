function [W1,W2]=train(W1,W2,X,Y,lambda,batchSize,threshold)

    
    iteraciones = 0;

    X=[ones(size(X,1),1),X];
    w=packweight(W1,W2);

    W1size=size(W1);
    W2size=size(W2);
    XY = [X,Y];
    XY_samples = XY(randi(length(XY),batchSize,1),:);

    X_samples = XY_samples(:,1:size(X,2));
    Y_samples = XY_samples(:,size(X,2)+1:end);

    %Backpropagation
    J_inicial = threshold+1;
    J = 0;
    while (abs(J-J_inicial)>threshold)
        iteraciones=iteraciones+1;
        J_inicial=target(W1,W2,X,Y);
        [gW1,gW2]=gradtarget(W1,W2,X_samples,Y_samples);

        w=packweight(W1,W2);
        dw=packweight(gW1,gW2);
        w=w-lambda*dw;

        [W1,W2]=unpackweight(w,W1size,W2size);
        
        J=target(W1,W2,X,Y);
        
%         if (mod(iteraciones,50) == 0)
%             figure(2);
%             view_prediction(W1,W2,400);
%             refresh(2);
%         end

    end
    J
    iteraciones
 end
