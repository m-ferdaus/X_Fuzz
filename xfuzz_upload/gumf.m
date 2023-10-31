clc
clear
x = -3:0.1:35;
y = gaussmf(x,[2 5]);
plot(x,y,LineWidth=3,Color="b")
hold on


x = -3:0.1:35;
y = gaussmf(x,[5 20]);
y=0.6*y;
plot(x,y,'-r',LineWidth=3)

