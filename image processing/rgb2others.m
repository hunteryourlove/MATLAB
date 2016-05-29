%��rgbת��Ϊhsi��ģ��
%HSI��H������ӳɫ�ȣ�S������ӳ���Ͷȣ�I������ӳ���ȡ�
method=input('ת��Ϊʲôģ�ͣ�','s');
R=str2double(input('R=','s'));
G=str2double(input('G=','s'));
B=str2double(input('B=','s'));
%ת��ΪHSI
if strcmp(method,'HSI')
    I=(R+G+B)/3;
    S=1-min([R,G,B])*3/(R+G+B);
    num = 0.5*((R-G) + (R-B));  
    den = sqrt((R-G)^2+(R-B)*(G-B)); 
    theta = acos(num./(den + eps)); %��ֹ����Ϊ0 
    H = theta;  
    H(G<B) = 2*pi - H(G<B);  
    H = H/(2*pi);
    disp([H S I]);
%ת��ΪYCbCr
elseif strcmp(method,'YCbCr')
    Y=0.299*R+0.587*G+0.114*B;
    Cb=2*(1-0.114)*(B-Y);
    Cr=2*(1-0.299)*(R-Y);
    disp([Y Cb Cr]);
%ת��ΪCMYK
elseif strcmp(method,'CMYK')
    K=min([1-R,1-G,1-B]);
    C=(1-R-K)/(1-K);
    M=(1-G-K)/(1-K);
    Y=(1-B-K)/(1-K);
    disp([C M Y K]);
%ת��ΪYIQ
elseif strcmp(method,'YIQ')
    mat1=[R;G;B];
    mat2=[0.299 0.587 0.114;0.596 -0.275 -0.321;0.212 -0.523 -0.311];
    mat=mat2*mat1;
    Y=mat(1,1);I=mat(2,1);Q=mat(3,1);
    disp([Y I Q]);
%ת��ΪYUV
elseif strcmp(method,'YUV')
    mat1=[R;G;B];
    mat2=[0.299 0.587 0.114;-0.148 -0.289 -0.437;0.615 0.515 -0.100];
    mat=mat2*mat1;
    Y=mat(1,1);U=mat(2,1);V=mat(3,1);
    disp([Y U V]);
end