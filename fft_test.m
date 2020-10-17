% --------------------------------------------------------

clc
clear
close all
f0=100;%f0=100Hz
fs = 2000;%������
ts = 1/fs;%��������
t=0:ts:2/f0;%t���������г��ȣ�f0/fs=һ�����ڣ�
%X(nT)=sin(2pi*f*nT)=sin(2pi*f*n/fs)
x = sin(2*pi*f0*t) ;
plot(x)
y=fft(x);
f = (0:length(y)-1)*fs/length(y);
% figure;
% plot(f,abs(y));
% �ñ任�������ɼ��ľ��񸱱����ø�����Ӧ���źŵĸ�Ƶ�ʡ�
% Ϊ�˸��õ��Կ��ӻ���ʽ���������ԣ�����ʹ�� fftshift �����Ա任ִ������Ϊ���ĵ�ѭ��ƽ�ơ�
n = length(x);
fshift = (-n/2:n/2-1)*(fs/n);
yshift = fftshift(y);
figure;
plot(fshift,abs(yshift));
% --------------------------------------------------------