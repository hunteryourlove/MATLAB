function psnr = imgPSNR(imgP, imgComp, n)

[row col] = size(imgP);   %��ȡͼ���С

Err = 0;                  %err�����㣬����֮���forѭ������

for i = 1:row
    for j = 1:col
        Err = Err + (imgP(i,j) - imgComp(i,j))^2;  %��ָ�֡�뵱ǰ֡��square���ֵ
    end
end
mse = Err / (row*col);     %����ó��������ֵ��n*n��

psnr = 10*log10(n*n/mse);  %����pnsr�ļ��㹫ʽ���ó���ֵ����ȵ�ֵ