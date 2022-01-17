samp_freq = 10000; %Sampling Frequency
L = 1000; %Length of signals
t = (0:L-1)*(1/samp_freq);

m = cos(2*pi*250*t); %change frequency of message signal here
c = cos(2*pi*750*t);
coh = cos(2*pi*750*t);
s = c.*m;
coh_out = s.*coh;

S = fft(s); %Fourier transform of all the signals
M = fft(m);
C = fft(c);
Y = fft(coh_out);

n = length(s);
f = (0:n-1)*samp_freq/n; %Getting frequency values in Hertz

%plots
%All magnitude spectrum. Plots have x-axis restricted so as to not show the mirror image of the spectrum
figure(1)
subplot(3,1,1)
plot(t,m,'r') %Plotting time domain Message signal
title('Time Domain Message Signal')
xlabel('Time')
ylabel('Signal')
grid

subplot(3,1,2)
plot(t,c,'m') %Plotting time domain Carrier signal
title('Time Domain Carrier Signal')
xlabel('Time')
ylabel('Signal')
gridsubplot(3,1,3)
plot(t, s,'c') %Plotting time domain DSB-SC signal
title('Time Domain DSB-SC Signal')
xlabel('Time')
ylabel('Signal')
grid

figure(2)
subplot(3,1,1) %Plotting Magnitude Spectrum of Message Signal
plot(f(1:floor(length(m)/2)), abs(M(1:floor(length(m)/2))),'r')
title('Magnitude Spectrum of Message Signal')
xlabel('Frequency(Hz)','Interpreter','latex')
ylabel('Magnitude','Interpreter','latex')
grid

subplot(3,1,2) %Plotting Magnitude Spectrum of Carrier Signal
plot(f(1:floor(length(c)/2)), abs(C(1:floor(length(c)/2))), 'm')
title('Magnitude Spectrum of Carrier Wave}')
xlabel('Frequency(Hz)')
ylabel('Magnitude')
grid

subplot(3,1,3) %Plotting Magnitude Spectrum of DSB-SC Signal
plot(f(1:floor(length(s)/2)), abs(S(1:floor(length(s)/2))),'c')
title('Magnitude Spectrum of DSB-SC Signal')
xlabel('Frequency(Hz)')
ylabel('Magnitude')
grid

figure(3)
subplot(2,1,1) %Plotting time domain Output of Coherent Detector signal
plot(t, coh_out)
title('Time Domain Output of Coherent Detector')
xlabel('Time')
ylabel('Signal')
hold on
plot(t, m)
hold off
grid

subplot(2,1,2) %Plotting Magnitude Spectrum of Output of Coherent Detector Signal
plot(f(1:floor(length(coh_out)/2)), abs(Y(1:floor(length(coh_out)/2))),'c')
title('Magnitude Spectrum of Output from Coherent Detector')
xlabel('Frequency(Hz)')
ylabel('Magnitude')
grid