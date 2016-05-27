function varargout = yundongguji(varargin)
% YUNDONGGUJI MATLAB code for yundongguji.fig
%      YUNDONGGUJI, by itself, creates a new YUNDONGGUJI or raises the existing
%      singleton*.
%
%      H = YUNDONGGUJI returns the handle to a new YUNDONGGUJI or the handle to
%      the existing singleton*.
%
%      YUNDONGGUJI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in YUNDONGGUJI.M with the given input arguments.
%
%      YUNDONGGUJI('Property','Value',...) creates a new YUNDONGGUJI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before yundongguji_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to yundongguji_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help yundongguji

% Last Modified by GUIDE v2.5 15-May-2016 15:04:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @yundongguji_OpeningFcn, ...
                   'gui_OutputFcn',  @yundongguji_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT



% --- Executes just before yundongguji is made visible.
function yundongguji_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to yundongguji (see VARARGIN)

% Choose default command line output for yundongguji
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
load('mydata');%�����ж�ֵ���жϵ�ǰ�Ƿ�Ϊ��½״̬
if openflag==1            %���Ϊ1����Ϊ��¼״̬
else
    h=gcf;
    please;           %��please.m�ļ�����ʾδ��¼��Ϣ 
    close(h);         %�رյ�ǰ����
end
global flag;
flag=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%��ʼ������ʾ��������ͼ��
axes(handles.axes5);
a=imread('wait.png');
imshow(a);
axes(handles.axes1);
imshow(a);
axes(handles.axes2);
imshow(a);
axes(handles.axes3);
imshow(a);
axes(handles.axes4);
imshow(a);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% UIWAIT makes yundongguji wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = yundongguji_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global endoftoc;
tic
fullsearch();                                         %����ȫ��������
toc
thistoc=endoftoc/toc;
set(handles.text8,'String',thistoc); 

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global endoftoc;
tic
threesteps();                                        %����������������
toc
thistoc=endoftoc/toc;
set(handles.text8,'String',thistoc); 



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global xulie1 xulie2 foldername;                   %����ͼ������кţ�Ϊȫ�ֱ���
global ima imb;                         %���������ͼ�����б�����Ϊȫ�ֱ���
global flag;                            %����ȫ�ֱ���flag��ֵ
flag=1;
xulie1=get(handles.edit1,'String');     %�õ�GUI����Ĳο�֡�����к�
xulie2=get(handles.edit2,'String');     %�õ�GUI����ĵ�ǰ֡�����к�
axes(handles.axes1);                    %��ʾ�ο�֡ͼ��
ima=rgb2gray(imread(strcat(foldername,'\',xulie1,'.bmp')));
imshow(ima);
axes(handles.axes2);                    %��ʾ��ǰ֡ͼ��
imb=rgb2gray(imread(strcat(foldername,'\',xulie2,'.bmp')));
imshow(imb);

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
%���ñ���ɫ
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
%���ñ���ɫ
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%�˳�����
openflag=0;
save mydata openflag;
close();


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1



% --- Executes on button press in OpenFolder.
function OpenFolder_Callback(hObject, eventdata, handles)
% hObject    handle to OpenFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global flag FileName PathName FilterIndex;%����flag��������������ͼ�����к�ʱ������forѭ����ֹͣ���š�
global foldername;
FileName=0;
[FileName,PathName,FilterIndex]=uigetfile('.avi','ѡ����Ƶ�ļ�');     %����Ƶ�ļ���Ĭ�Ϻ�׺Ϊ.avi
%�����ļ�����·������������ֵ
if FileName==0
    msgbox('��ѡ����Ƶ�ļ�!');
else
fileName = strcat(PathName,FileName); 
obj = VideoReader(fileName);
     houzhui='.avi';
     clearstr=[];
     foldername=strrep(fileName,houzhui,clearstr);
     %%%%%%%%%%%%%%%%%%%%�ж��ļ����Ƿ����
     if exist(foldername)
      rmdir(foldername,'s');
      mkdir(foldername);
     else
      mkdir(foldername);
     end
     %%%%%%%%%%%%%%%%%%%
    axes(handles.axes5);
    fileName = strcat(PathName,'\',FileName);      %�����ļ�����·��
    obj = VideoReader(fileName);               % VideoReader������ȡ��Ƶ�ļ�
    numFrames = obj.NumberOfFrames;            % ��ȡ��Ƶ��֡��
      for i = 1 : numFrames
        frame = read(obj,i);          % ��ȡÿһ֡
        imshow(frame);                %��ʾÿһ֡
        imwrite(frame,strcat(foldername,'\',num2str(i),'.bmp'),'bmp');% ����ÿһ֡
        set(handles.edit3,'string',num2str(i));
        drawnow;                      %����axis
      if flag==1                    %���flagΪ1������ѡ����֡ͼ������кţ�����ѭ����ֹͣ��Ƶ�Ĳ���
          break
       else
           continue
       end
     end
end
%%%
 msgbox('�������ɽ�����');


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global flag;
flag=0;



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
