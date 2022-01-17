% Lab Report - 2 - Filter Design
% Question 1
syms t w;
f1 = 20;
f2=40;
f3=60;
x = cos(2*pi*f1*t) + cos(2*pi*f2*t) + cos(2*pi*f3*t);
ft = fourier(x, t, w)







% Question 2
[b , a] = butter (4, 40, 's');
wband = logspace(-20, 40);
freqs(b, a, wband);






% Question 3
H(w) = poly2sym(b, w) / poly2sym(a, w)







% Question 4
Y(w) = H(w).*ft;
y(t) = ifourier(Y,w,t);








% Question 5
fs = 1000;
t1 = 0:1/fs:2-1/fs;
x_numeric = double(subs(x,t,t1));
y_numeric = double(subs(y,t,t1));
figure
subplot(2,1,1)
plot(t1,x_numeric)
subplot(2,1,2)
plot(t1,y_numeric)

ylim=[-4,4];
Y_NUM=fft(y_numeric);
X_NUM=fft(x_numeric);
n=length(X_NUM);
f=(0:n-1)*fs/n;
figure;
subplot(2,1,1);
plot(f(1:floor(length(X_NUM)/2)), abs(X_NUM(1:floor(length(X_NUM)/2))));
xlabel('\textbf{Frequency (Hz)}', 'Interpreter', 'latex');
ylabel('\textbf{Magnitude}', 'Interpreter', 'latex');
grid;
subplot(2,1,2);

plot(f(1:floor(length(Y_NUM)/2)), abs(Y_NUM(1:floor(length(Y_NUM)/2))));
xlabel('\textbf{Frequency (Hz)}', 'Interpreter', 'latex');
ylabel('\textbf{Magnitude}', 'Interpreter', 'latex');
grid;
