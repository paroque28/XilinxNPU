function view_prediction(W1,W2,img_size)

    divs = 2/ (img_size-1);
    [v1,v2] = meshgrid ((-1:divs:1),(-1:divs:1));
    X = [v1(:),v2(:)];



    y=predict(W1,W2,X);

    img = reshape(y, [img_size,img_size,3]);


    img = imshow(img);
    set(img, 'XData', [-1,1], 'YData', [-1,1]);
    axis([-1 1 -1 1], "on")

end