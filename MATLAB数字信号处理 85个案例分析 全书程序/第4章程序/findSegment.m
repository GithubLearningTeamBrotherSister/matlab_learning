function vSegment=findSegment(express)
if express(1)==0                          % �ж�express�����ֻ��Ǳ��ʽ
    vIndex=find(express);                 % �Ǳ��ʽ
else
    vIndex=express;                       % ������
end

vSegment = [];
k = 1;
vSegment(k).begin = vIndex(1);            % ���õ�һ���л��ε���ʼλ��
for i=1:length(vIndex)-1,
	if vIndex(i+1)-vIndex(i)>1,           % �����л��ν���
		vSegment(k).end = vIndex(i);      % ���ñ����л��εĽ���λ��
		vSegment(k+1).begin = vIndex(i+1);% ������һ���л��ε���ʼλ��  
		k = k+1;
	end
end
vSegment(k).end = vIndex(end);            % ���һ���л��εĽ���λ��
% ����ÿ���л��εĳ���
for i=1 :k
    vSegment(i).duration=vSegment(i).end-vSegment(i).begin+1;
end
