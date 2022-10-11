%periodic correlation
clc;
clear all;
close all;

x1 = [-1 -1 -1 1 -1 -1 1 -1 -1 -1 -1 1 1 1 -1 1];
x2 = [-1 1 -1 -1 -1 1 1 1 -1 1 -1 -1 1 -1 -1 -1];

length = 16;

u = 0 : 1 : (length - 1);

for t = 1 : length %autocorrelation
    y = circshift(x1 , t);
    ans1(t) = 0;
    for i = 1 : length
        ans1(t) = ans1(t) + x1(i) * y(i);
    end
end

for t = 1 : length %autocorrelation
    y = circshift(x2 , t);
    ans2(t) = 0;
    for i = 1 : length
        ans2(t) = ans2(t) + x2(i) * y(i);
    end
end

for t = 1 : length %crosscorrelation
    y = circshift(x2 , t);
    ans(t) = 0;
    for i = 1 : 16
        ans(t) = ans(t) + x1(i) * y(i);
    end
end

ans = circshift(ans , 1);
ans1 = circshift(ans1 , 1);
ans2 = circshift(ans2 , 1);

subplot(3,1,1);
stem(u , ans1 , '-ob' , 'filled');
txt = '\rho(f;u)';
text(1 , 15 , txt); 
yticks([-10 : 10 : 20]);
axis([0 15 -10 20]);
xlabel('u');

subplot(3,1,2);
stem(u , ans2 , '-ob' , 'filled');
txt = '\rho(f^，;u)';
text(1 , 15 , txt); 
yticks([-10 : 10 : 20]);
axis([0 15 -10 20]);
xlabel('u');

subplot(3,1,3);
stem(u , ans , '-ob' , 'filled');
txt = '\rho(f,f^，;u)';
text(1 , 7.45 , txt);
yticks([-5 : 5 : 10]);
axis([0 15 -5 10]);
xlabel('u');