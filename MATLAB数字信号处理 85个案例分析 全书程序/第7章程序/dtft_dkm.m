function X=dtft_dkm(w,dk,nmsign)
w=w(:)';           % ʹwΪһ��������
N=length(w);       % w�ĳ���
m=dk/N;            % ��ʽ(6-4-38)
n1=0:N-1;          % n����
p=n1'*2*pi*m;      % ��ʽ(6-4-38) 
ewn=exp(-1j*p);    % ָ������
X=w*ewn;           % DTFT
if nmsign==1
    X=X/N;         % ��һ��
end