%��ʼ��handles���
handles.output = hObject;
guidata(hObject, handles);
global ima imb endoftoc;                %��ȫ�ֱ�������ʽ���ݵ�ǰ֡���ο�֡ͼ��
ima1=ima;                        %��ȡ��һ֡
imb1=imb;                        %��ȡ�ڶ�֡

deltam=7;                          %����������Χ
ima1=double(ima1);                 %ת�����ȣ���ֹ������������ʱ���
imb1=double(imb1);
[rows cols] = size(ima1);    %�õ��ο�֡�ķֱ���

imb2=zeros(rows+2*deltam,cols+2*deltam);  %����������
imb2(deltam+1:deltam+rows,deltam+1:deltam+cols)=ima1;
for i=1:deltam
    imb2(i,deltam+1:deltam+cols)=imb2(deltam+1,deltam+1:deltam+cols);
    imb2(rows+deltam+i,deltam+1:deltam+cols)=imb2(deltam+rows,deltam+1:deltam+cols);
end
for j=1:deltam
    imb2(1:rows+2*deltam,j)=imb2(1:rows+2*deltam,deltam+1);
    imb2(1:rows+2*deltam,cols+deltam+j)=imb2(1:rows+2*deltam,deltam+cols);
end

%ȫ�������㷨ʵ��
 blocksize=16;                  %ƥ��Ŀ��СΪ16
 rowblocks =rows/blocksize;
 colblocks =cols/blocksize;
 A=66666666666666666666;         %Ϊ���ҵ���С�ľ�����A�����趨һ���ܴ�ĳ�ֵ
 Emn=0;
 No_x=ones(blocksize,blocksize);            %No_x��No_y���ڴ��ƥ���Ŀ�ţ����˶�ʸ��
 No_y=ones(blocksize,blocksize);
 diff=zeros(rows,cols);             %���ͼ��Ĵ�СΪ256*256��diff���ڴ�����ز�ֵ
 tic
                for x=0:(rowblocks-1)         %x��ʾ���еڼ����ӿ�
                    row=x*blocksize;
                   for y=0:(colblocks-1)         %y��ʾ���еڼ����ӿ�
                       col=y*blocksize;
                                 for p=-deltam:deltam         %������Χ��-7~7
                                    for q=-deltam:deltam      %��p��q����ʾ��x��y��Ӧ�ӿ���ǰһ֡����������λ��
                                        Emn=0;
                                        Emn=sum(sum((imb1(row+1:row+blocksize,col+1:col+blocksize)-imb2(row+deltam+p+1:row+deltam+p+blocksize,col+deltam+q+1:col+deltam+q+blocksize)).^2))/(blocksize^2); 
                                        if Emn<A
                                                    A=Emn;
                                                    No_x(x+1,y+1)=p;
                                                    No_y(x+1,y+1)=q;
                                            end   
                                    end
                                end
                                 A=66666666666666666666;
                                for mx=1:blocksize
                                    for ny=1:blocksize
                                        diff(row+mx,col+ny)=imb1(row+mx,col+ny)-imb2(row+mx+deltam+No_x(x+1,y+1),col+ny+deltam+No_y(x+1,y+1));
                                    end
                                end
                                        
                   end
                       
                end
toc
endoftoc=toc;
set(handles.text3,'String',toc);         %gui������ʾ�㷨����ʱ��


%%��ͼ            
                     
                         for x=0:(rowblocks-1)             %x��ʾ���еڼ����ӿ�
                             row=x*blocksize;
                             for y=0:(colblocks-1)         %y��ʾ���еڼ����ӿ�
                                 col=y*blocksize;
                                 %����ָ�������ͼ��imb3�����ο�ͼ��+Ԥ�����
                                 imb3(row+1:row+blocksize,col+1:col+blocksize)=imb2(row+deltam+No_x(x+1,y+1)+1:row+deltam+No_x(x+1,y+1)+blocksize,col+deltam+No_y(x+1,y+1)+1:col+deltam+No_y(x+1,y+1)+blocksize)+diff(row+1:row+blocksize,col+1:col+blocksize);
                             end
                         end
                         imb3=ima1+diff;
                         axes(handles.axes4);%ʹ�ָ�֡��ʾ��gui����
                         imshow(imb3,[]);
                         
FSpsnr = imgPSNR(imb1, imb3, 255);       %��ֵ����ȼ���
set(handles.text7,'String',FSpsnr);        %����������ǰ��  
axes(handles.axes3);%��ʼ��ͷ������
quiver(1:16,1:16,No_y,No_x);
 grid on;
                   

        