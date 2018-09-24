function plot_data(X,Y)

  # Set all the non-zero entries with the corresponding index
  idx=[1:rows(Y)]'*ones(1,columns(Y));
  idx.*=Y;

  i0=idx(:,1);
  i0(i0==0)=[]; # remove all zeros from the vector
  
  #hold off;
  plot(X(i0,1),X(i0,2),'k+');
  hold on;
  # Markers + o * x s d ^ v > <
  # Colors  k r g b y m c 
  
  markers = ['+','o','*','x','s','d','^','v','>','<'];
  colors  = ['k','r','b','m','g','c','y'];
  
  for i=[2:columns(Y)]
    # Prepare the style recycling the markers and colors
    style=strcat(markers(mod(i-1,length(markers))+1),
		 colors(mod(i-1,length(colors))+1));
    # 
    i0=idx(:,i);
    i0(i0==0)=[]; # remove all zeros from the vector
    
    plot(X(i0,1),X(i0,2),style);
  endfor

  daspect([1,1]);
  grid;
endfunction
