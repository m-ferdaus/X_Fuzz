clc
clear;
load levels_GAAFET;
% d=levels_GAAFET;
b=zeros(1,10);
for i = 1:length(levels_GAAFET)
    b=zeros(1,10);
    for j=1:10
        if levels_GAAFET(i,1)==j
            b(:,j)=1;
        
        end
        all(i,:)=b;
    end
end