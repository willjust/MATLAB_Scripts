% CS515 Homework 2 Sample
f1 = @(x) 20000/4 - 3/4*x;
f2 = @(x) 4000/(2-0.3*3.4) - (3-.45*3)*x/(2-0.3*3.4);

xx = 0:20000/3;
yy1 = f1(xx);
yy2 = f2(xx);
yy3 = zeros(length(xx), 1);
xx4 = zeros(length(xx),1);
yy4 = linspace(0,5000,length(xx));

cost = @(x) -6/5.4 * x + 4000;
yy5 = cost(xx);
plot(xx,yy1,xx,yy2,xx,yy3,xx4,yy4, xx,yy5); axis([-100, inf, -100, 6000])
title('Optimal product production'); xlabel('# of Unit 1'); ylabel('# of Unit 2');
legend('Machine hours limit', 'Cost limit', 'Unit 1 > 0', 'Unit  2 > 0', 'Profit')

