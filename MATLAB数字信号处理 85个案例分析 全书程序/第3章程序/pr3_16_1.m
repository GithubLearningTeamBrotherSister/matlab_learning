%
% pr3_16_1  
clc; clear all; close all;

[x,fs]=audioread('m_noise.wav');% �������ݺͲ���Ƶ��
p0=2e-5;                      % �ο���ѹ
% 1/3��Ƶ���˲�������Ƶ��
fc = [ 20, 25 31.5 40, 50 63 80, 100 125 160,...                  
    200 250 315, 400 500 630, 800 1000 1250, 1600 2000 2500, ...   
	3150 4000 5000, 6300 8000 10000, 12500 16000]; 
nc=length(fc);                % 1/3�˲�������
n=length(x);                  % x�ĳ���
t=(0:1/fs:(n-1)/fs);          % ʱ��̶�
nfft=2^nextpow2(n);           % FFT�任�ĳ���,Ϊ2�������ݴ�
a = fft(x,nfft);              % FFT�任
oc6=2^(1/6);                  % ��Ƶ�̵ı���
% 1/3��Ƶ�̷�������
for j=1:nc
    fl=fc(j)/oc6;             % ���1/3��Ƶ�����޽�ֹƵ��
    fu=fc(j)*oc6;             % ���1/3��Ƶ�����޽�ֹƵ��
    nl=round(fl*nfft/fs+1);   % ���޽�ֹƵ�ʶ�Ӧ��Ƶ������
    nu=round(fu*nfft/fs+1);   % ���޽�ֹƵ�ʶ�Ӧ��Ƶ������
    b=zeros(1,nfft);          % b��ʼ��
    b(nl:nu)=a(nl:nu);        % ��1/3��Ƶ���˲��������߷���b��
    b(nfft-nu+2:nfft-nl+2)=a(nfft-nu+2:nfft-nl+2);
    c=real(ifft(b,nfft));     % IFFT��任
    yc(j)=sqrt(var((c(1:n))));% ���������ֵ
    Lp1(j)=20*log10(yc(j)/p0);% ����1/3��Ƶ���˲�������ѹ��
end
Lpt=10*log10(sum((yc/p0).^2));% ��������ѹ��
fprintf('Lpt=%5.6fdB\n',Lpt)
% ��ͼ
figure(1)
pos = get(gcf,'Position');
set(gcf,'Position',[pos(1), pos(2)-100,pos(3),(pos(4)-140)]);
plot(t,x,'k');  % ˲ʱ��ѹ����ͼ
xlabel('ʱ��/s'); ylabel('��ֵ/��');
title('����ʱ�䲨��')
set(gcf,'color','w'); 
figure(2)
bar(Lp1(1:nc));
set(gca,'XTick',[2:3:30]); grid		 
set(gca,'XTickLabels',fc(2:3:length(fc)));  
xlabel('����Ƶ��/Hz'); ylabel('��ѹ��/dB');
title('����֮һ��Ƶ���˲��������ѹ��')
set(gcf,'color','w'); 
