function y=gendtmfcs(A,dth,Doption)
if nargin<2, dth=0.1; Doption=0; end   % ����ȱʡֵ
if nargin<3, Doption=0; end
fs=8000;                               % ����Ƶ��
Nsmp=ceil(dth*fs);                     % ����ÿ��DTMF���εĳ���
Nsmp2=Nsmp/2;                          % �����жϵĳ���
tones=Dtmf_genm1(Nsmp);                % ����12���ַ���DTMF���δ����tones������
pa=zeros(Nsmp2,1);                     % ��ʼ��
y=pa;

la=length(A);                          % �ַ�����
for_index=zeros(1,la);                 % ��ʼ��
for k=1 : la                           % ����ÿ���ַ�����tones������ȡ�ڼ�������
    Chr=abs(A(k));                     % �õ��ַ���ASCII��
    if Chr>48 & Chr<58,                % ��������1-9
        ld=Chr-48; %end  
    elseif Chr==48                     % ����0
        ld=11;
    elseif Chr==42                     % ����*
        ld=10;
    elseif Chr==35                     % ����#
        ld=12;
    %elseif Chr>0 & Chr<10
    %    ld=Chr;
    else                               % ������,��ʾ������Ϣ
        disp('����! �зǵ绰�����ַ�!��������.')
    end
    %for_index(k)=ld;                  % ���Ҫȡ���ε�����
%end
%for_index
%for i=for_index,
    y=[y; tones(1:Nsmp,ld); pa];       % ��tones������ȡ���ι���DTFM����
end
y=[y; pa];
if nargout==0                          % ����û�����������
    wavplay(y,fs);
end
if Doption                             % �Ƿ�Ҫ�Ѳ�����ʾ����
    wavplay(y,fs);
    figure(90)
    M=length(y);
    n=1:M;
    time=(n-1)/fs;
    plot(time,y,'k');
    xlim([0 max(time)]);
    xlabel('ʱ��/s'); ylabel('��ֵ')
    set(gcf,'color','w');
end

function tones=Dtmf_genm1(Nsmp)
% ֻ����绰����12���ַ�
% 12���ַ���'1','2','3','4','5','6','7','8','9','*','0','#'
lfg = [697 770 852 941];               % DTMF��ƵƵ��
hfg = [1209 1336 1477];                % DTMF��ƵƵ��
f  = [];                               % ��ʼ��
for c=1:4,                             % ����12��Ƶ�ʶԵ�����
    for r=1:3,
        f = [ f [lfg(c);hfg(r)] ];
    end
end

Fs  = 8000;                            % ����Ƶ��8kHz
N = Nsmp;                              % ÿ���ַ�DTMF���γ���
t = (0:N-1)/Fs;                        % ����ʱ������
pit = 2*pi*t;                          % 

tones = zeros(N,size(f,2));            % ��ʼ��
for toneChoice=1:12,                   % ����12���ַ���ӦDTMF�Ĳ�������
    tones(:,toneChoice) = sum(sin(f(:,toneChoice)*pit))';
end
