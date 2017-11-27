function varargout = simple_gui(varargin)
% SIMPLE_GUI MATLAB code for simple_gui.fig
%      SIMPLE_GUI, by itself, creates a new SIMPLE_GUI or raises the existing
%      singleton*.
%
%      H = SIMPLE_GUI returns the handle to a new SIMPLE_GUI or the handle to
%      the existing singleton*.
%
%      SIMPLE_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIMPLE_GUI.M with the given input arguments.
%
%      SIMPLE_GUI('Property','Value',...) creates a new SIMPLE_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before simple_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to simple_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help simple_gui

% Last Modified by GUIDE v2.5 01-Nov-2017 01:30:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @simple_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @simple_gui_OutputFcn, ...
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


% --- Executes just before simple_gui is made visible.
function simple_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to simple_gui (see VARARGIN)

% Choose default command line output for simple_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes simple_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = simple_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnOpenImage.
function btnOpenImage_Callback(hObject, eventdata, handles)
% hObject    handle to btnOpenImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Open the image and save it in the "handles" struct
global img
global xx
global yy
xx = 1;
yy = 1;
file = uigetfile;
img = imread(file);
% img = imread('Jaguar.bmp');
% Set current drawing axes to "axes1"
axes(handles.axes1);
% Display the image
imshow(img);
% Save the handles structure.


% --- Executes on button press in btnSaveImage.
function btnSaveImage_Callback(hObject, eventdata, handles)
% hObject    handle to btnSaveImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnDisplayChannel.
function btnDisplayChannel_Callback(hObject, eventdata, handles)
% hObject    handle to btnDisplayChannel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
get(gca,'CurrentPoint')
disp(gca);
% Call the function 

% Set current drawing axes to "axes2"

% Save the handles structure.

% --- Executes on selection change in popChannel.
function popChannel_Callback(hObject, eventdata, handles)
% hObject    handle to popChannel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popChannel contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popChannel

% Get selected item (channel name) and save it in the handlers

% Save the handles structure.



% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in btnBrightness.
function btnBrightness_Callback(hObject, eventdata, handles)
% hObject    handle to btnBrightness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
% Get brightness offset value from textbox
offset = get(handles.txtOffset, 'String');

% Call the function
indx = get(handles.popChannel, 'Value');

       if(indx == 1)
           img = Brightness(img, 'R', str2double(offset)); 
       elseif(indx == 2)
           img = Brightness(img, 'G', str2double(offset));
       elseif(indx == 3)
           img = Brightness(img, 'B', str2double(offset));
       end 
% Save the handles structure.

% Set current drawing axes to "axes2"
axes(handles.axes2);
imshow(img);


function txtOffset_Callback(hObject, eventdata, handles)
% hObject    handle to txtOffset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtOffset as text
%        str2double(get(hObject,'String')) returns contents of txtOffset as a double


