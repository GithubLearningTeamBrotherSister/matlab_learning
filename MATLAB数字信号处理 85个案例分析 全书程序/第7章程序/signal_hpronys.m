function Z=signal_hpronys(x,p,fs,er)
warning off
[A,theta, alpha, fr]=hprony(x,p); % ����hprony������ȡ����
l=0;                              % 
for k=1 : p                       % Ѱ��Ƶ�ʴ���0�ͷ�ֵ����er��ģʽ
    if A(k)>er & fr(k)>0
        l=l+1; I(l)=k;
    end
end
II=l;                             % ����Ƶ�ʴ���0�ͷ�ֵ����er�ĸ���
for k=1 : II                      % ����Ƶ�ʲ��ֵĲ������AA,Alpha,Theta,F0
    AA(k)=A(I(k));
    Theta(k)=theta(I(k));
    Alpha(k)=alpha(I(k))*fs;
    F0(k)=fr(I(k))*fs;
end
[FF,IS]=sort(F0);                 % �Բ�����Ƶ������
for k=1 : II                      % �������������������AA,Alpha,Theta
    l=IS(k);
    A(k)=AA(l);
    alpha(k)=Alpha(l);
    theta(k)=Theta(l);
end
for k=1 :II                       % �Ѳ���������������Z��
    Z(k,1)=alpha(k);
    Z(k,2)=FF(k);
    Z(k,3)=2*A(k);
    Z(k,4)=theta(k);
end
