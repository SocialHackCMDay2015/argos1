function varargout = HappyTree(varargin)
% HAPPYTREE MATLAB code for HappyTree.fig
%      HAPPYTREE, by itself, creates a new HAPPYTREE or raises the existing
%      singleton*.
%
%      H = HAPPYTREE returns the handle to a new HAPPYTREE or the handle to
%      the existing singleton*.
%
%      HAPPYTREE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HAPPYTREE.M with the given input arguments.
%
%      HAPPYTREE('Property','Value',...) creates a new HAPPYTREE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before HappyTree_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to HappyTree_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help HappyTree

% Last Modified by GUIDE v2.5 11-Oct-2015 12:25:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @HappyTree_OpeningFcn, ...
                   'gui_OutputFcn',  @HappyTree_OutputFcn, ...
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


% --- Executes just before HappyTree is made visible.
function HappyTree_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to HappyTree (see VARARGIN)

% Choose default command line output for HappyTree
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes HappyTree wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = HappyTree_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in principal.
function principal_Callback(hObject, eventdata, handles)
% hObject    handle to principal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in datos.
function datos_Callback(hObject, eventdata, handles)
% hObject    handle to datos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close HappyTree
Datos


% --- Executes on button press in sugerencias.
function sugerencias_Callback(hObject, eventdata, handles)
% hObject    handle to sugerencias (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close HappyTree
Sugerencias


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function periodo_Callback(hObject, eventdata, handles)
% hObject    handle to periodo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of periodo as text
%        str2double(get(hObject,'String')) returns contents of periodo as a double


% --- Executes during object creation, after setting all properties.
function periodo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to periodo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in iniciar.
function iniciar_Callback(hObject, eventdata, handles)
% hObject    handle to iniciar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc;
global inicio

delete(instrfind({'Port'},{get(handles.puerto,'String')}));
a = serial(get(handles.puerto,'String'));  %Variable que guarda los datos brinda el arduino
a.BaudRate = 2400;   %Se define la velocidad de transimisión de datos
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');

opcion=get(handles.u_tiempo,'Value');

%numero=get(handles.cantidad,'String');
%numero=str2num(numero);

switch opcion
    case 1
        %t_solic=Inf;
        %muestras=Inf;
        periodo=str2num(get(handles.periodo,'String'));
    case 2
        %cantidad=get(handles.cantidad,'String');
        %muestras=str2num(cantidad);
        %t_solic=Inf;
        periodo=str2num(get(handles.periodo,'String'));
    case 3
        %cantidad=get(handles.cantidad,'String');
        %t_solic=str2num(cantidad);
        %muestras=Inf;
        periodo=str2num(get(handles.periodo,'String'));
end

n=1;
global ph humedad t_amb t_tierra d_CO2 presion luz color
ph=[];
humedad=[];
t_amb=[];
t_tierra=[];
d_CO2=[];
presion=[];
luz=[];
color=[];
%t=[];
%tiempo=0;
inicio=1;
fopen(a);

        while((inicio==1))
        %error=fscanf(a,'%d');
            %if(error==0)
            if(1)
            
                v_ph=fscanf(a,'%f');
                v_humedad=fscanf(a,'%f');
                v_t_amb=fscanf(a,'%f');
                v_t_tierra =fscanf(a,'%f');
                v_d_CO2 =fscanf(a,'%f');
                v_presion =fscanf(a,'%f');
                v_luz=fscanf(a,'%f');
                v_color=fscanf(a,'%f');

                    %if n>1;
                    %t1=toc;
                    %tiempo=tiempo+t1;
                    %end
                %tic;
                
                if(1)
                %t(n)=tiempo;
                ph(n)=v_ph;
                humedad(n)=v_humedad;
                t_amb(n)=v_t_amb;
                t_tierra(n)=v_t_tierra;
                d_CO2(n)=v_d_CO2;
                presion(n)=v_presion;
                luz(n)=v_luz;
                color(n)=v_color;
                end
                
                if(1)
                
                    %axes(handles.axes11);
                    %plot(t,luz);
                    %title(['\fontsize{12}\color{yellow}Goniometro 1']) 
                    %ylabel('Angulos (grados)')
                    %xlabel('Tiempo (s)')
                    %grid on
                    
                   
                end
                n=n+1;
            end
        end     
fclose(a);
delete(a);


% --- Executes on button press in guardar.
function guardar_Callback(hObject, eventdata, handles)
% hObject    handle to guardar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6


% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7


% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton8


% --- Executes when uipanel1 is resized.
function uipanel1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in u_tiempo.
function u_tiempo_Callback(hObject, eventdata, handles)
% hObject    handle to u_tiempo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns u_tiempo contents as cell array
%        contents{get(hObject,'Value')} returns selected item from u_tiempo


% --- Executes during object creation, after setting all properties.
function u_tiempo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to u_tiempo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pausar.
function pausar_Callback(hObject, eventdata, handles)
% hObject    handle to pausar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in continuar.
function continuar_Callback(hObject, eventdata, handles)
% hObject    handle to continuar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
grafica=get(handles.checkbox1,'Value');
if(grafica) 
    set(handles.axes1,'Visible','on')
end
if(grafica==0) 
    set(handles.axes1,'Visible','off')
end



function puerto_Callback(hObject, eventdata, handles)
% hObject    handle to puerto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of puerto as text
%        str2double(get(hObject,'String')) returns contents of puerto as a double


% --- Executes during object creation, after setting all properties.
function puerto_CreateFcn(hObject, eventdata, handles)
% hObject    handle to puerto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
