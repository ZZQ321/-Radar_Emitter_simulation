%finished:2020-10-17 20:42:18
%created by hjr
% clear all; 
% close all;
% clc;
function Bpsk_barker13=barker13(fc,fs,Baud)
%Ҫ���ź�����0.65us��Ҳ����Baud=2e7
%����=��Ԫ��*��Ԫ���
g=[1,1,1,1,1,0,0,1,1,0,1,0,1];%13λ�Ϳ���
% fc=2e8;                  %�ز�Ƶ��
% fs=2e9;                  %������
% Baud=2e7;                  %������

t=0:1/fs:(fs/Baud-1)/fs;               %��һ���ǹؼ������������ز����������Ԫ�����㳤��һ��

%��������
cp=[];
mod1=[];
for n=1:length(g)
    if g(n)==0
        A=zeros(1,fs/Baud);
    else 
        A=ones(1,fs/Baud);
    end
    c=sin(2*pi*fc*t);
    cp=[cp A];%code sequence generated
    mod1=[mod1 c];
end
cm=[];
mod=[];
% subplot(311);plot(cp);
%% �������н���sin����
for n=1:length(g)
    if g(n)==0
        B=ones(1,fs/Baud);     %ÿ��ֵ100���� 
       c=sin(2*pi*fc*t);         %�ز��ź�
    else 
        B=ones(1,fs/Baud);
        c=sin(2*pi*fc*t+pi);     %�ز��ź�
    end
    cm=[cm B];              %s(t)��Ԫ���100   
    mod=[mod c];          %��s(t)�ȳ����ز��ź�
end
Bpsk_barker13=cm.*mod;
% subplot(312);plot(Bpsk_barker13);

% y=fft(Bpsk_barker13);
% f = (0:length(y)-1)*fs/length(y);
% n = length(Bpsk_barker13);
% fshift = (-n/2:n/2-1)*(fs/n);
% yshift = fftshift(y);
% subplot(313);plot(fshift,(abs(yshift)));