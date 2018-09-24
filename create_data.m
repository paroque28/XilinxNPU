function [X,Y]=create_data(numSamples,numClasses=3,shape="radial")
    
    # usage [X,Y] = create_data(numSamples,numClasses=3,shape)
    # 
    # This function creates random examples in the two-dimensional
    # space from -1 to 1 in each coordinate.  The output Y is arranged
    # in numClasses outputs, such that they can be used as outputs of
    # artificial neurons (or units) directly.
    # 
    # Inputs:
    #   numSamples: total number of samples in the training set
    #   numClasses: total number of classes in the training set
    #   shape: distribution of the samples in the input space:
    #          'radial' rings of clases,
    #          'pie' angular pieces for each class
    #          'vertical' vertical bands
    #          'horizontal' horizontal bands
    #
    # Outputs:
    #   X: Design matrix, with only the two coordinates on each row 
    #      (no 1 prepended).  Its size is numSamples x 2
    #   Y: Corresponding class to each training sample.  Its size is
    #      numSamples x numClasses

  switch(shape)
    case "radial"
      [X,Y]=create_radial(numSamples,numClasses);
    case "pie"
      [X,Y]=create_pie(numSamples,numClasses);
    case "vertical"
      [X,Y]=create_vertical(numSamples,numClasses);
    case "horizontal"
      [X,Y]=create_horizontal(numSamples,numClasses);
    otherwise
      printf("Unknown shape '%s'\n",shape);
  endswitch

endfunction;

function [X,Y]=create_radial(numSamples,numClasses)
  angles=unifrnd(0,2*pi,numSamples,1);
  radii =unifrnd(0,1   ,numSamples,1);
  idx   =floor(radii*numClasses)+1;
  X     =[radii.*cos(angles) radii.*sin(angles)];

  # Reserve the space for the Y matrix
  Y=zeros(numSamples,numClasses);

  # A little trickier: we want to set to 1 the element of the column
  # indicated in the index
  
  # Use the idx as the column for each sample that needs to be set 
  Y(sub2ind(size(Y),(1:numSamples)',idx))=1;
endfunction;

function [X,Y]=create_pie(numSamples,numClasses)
  angles=unifrnd(0,2*pi,numSamples,1);
  radii =unifrnd(0,1   ,numSamples,1);
  idx   =floor(angles*numClasses/(2*pi))+1;
  X     =[radii.*cos(angles) radii.*sin(angles)];

  # Reserve the space for the Y matrix
  Y=zeros(numSamples,numClasses);

  # A little trickier: we want to set to 1 the element of the column
  # indicated in the index
  
  # Use the idx as the column for each sample that needs to be set 
  Y(sub2ind(size(Y),(1:numSamples)',idx))=1;
endfunction;

function [X,Y]=create_vertical(numSamples,numClasses)
  X = unifrnd(-1,1,numSamples,2);
  idx = floor((X(:,1)+1)*0.5*numClasses)+1;

    # Reserve the space for the Y matrix
  Y=zeros(numSamples,numClasses);

  # A little trickier: we want to set to 1 the element of the column
  # indicated in the index
  
  # Use the idx as the column for each sample that needs to be set 
  Y(sub2ind(size(Y),(1:numSamples)',idx))=1;

endfunction;

function [X,Y]=create_horizontal(numSamples,numClasses)
  X = unifrnd(-1,1,numSamples,2);
  idx = floor((X(:,2)+1)*0.5*numClasses)+1;

  # Reserve the space for the Y matrix
  Y=zeros(numSamples,numClasses);

  # A little trickier: we want to set to 1 the element of the column
  # indicated in the index
  
  # Use the idx as the column for each sample that needs to be set 
  Y(sub2ind(size(Y),(1:numSamples)',idx))=1;
endfunction;
