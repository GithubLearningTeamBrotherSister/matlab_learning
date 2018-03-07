function Z=specor_m1(x,fs,N,NX,method)
if nargin<3, N=length(x); NX=[0 fs/2]; method=1; end % ��������ʱ������
if nargin<4, NX=[0 fs/2]; method=1; end
if nargin<5, method=1; end
if method<1 | method>2           % methodС��1�����2,����Ϊmethod=1
    disp('method-value should be equal to 1 or 2');
    method=1;
end
x=x(:)';                         % ����xΪ������
w=hann(N,'periodic');            % �������������
if method==2                     % ������ʱ�ú���������
    xf=fft(x.*w');               % �źżӴ���FFT
    xf=xf(1:N/2)/N*4;            % ���źŵķ�ֵ����
    WindowType=2;                % ��WindowType=2;
else
    xf=fft(x);                   % FFT
    xf=xf(1:N/2)/N*2;            % ���źŵķ�ֵ����
    WindowType=1;                % ��WindowType=1;
end
ddf=fs/N;                        % ���Ƶ�ʷֱ���
nx1=NX(1); nx2=NX(2);            % ���������ֵƵ�ʵ�����
n1=fix(nx1/ddf);                 % ��Ƶ���������������
n2=round(nx2/ddf);

A=abs(xf);                       % ��ȡģֵ
[Amax,index]=max(A(n1:n2));      % ��������ȡ��������ֵ
index=index+n1-1;                % �������ֵ��������
phmax=angle(xf(index));          % ������δ����ʱ����ֵ
    
%��ֵ��_�Ӿ��δ�
if (WindowType==1)               % ���Ǿ��δ�
    indsecL=A(index-1)>A(index+1);  % ����X(k-1)>X(k+1)���߼���
    % ��ʽ(6-2-5)���㦤k
    df=indsecL.*A(index-1)./(Amax+A(index-1))-...
        (1-indsecL).*A(index+1)./(Amax+A(index+1));
    Z(1)=(index-1-df)*ddf;       % ��ʽ(6-2-6)����Ƶ��
    Z(2)=Amax/sinc(df);          % ��ʽ(6-2-8)�����ֵ
    Z(3)=phmax+pi*df;            % ��ʽ(6-2-12)�����ʼ���
end
    
%��ֵ��_��Hanning��
if (WindowType==2)               % ���Ǻ�����
    indsecL=A(index-1)>A(index+1);  % ����X(k-1)>X(k+1)���߼���
    % ��ʽ(6-2-29)���㦤k
    df=indsecL.*(2*A(index-1)-Amax)./(Amax+A(index-1))-...
        (1-indsecL).*(2*A(index+1)-Amax)./(Amax+A(index+1));
    Z(1)=(index-1-df)*ddf;       % ��ʽ(6-2-6)����Ƶ��
    Z(2)=(1-df^2)*Amax/sinc(df); % ��ʽ(6-2-31)�����ֵ
    Z(3)=phmax+pi*df;            % ��ʽ(6-2-12)�����ʼ���
end
Z(3)=mod(Z(3),2*pi);             % �Ա�֤��ʼ�����-pi~pi��������
Z(3)=Z(3)-(Z(3)>pi)*2*pi+(Z(3)<-pi)*2*pi;
