function varargout = Datos(varargin)
%DATOS M-file for Datos.fig
%      DATOS, by itself, creates a new DATOS or raises the existing
%      singleton*.
%
%      H = DATOS returns the handle to a new DATOS or the handle to
%      the existing singleton*.
%
%      DATOS('Property','Value',...) creates a new DATOS using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Datos_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      DATOS('CALLBACK') and DATOS('CALLBACK',hObject,...) call the
%      local function named CALLBACK in DATOS.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Datos

% Last Modified by GUIDE v2.5 10-Oct-2015 22:44:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Datos_OpeningFcn, ...
                   'gui_OutputFcn',  @Datos_OutputFcn, ...
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


% --- Executes just before Datos is made visible.
function Datos_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Datos
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Datos wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Datos_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in sugerencias.
function sugerencias_Callback(hObject, eventdata, handles)
% hObject    handle to sugerencias (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Datos
Sugerencias


% --- Executes on button press in principal.
function principal_Callback(hObject, eventdata, handles)
% hObject    handle to principal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Datos
HappyTree


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,folder]=uigetfile('*.mat');
filename=fullfile(folder,file);
global data;
data=load(filename)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
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
    list_ph = get(handles.lista_ph, 'String'); 
    cadena=strcat(num2str(i),'--->',num2str(t(i)));
    new_list_ph=strvcat(list_ph,cadena);
    set(handles.lista_ph,'String',new_list_ph);

    list_humedad = get(handles.lista_humedad, 'String'); 
    cadena=strcat(num2str(i),'--->',num2str(d(i)));
    new_list_humedad=strvcat(list_humedad,cadena);
    set(handles.lista_humedad,'String',new_list_humedad);
    
    list_tamb = get(handles.lista_tamb, 'String'); 
    cadena=strcat(num2str(i),'--->',num2str(d2(i)));
    new_list_tamb=strvcat(list_tamb,cadena);
    set(handles.lista_tamb,'String',new_list_tamb);
    
    list_ttierra = get(handles.lista_ttierra, 'String'); 
    cadena=strcat(num2str(i),'--->',num2str(ax(i)));
    new_list_ttierra=strvcat(list_ttierra,cadena);
    set(handles.lista_ttierra,'String',new_list_ttierra);
    
    list_CO2 = get(handles.lista_CO2, 'String'); 
    cadena=strcat(num2str(i),'--->',num2str(ay(i)));
    new_list_CO2=strvcat(list_CO2,cadena);
    set(handles.lista_CO2,'String',new_list_CO2);
    
    list_presion = get(handles.lista_presion, 'String'); 
    cadena=strcat(num2str(i),'--->',num2str(az(i)));
    new_list_presion=strvcat(list_presion,cadena);
    set(handles.lista_presion,'String',new_list_presion);
    
    list_luz = get(handles.lista_luz, 'String'); 
    cadena=strcat(num2str(i),'--->',num2str(gx(i)));
    new_list_luz=strvcat(list_luz,cadena);
    set(handles.lista_luz,'String',new_list_luz);
    
    list_color = get(handles.lista_color, 'String'); 
    cadena=strcat(num2str(i),'--->',num2str(gy(i)));
    new_list_color=strvcat(list_color,cadena);
    set(handles.lista_color,'String',new_list_color);
    
    %list_gz = get(handles.lista_gz, 'String'); 
    %cadena=strcat(num2str(i),'--->',num2str(gz(i)));
    %new_list_gz=strvcat(list_gz,cadena);
    %set(handles.lista_gz,'String',new_list_gz);
end


% --- Executes on selection change in lista_ph.
function lista_ph_Callback(hObject, eventdata, handles)
% hObject    handle to lista_ph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lista_ph contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lista_ph


% --- Executes during object creation, after setting all properties.
function lista_ph_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lista_ph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in lista_humedad.
function lista_humedad_Callback(hObject, eventdata, handles)
% hObject    handle to lista_humedad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lista_humedad contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lista_humedad


% --- Executes during object creation, after setting all properties.
function lista_humedad_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lista_humedad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in lista_tamb.
function lista_tamb_Callback(hObject, eventdata, handles)
% hObject    handle to lista_tamb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lista_tamb contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lista_tamb


% --- Executes during object creation, after setting all properties.
function lista_tamb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lista_tamb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in lista_ttierra.
function lista_ttierra_Callback(hObject, eventdata, handles)
% hObject    handle to lista_ttierra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lista_ttierra contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lista_ttierra


% --- Executes during object creation, after setting all properties.
function lista_ttierra_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lista_ttierra (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in lista_CO2.
function lista_CO2_Callback(hObject, eventdata, handles)
% hObject    handle to lista_CO2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lista_CO2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lista_CO2


% --- Executes during object creation, after setting all properties.
function lista_CO2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lista_CO2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in lista_presion.
function lista_presion_Callback(hObject, eventdata, handles)
% hObject    handle to lista_presion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lista_presion contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lista_presion


% --- Executes during object creation, after setting all properties.
function lista_presion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lista_presion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in lista_luz.
function lista_luz_Callback(hObject, eventdata, handles)
% hObject    handle to lista_luz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lista_luz contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lista_luz


% --- Executes during object creation, after setting all properties.
function lista_luz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lista_luz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in lista_color.
function lista_color_Callback(hObject, eventdata, handles)
% hObject    handle to lista_color (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lista_color contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lista_color


% --- Executes during object creation, after setting all properties.
function lista_color_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lista_color (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