% --- Executes during object creation, after setting all properties.
function txtOffset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtOffset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnApply.
function btnApply_Callback(hObject, eventdata, handles)
% hObject    handle to btnApply (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
newW = str2double(get(handles.scaleX, 'String'));
newH = str2double(get(handles.scaleY, 'String'));
[H, W, L] = size(img) ;


angle = str2double(get(handles.txtRotate, 'String')); 
mat = [cos(angle*(pi/180)) sin(angle*(pi/180)) 0;
                                     -sin(angle*(pi/180)) cos(angle*(pi/180)) 0;
                                     0 0 1];
a = str2double(get(handles.txtXShear, 'String'));
b = str2double(get(handles.txtYShear, 'String'));
mat =  [1 b 0; a 1 0; 0 0 1] * mat ;
mat = [double(newH)/double(H) 0 0; 0 double(newW)/double(W) 0; 0 0 1] * mat ;
%res = forword(img, mat);
%figure, imshow(res);
res = GeometricLinearTransform(img, mat);
axes(handles.axes2);
imshow(res);

% Set original "Image" to the "Result" image

% Set current drawing axes to "axes1"

% Save the handles structure.


% --- Executes on button press in btnTranslate.
function btnTranslate_Callback(hObject, eventdata, handles)
% hObject    handle to btnTranslate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
% Get X offset from textbox
XOffset = get(handles.txtXOffset, 'String');
% Call the function
res = Translate(img, str2double(XOffset));
% Set current drawing axes to "axes2"
axes(handles.axes2);
% Save the handles structure.
imshow(res);


function txtXOffset_Callback(hObject, eventdata, handles)
% hObject    handle to txtXOffset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtXOffset as text
%        str2double(get(hObject,'String')) returns contents of txtXOffset as a double


% --- Executes during object creation, after setting all properties.
function txtXOffset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtXOffset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function scaleX_Callback(hObject, eventdata, handles)
% hObject    handle to scaleX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of scaleX as text
%        str2double(get(hObject,'String')) returns contents of scaleX as a double


% --- Executes during object creation, after setting all properties.
function scaleX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to scaleX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function scaleY_Callback(hObject, eventdata, handles)
% hObject    handle to scaleY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of scaleY as text
%        str2double(get(hObject,'String')) returns contents of scaleY as a double


% --- Executes during object creation, after setting all properties.
function scaleY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to scaleY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in scale.
function scale_Callback(hObject, eventdata, handles)
% hObject    handle to scale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
%set(handles.scaleX, 'String', get(handles.scaleY, 'String'));
newW = str2double(get(handles.scaleX, 'String'));
newH = str2double(get(handles.scaleY, 'String'));
[H, W, ~] = size(img) ;
% J = imresize(I,1.25); try in scale
res = forword(img, [newH/H 0 0; 0 newW/W 0; 0 0 1]);
% res = GeometricLinearTransform(img, [newH/H 0 0; 0 newW/W 0; 0 0 1]);
axes(handles.axes2);
imshow(res);



function txtRotate_Callback(hObject, eventdata, handles)
% hObject    handle to txtRotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtRotate as text
%        str2double(get(hObject,'String')) returns contents of txtRotate as a double


% --- Executes during object creation, after setting all properties.
function txtRotate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtRotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in rotate.
function rotate_Callback(hObject, eventdata, handles)
% hObject    handle to rotate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
angle = str2double(get(handles.txtRotate, 'String')); 
res = forword(img, [cos(angle*(pi/180)) sin(angle*(pi/180)) 0;
                                    -sin(angle*(pi/180)) cos(angle*(pi/180)) 0;
                                    0 0 1]);
% res = GeometricLinearTransform(img, [cos(angle*(pi/180)) sin(angle*(pi/180)) 0;
%                                      -sin(angle*(pi/180)) cos(angle*(pi/180)) 0;
%                                      0 0 1]);
axes(handles.axes2);
imshow(res);



function txtXShear_Callback(hObject, eventdata, handles)
% hObject    handle to txtXShear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtXShear as text
%        str2double(get(hObject,'String')) returns contents of txtXShear as a double


% --- Executes during object creation, after setting all properties.
function txtXShear_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtXShear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtYShear_Callback(hObject, eventdata, handles)
% hObject    handle to txtYShear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtYShear as text
%        str2double(get(hObject,'String')) returns contents of txtYShear as a double


% --- Executes during object creation, after setting all properties.
function txtYShear_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtYShear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in shear.
function shear_Callback(hObject, eventdata, handles)
% hObject    handle to shear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
a = str2double(get(handles.txtXShear, 'String'));
b = str2double(get(handles.txtYShear, 'String'));
res = forword(img, [1 b 0; a 1 0; 0 0 1]);
% res = GeometricLinearTransform(img, [1 b 0; a 1 0; 0 0 1]);
axes(handles.axes2);
imshow(res);


% --- Executes on button press in Not.
function Not_Callback(hObject, eventdata, handles)
% hObject    handle to Not (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
res = Not(img);
[H W L] = size(img);
disp(H);
disp(W);
axes(handles.axes2);
imshow(res);


% --- Executes on button press in add.
function add_Callback(hObject, eventdata, handles)
% hObject    handle to add (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
global img2
res = AddTwoImages(img, img2);
axes(handles.axes2);
imshow(res);



function gamaVal_Callback(hObject, eventdata, handles)
% hObject    handle to gamaVal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of gamaVal as text
%        str2double(get(hObject,'String')) returns contents of gamaVal as a double


% --- Executes during object creation, after setting all properties.
function gamaVal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gamaVal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Gamma.
function Gamma_Callback(hObject, eventdata, handles)
% hObject    handle to Gamma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
%gama = str2double(get(handles.gamaVal, 'String'));
gama = get(handles.sliderGama,'Value');
disp(gama);
res = Gama(img, gama);
axes(handles.axes2);
imshow(res);


% --- Executes on button press in openSecImage.
function openSecImage_Callback(hObject, eventdata, handles)
% hObject    handle to openSecImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img2
filename = uigetfile;
img2 = imread(filename);
% img = imread('Jaguar.bmp');
% Set current drawing axes to "axes1"
axes(handles.axes3);
% Display the image
imshow(img2);


% --- Executes on slider movement.
function sliderGama_Callback(hObject, eventdata, handles)
% hObject    handle to sliderGama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderGama_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderGama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in wrap.
function wrap_Callback(hObject, eventdata, handles)
% hObject    handle to wrap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
%for chess picture
p1 = [100 295 330 137; 215 95 660 780];
p2 = [ 1 500 500 1; 1 1 500 500];
axes(handles.axes2);
res=Warp(img, p1, p2);
imshow(res);




% --- Executes on button press in FixTrans.
function FixTrans_Callback(hObject, eventdata, handles)
% hObject    handle to FixTrans (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
global img2
[res, xTrans, yTrans] = FixTrans(img, img2);
wrongAns = Correct(rgb2gray(img), res);

axes(handles.axes2);
imshow(res);
disp(xTrans);
disp(yTrans);
msgbox(strcat('Number of wrong answers =  ',num2str(wrongAns)));


% --- Executes on button press in align.
function align_Callback(hObject, eventdata, handles)
% hObject    handle to align (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
W = str2double(get(handles.scaleX, 'String'));
H = str2double(get(handles.scaleY, 'String'));
axes(handles.axes2);
 [res, Corners]=Align(img, W, H);

imshow(res);


% --- Executes on button press in extractLandMarks.
function extractLandMarks_Callback(hObject, eventdata, handles)
% hObject    handle to extractLandMarks (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img
len = str2num(get(handles.textLen, 'String'));
[Endpoints, ShortRidges] = ExtractLandmarks(img, len);







function textLen_Callback(hObject, eventdata, handles)
% hObject    handle to textLen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of textLen as text
%        str2double(get(hObject,'String')) returns contents of textLen as a double


% --- Executes during object creation, after setting all properties.
function textLen_CreateFcn(hObject, eventdata, handles)
% hObject    handle to textLen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
