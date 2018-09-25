function view(X_original, Y_original,W1,W2,img_size)
    
    IMG=zeros(img_size,img_size,3);

    [v1,v2] = meshgrid ([-1:(2/img_size):1],[-1:(2/img_size):1]);
    X = [v1(:),v2(:)];
    rows(X)
    columns(X)

    Y=predict(W1,W2,[ones(rows(X),1),X]);

    for i=1:img_size
        for j= 1:img_size
            Y(j+img_size*(i-1),:)
            m = sum(Y(j+img_size*(i-1),:))
            for k= 1:3
                IMG(j,i,k)=Y(j+img_size*(i-1),k)/m;
            endfor;
        endfor;
    endfor;

    figure;
    imshow(IMG);
    hold on;
    plot_data(X_original, Y_original);


    
endfunction;
