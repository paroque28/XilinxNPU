function plot_data(X,Y)

  % Set all the non-zero entries with the corresponding index
  rows = size(Y,1);
  cols = size(Y,2)
  idx=(1:rows)'*ones(1,cols);
  idx = idx.*Y;

  i0=idx(:,1);
  i0(i0==0)=[]; % remove all zeros from the vector
  
  %hold off;
  plot(X(i0,1),X(i0,2),'b+');
  hold on;
  % Markers + o * x s d ^ v > <
  % Colors  k r g b y m c 
  
  markers = ['+','o','*','x','s','d','^','v','>','<'];
  colors  = ['b','g','r','m','g','c','y'];
  
  for i=[2:size(Y,2)]
    % Prepare the style recycling the markers and colors
    style=strcat(markers(mod(i-1,length(markers))+1), colors(mod(i-1,length(colors))+1));
    % 
    i0=idx(:,i);
    i0(i0==0)=[]; % remove all zeros from the vector
    
    plot(X(i0,1),X(i0,2),style);
  end

  daspect([1 1 1]);
  grid;
end
