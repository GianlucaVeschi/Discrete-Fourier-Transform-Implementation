x = -10000:1:10000;
y = 0.002*sinc(x*0.001);

figure();
plot(x,y)
grid on;
axis([-10000 10000 0 0.002])