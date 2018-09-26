function view(X_original, Y_original,W1,W2,img_size)
    divs = 2/ (img_size-1);
    [v1,v2] = meshgrid ([-1:divs:1],[-1:divs:1]);
    X = [v1(:),v2(:)];

    Y=predict(W1,W2,[ones(rows(X),1),X]);
    #minY = repmat(min(Y), [size(Y, 1), 1])
    #normY = max(Y) - min(Y)               % this is a vector
    #normY = repmat(normY, [length(normY) 1])  % this makes it a matrix
                                       % of the same size as Y
    #normalizedY = (Y - minY)./normY

    IMG = reshape(Y, [img_size,img_size,3]);

    figure(1);
    img = imshow(IMG);
    set(img, 'XData', [-1,1], 'YData', [-1,1]);
    hold on;
    plot_data(X_original, Y_original);
    axis([-1 1 -1 1], "on")

    
endfunction;
