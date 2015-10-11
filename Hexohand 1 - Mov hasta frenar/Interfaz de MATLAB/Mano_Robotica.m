function varargout = Mano_Robotica(varargin)
% MANO_ROBOTICA MATLAB code for Mano_Robotica.fig
%      MANO_ROBOTICA, by itself, creates a new MANO_ROBOTICA or raises the existing
%      singleton*.
%
%      H = MANO_ROBOTICA returns the handle to a new MANO_ROBOTICA or the handle to
%      the existing singleton*.
%
%      MANO_ROBOTICA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MANO_ROBOTICA.M with the given input arguments.
%
%      MANO_ROBOTICA('Property','Value',...) creates a new MANO_ROBOTICA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Mano_Robotica_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Mano_Robotica_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Mano_Robotica

% Last Modified by GUIDE v2.5 16-Jun-2014 01:37:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Mano_Robotica_OpeningFcn, ...
                   'gui_OutputFcn',  @Mano_Robotica_OutputFcn, ...
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


% --- Executes just before Mano_Robotica is made visible.
function Mano_Robotica_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Mano_Robotica (see VARARGIN)

% Choose default command line output for Mano_Robotica
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Mano_Robotica wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Mano_Robotica_OutputFcn(hObject, eventdata, handles) 
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
clear all;
s = serial('COM5');
set(s, 'BaudRate', 2400);
fopen(s);
fprintf(s, '%s', 'a');
fclose(s);
delete(s);
clear s;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
s = serial('COM5');
set(s, 'BaudRate', 2400);
fopen(s);
fprintf(s, '%s', 'b');
fclose(s);
delete(s);
clear s;

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
s = serial('COM5');
set(s, 'BaudRate', 2400);
fopen(s);
fprintf(s, '%s', 'c');
fclose(s);
delete(s);
clear s;

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
s = serial('COM5');
set(s, 'BaudRate', 2400);
fopen(s);
fprintf(s, '%s', 'd');
fclose(s);
delete(s);
clear s;

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
s = serial('COM5');
set(s, 'BaudRate', 2400);
fopen(s);
fprintf(s, '%s', 'e');
fclose(s);
delete(s);
clear s;

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
s = serial('COM5');
set(s, 'BaudRate', 2400);
fopen(s);
fprintf(s, '%s', 'f');
fclose(s);
delete(s);
clear s;


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
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
s = serial('COM5');
set(s, 'BaudRate', 2400);
fopen(s);
fprintf(s, '%s', 'h');
fclose(s);
delete(s);
clear s;


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
s = serial('COM5');
set(s, 'BaudRate', 2400);
fopen(s);
fprintf(s, '%s', 'i');
fclose(s);
delete(s);
clear s;

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
s = serial('COM5');
set(s, 'BaudRate', 2400);
fopen(s);
fprintf(s, '%s', '1');
fclose(s);
delete(s);
clear s;

% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
s = serial('COM5');
set(s, 'BaudRate', 2400);
fopen(s);
fprintf(s, '%s', '2');
fclose(s);
delete(s);
clear s;

% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
s = serial('COM5');
set(s, 'BaudRate', 2400);
fopen(s);
fprintf(s, '%s', '3');
fclose(s);
delete(s);
clear s;
% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
s = serial('COM5');
set(s, 'BaudRate', 2400);
fopen(s);
fprintf(s, '%s', '4');
fclose(s);
delete(s);
clear s;

% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
s = serial('COM5');
set(s, 'BaudRate', 2400);
fopen(s);
fprintf(s, '%s', '5');
fclose(s);
delete(s);
clear s;

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
s = serial('COM5');
set(s, 'BaudRate', 2400);
fopen(s);
fprintf(s, '%s', '6');
fclose(s);
delete(s);
clear s;

% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
s = serial('COM5');
set(s, 'BaudRate', 2400);
fopen(s);
fprintf(s, '%s', '7');
fclose(s);
delete(s);
clear s;

% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
s = serial('COM5');
set(s, 'BaudRate', 2400);
fopen(s);
fprintf(s, '%s', '8');
fclose(s);
delete(s);
clear s;

% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
s = serial('COM5');
set(s, 'BaudRate', 2400);
fopen(s);
fprintf(s, '%s', '9');
fclose(s);
delete(s);
clear s;

% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
s = serial('COM5');
set(s, 'BaudRate', 2400);
fopen(s);
fprintf(s, '%s', '0');
fclose(s);
delete(s);
clear s;

% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
s = serial('COM5');
set(s, 'BaudRate', 2400);
fopen(s);
fprintf(s, '%s', 'g');
fclose(s);
delete(s);
clear s;


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
s = serial('COM5');
set(s, 'BaudRate', 2400);
fopen(s);
fprintf(s, '%s', 'j');
fclose(s);
delete(s);
clear s;
