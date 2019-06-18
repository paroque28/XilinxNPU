function [C,Sen,Pre,F1]=confusion(Y,T)
[n c]=size(Y);
[n2 c2]=size(T);

if n~=n2 | c~=c2
  error('Outputs and targets are different sizes')
end

% Find the winning class assuming 1-of-N encoding
[T_max Tclass] = max(T', [], 1);
[maximum Yclass] = max(Y', [], 1);

C=zeros(c,c);
for i=1:c
  for j=1:c
    C(i,j) = sum((Yclass==j).*(Tclass==i));
  end
end   
% Sensitivity
Sen = zeros(c,1);
% Precission
Pre = zeros(c,1);
% F1
F1 = zeros(c,1);
for k=1:c
    TP = 0;
    FP = 0;
    FN = 0;
    TN = 0;
    for j=1:c
        for i=1:c
            if (k==i) 
                if(k==j)
                    TP = TP + C(i,j);
                else
                    FP = FP + C(i,j);
                end
                
            else
                if(k==j)
                    FN = FN + C(i,j);
                else
                    TN = TN + C(i,j);
                end
                end
            end
        end
    Sen(k) = TP / (TP+FN);
    Pre(k) = TP / (TP+FP);
    F1(k) = (2*TP)/(2*TP+FP+FN) ;
    end


end