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
%���������㷨��ʵ��
 blocksize=16;
 rowblocks =rows/blocksize;
 colblocks =cols/blocksize;
 A=66666666666666666666;         %Ϊ���ҵ���С�ľ�����A�����趨һ���ܴ�ĳ�ֵ
 Emn=0;
 No_x=ones(16,16);            %No_x��NO_y���ڴ��ƥ���Ŀ�ţ����˶�ʸ��
 No_y=ones(16,16);
 diff=zeros(rows,cols);           %diff���ڴ�����ز�ֵ
 tic
                for x=0:(rowblocks-1)         %x��ʾ���еڼ����ӿ�
                    row=x*blocksize;
                   for y=0:(colblocks-1)         %y��ʾ���еڼ����ӿ�
                       col=y*blocksize;
                                 for p1=-4:4:4              %��һ��
                                    for q1=-4:4:4     %��p��q����ʾ��x��y��Ӧ�ӿ���ǰһ֡����������λ��
                                        Emn=0;
                                        Emn=sum(sum((imb1(row+1:row+blocksize,col+1:col+blocksize)-imb2(row+deltam+p1+1:row+deltam+p1+blocksize,col+deltam+q1+1:col+deltam+q1+blocksize)).^2))/(blocksize^2); 
                                        if Emn<A
                                                    A=Emn;
                                                    No_x(x+1,y+1)=p1;
                                                    No_y(x+1,y+1)=q1;
                                 
                                            end   
                                    end
                                 end
                                 
                                 p1=No_x(x+1,y+1);
                                 q1=No_y(x+1,y+1);
                                 for p2=p1-2:2:p1+2         %�ڶ���
                                     for q2=q1-2:2:q1+2
                                         if p2~=p1 | q2~=q1
                                         Emn=0;
                                         Emn=sum(sum((imb1(row+1:row+blocksize,col+1:col+blocksize)-imb2(row+deltam+p2+1:row+deltam+p2+blocksize,col+deltam+q2+1:col+deltam+q2+blocksize)).^2))/(blocksize^2);
                                         if Emn<A
                                                    A=Emn;
                                                    No_x(x+1,y+1)=p2;
                                                    No_y(x+1,y+1)=q2;
                                            end 
                                         end
                                     end
                                 end
                                 
                                 p2=No_x(x+1,y+1);
                                 q2=No_y(x+1,y+1);
                                 for p3=p2-1:1:p2+1        %������
                                     for q3=q2-1:1:q2+1
                                         if p3~=p2 | q3~=q2 
                                         Emn=0;
                                         Emn=sum(sum((imb1(row+1:row+blocksize,col+1:col+blocksize)-imb2(row+deltam+p3+1:row+deltam+p3+blocksize,col+deltam+q3+1:col+deltam+q3+blocksize)).^2))/(blocksize^2);
                                         if Emn<A
                                                    A=Emn;
                                                    No_x(x+1,y+1)=p3;
                                                    No_y(x+1,y+1)=q3;
                                            end 
                                         end
                                     end
                                 end
                                  A=666666666666666666;
                                 for mx=1:blocksize
                                     for ny=1:blocksize
                                         diff(row+mx,col+ny)=imb1(row+mx,col+ny)-imb2(row+mx+deltam+No_x(x+1,y+1),col+ny+deltam+No_y(x+1,y+1));
                                     end
                                 end    
                       end
                end
toc
endoftoc=toc;
set(handles.text3,'String',toc);%gui������ʾ�㷨����ʱ��
                         for x=0:(rowblocks-1)         %x��ʾ���еڼ����ӿ�
                             row=x*blocksize;
                             for y=0:(colblocks-1)         %y��ʾ���еڼ����ӿ�
                                 col=y*blocksize;
                                 imb3(row+1:row+blocksize,col+1:col+blocksize)=imb2(row+deltam+No_x(x+1,y+1)+1:row+deltam+No_x(x+1,y+1)+blocksize,col+deltam+No_y(x+1,y+1)+1:col+deltam+No_y(x+1,y+1)+blocksize)+diff(row+1:row+blocksize,col+1:col+blocksize);
                             end
                         end
                         imb3=ima1+abs(diff);
                         axes(handles.axes4);%��ͼ
                         imshow(imb3,[]);
%��ֵ�����
TSSpsnr = imgPSNR(imb1, imb3, 255);
set(handles.text7,'String',TSSpsnr);%gui������ʾ�㷨����ʱ��                        
 axes(handles.axes3);%��ͼ
quiver(1:16,1:16,No_y,No_x);
 grid on;        