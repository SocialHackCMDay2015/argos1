function varargout = Analisis(varargin)
%ANALISIS M-file for Analisis.fig
%      ANALISIS, by itself, creates a new ANALISIS or raises the existing
%      singleton*.
%
%      H = ANALISIS returns the handle to a new ANALISIS or the handle to
%      the existing singleton*.
%
%      ANALISIS('Property','Value',...) creates a new ANALISIS using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Analisis_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      ANALISIS('CALLBACK') and ANALISIS('CALLBACK',hObject,...) call the
%      local function named CALLBACK in ANALISIS.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Analisis

% Last Modified by GUIDE v2.5 20-Nov-2014 02:13:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Analisis_OpeningFcn, ...
                   'gui_OutputFcn',  @Analisis_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before Analisis is made visible.
function Analisis_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Analisis
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Analisis wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Analisis_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in analisis.
function analisis_Callback(hObject, eventdata, handles)
% hObject    handle to analisis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in muestreo.
function muestreo_Callback(hObject, eventdata, handles)
% hObject    handle to muestreo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Analisis
Goniometro_digital


% --- Executes on selection change in lista_t.
function lista_t_Callback(hObject, eventdata, handles)
% hObject    handle to lista_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lista_t contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lista_t


% --- Executes during object creation, after setting all properties.
function lista_t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lista_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cargar.
function cargar_Callback(hObject, eventdata, handles)
% hObject    handle to cargar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global ax ay az gx gy gz d d2 t;
[file,folder]=uigetfile('*.mat');
filename=fullfile(folder,file);
global data;
data=load(filename)
%global ax ay az gx gy gz d d2 t;

%load('analisis1.mat')
% Obtiene todos el contenido de la lista_t 



% --- Executes on button press in enlistar.
function enlistar_Callback(hObject, eventdata, handles)
% hObject    handle to enlistar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%global ax ay az gx gy gz d d2 t;
global data;
ax=data.ax;
ay=data.ay;
az=data.az;
gx=data.gx;
gy=data.gy;
gz=data.gz;
d=data.d;
d2=data.d2;
t=data.t;
%cadena=num2str(t(1));
dimensiones=size(ax);
cantidad=dimensiones(2);
for i=1:cantidad
    list_t = get(handles.lista_t, 'String'); 
    cadena=strcat(num2str(i),'--->',num2str(t(i)));
    new_list_t=strvcat(list_t,cadena);
    set(handles.lista_t,'String',new_list_t);

    list_d = get(handles.lista_d, 'String'); 
    cadena=strcat(num2str(i),'--->',num2str(d(i)));
    new_list_d=strvcat(list_d,cadena);
    set(handles.lista_d,'String',new_list_d);
    
    list_d2 = get(handles.lista_d2, 'String'); 
    cadena=strcat(num2str(i),'--->',num2str(d2(i)));
    new_list_d2=strvcat(list_d2,cadena);
    set(handles.lista_d2,'String',new_list_d2);
    
    list_ax = get(handles.lista_ax, 'String'); 
    cadena=strcat(num2str(i),'--->',num2str(ax(i)));
    new_list_ax=strvcat(list_ax,cadena);
    set(handles.lista_ax,'String',new_list_ax);
    
    list_ay = get(handles.lista_ay, 'String'); 
    cadena=strcat(num2str(i),'--->',num2str(ay(i)));
    new_list_ay=strvcat(list_ay,cadena);
    set(handles.lista_ay,'String',new_list_ay);
    
    list_az = get(handles.lista_az, 'String'); 
    cadena=strcat(num2str(i),'--->',num2str(az(i)));
    new_list_az=strvcat(list_az,cadena);
    set(handles.lista_az,'String',new_list_az);
    
    list_gx = get(handles.lista_gx, 'String'); 
    cadena=strcat(num2str(i),'--->',num2str(gx(i)));
    new_list_gx=strvcat(list_gx,cadena);
    set(handles.lista_gx,'String',new_list_gx);
    
    list_gy = get(handles.lista_gy, 'String'); 
    cadena=strcat(num2str(i),'--->',num2str(gy(i)));
    new_list_gy=strvcat(list_gy,cadena);
    set(handles.lista_gy,'String',new_list_gy);
    
    list_gz = get(handles.lista_gz, 'String'); 
    cadena=strcat(num2str(i),'--->',num2str(gz(i)));
    new_list_gz=strvcat(list_gz,cadena);
    set(handles.lista_gz,'String',new_list_gz);
end


% --- Executes on selection change in lista_d.
function lista_d_Callback(hObject, eventdata, handles)
% hObject    handle to lista_d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lista_d contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lista_d


% --- Executes during object creation, after setting all properties.
function lista_d_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lista_d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in lista_d2.
function lista_d2_Callback(hObject, eventdata, handles)
% hObject    handle to lista_d2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lista_d2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lista_d2


% --- Executes during object creation, after setting all properties.
function lista_d2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lista_d2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in lista_ax.
function lista_ax_Callback(hObject, eventdata, handles)
% hObject    handle to lista_ax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lista_ax contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lista_ax


% --- Executes during object creation, after setting all properties.
function lista_ax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lista_ax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in lista_ay.
function lista_ay_Callback(hObject, eventdata, handles)
% hObject    handle to lista_ay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lista_ay contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lista_ay


% --- Executes during object creation, after setting all properties.
function lista_ay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lista_ay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in lista_az.
function lista_az_Callback(hObject, eventdata, handles)
% hObject    handle to lista_az (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lista_az contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lista_az


% --- Executes during object creation, after setting all properties.
function lista_az_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lista_az (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in lista_gx.
function lista_gx_Callback(hObject, eventdata, handles)
% hObject    handle to lista_gx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lista_gx contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lista_gx


% --- Executes during object creation, after setting all properties.
function lista_gx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lista_gx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in lista_gy.
function lista_gy_Callback(hObject, eventdata, handles)
% hObject    handle to lista_gy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lista_gy contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lista_gy


% --- Executes during object creation, after setting all properties.
function lista_gy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lista_gy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in lista_gz.
function lista_gz_Callback(hObject, eventdata, handles)
% hObject    handle to lista_gz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lista_gz contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lista_gz


% --- Executes during object creation, after setting all properties.
function lista_gz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lista_gz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
