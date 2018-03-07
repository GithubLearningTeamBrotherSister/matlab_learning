function B=goertzel_decode(y,Thd)
fs=8000;                                      % ����Ƶ��
[b,a]=design_cheby2;                          % ��ͨ�˲�
x=filtfilt(b,a,y);

tindex=find(x<Thd);                           % Ѱ��С����ֵ������
tseg=findSegment(tindex);                     % Ѱ��С����ֵ������
tk=length(tseg);                              % ��tk��С����ֵ������
if tk==0                                      % ������ʾ
    disp('Ѱ�Ҳ���С����ֵ������,������ֵ���ò�����,������DTMF����!!')
    return
end
i=0;                                          % ��ʼ��
for k=1 : tk                                  % ȷ��DTMF�жϵ���Ч��
    if tseg(k).duration>=80                   % TDMF�ж�ʱ��Ҫ����10ms
        i=i+1;
        nxseg(i).begin=tseg(k).begin;
        nxseg(i).end=tseg(k).end;
        nxseg(i).duration=tseg(k).duration;
    end
end
I=i;                                   % ����I��DTMF�ж�

Nt = 205;                              % ����Goertel�㷨�ĳ���
lfg = [697 770 852 941];               % DTMF��Ƶ����
hfg = [1209 1336 1477];                % DTMF��Ƶ����
original_f = [lfg(:);hfg(:)];          % ���ɸߵ�Ƶ����
K = round(original_f/fs*Nt);           % ������ߵ�Ƶ��FFT�ж�Ӧ������������
estim_f = round(K*fs/Nt);              % ���Ƶ�Ƶ��ֵ
j=0;                                   % ��ʼ��
if nxseg(1).begin>Nt                   % �Ƿ�û��ǰ����������
    j=j+1;                             % ��,һ��ʼ����DTMF����
    n1=1;                              % ����ò��ε�����
    n2=nxseg(1).begin-1;
    u=x(n1:n2);                        % ȡ���ò���
    toneuc(:,j) = u(1:Nt);             % �����toneuc������
end
for i=1 : I-1                          % Ѱ����һ��DTMF����
     j=j+1;
     n1=nxseg(i).end+1;                % ����ò��ε�����
     n2=nxseg(i+1).begin-1;
     u=x(n1:n2);                       % ȡ���ò���
     toneuc(:,j) = u(1:Nt);            % �����toneuc������
end
I=j;                                   % ����I��DTMF����
% ��I��DTMF���ν���Goertzel�㷨����
for i=1 : I
    tone=toneuc(:,i);                  % ȡ��һ��DTMF����
    ydft = goertzel(tone,K+1);         % ����Goertzel�㷨����
    [v1,uk1]=max(ydft(1:4));           % �ڵ�Ƶ����Ѱ��һ�����ֵ
    [v2,uk2]=max(ydft(5:7));           % �ڸ�Ƶ����Ѱ��һ�����ֵ
    f1=lfg(uk1);                       % ��Ӧ�ĵ�Ƶ�����Ƶ��
    f2=hfg(uk2);                       % ��Ӧ�ĸ�Ƶ�����Ƶ��
    Fum(:,i)=[f1 f2];                  % ÿһ��DTMF���ζ���һ��Ƶ�ʶ�[f1 f2]
% ��ͼ5-4-3�ж�ĳ��Ƶ�ʶ��Ƕ�Ӧ����һ���ַ�    
    if f1>1000                         % ���f1��f2λ�÷ŷ���,Ҫ�ߵ��Ź���
        var=f1;
        f1=f2;
        f2=var;
    elseif f1<1000
    end
    
    switch(f1);                        % ��f1���ж�
       case{697};                      % f1=697
           switch(f2);                 % ��f2���ж�
               case{1209};             % f2=1209
                   taste='1';
               case{1336};             % f2=1336
                   taste='2';
               case{1477};             % f2=1477
                   taste='3';
           end
       case{770};                      % f1=770
           switch(f2);                 % ��f2���ж�
               case{1209};             % f2=1209
                   taste='4';
               case{1336};             % f2=1336
                   taste='5';
               case{1477};             % f2=1477
                   taste='6';
           end
        case{852};                     % f1=852
           switch(f2);                 % ��f2���ж�
               case{1209};             % f2=1209
                   taste='7';
               case{1336};             % f2=1336
                   taste='8';
               case{1477};             % f2=1477
                   taste='9';
           end
        case{941};                     % f1=941
           switch(f2);                 % ��f2���ж�
               case{1209};             % f2=1209
                   taste='*';
               case{1336};             % f2=1336
                   taste='0';
               case{1477};             % f2=1477
                   taste='#';
           end
    end
    B(i)=taste;                        % ���ַ���ASCII������B��    
end


