function varargout = Goniometro_digital(varargin)
% GONIOMETRO_DIGITAL MATLAB code for Goniometro_digital.fig
%      GONIOMETRO_DIGITAL, by itself, creates a new GONIOMETRO_DIGITAL or raises the existing
%      singleton*.
%
%      H = GONIOMETRO_DIGITAL returns the handle to a new GONIOMETRO_DIGITAL or the handle to
%      the existing singleton*.
%
%      GONIOMETRO_DIGITAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GONIOMETRO_DIGITAL.M with the given input arguments.
%
%      GONIOMETRO_DIGITAL('Property','Value',...) creates a new GONIOMETRO_DIGITAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Goniometro_digital_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Goniometro_digital_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Goniometro_digital

% Last Modified by GUIDE v2.5 19-Nov-2014 23:10:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Goniometro_digital_OpeningFcn, ...
                   'gui_OutputFcn',  @Goniometro_digital_OutputFcn, ...
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


% --- Executes just before Goniometro_digital is made visible.
function Goniometro_digital_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Goniometro_digital (see VARARGIN)

% Choose default command line output for Goniometro_digital
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);




% UIWAIT makes Goniometro_digital wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Goniometro_digital_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in menu.
function menu_Callback(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu

opcion=get(handles.menu,'Value');
switch opcion
    case 1
        set(handles.unidad,'String', '(No es necesario)');
    case 2
        set(handles.unidad,'String', 'muestras');
    case 3
        set(handles.unidad,'String', 'segundos');
end
        
    



% --- Executes during object creation, after setting all properties.
function menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cantidad_Callback(hObject, eventdata, handles)
% hObject    handle to cantidad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cantidad as text
%        str2double(get(hObject,'String')) returns contents of cantidad as a double


% --- Executes during object creation, after setting all properties.
function cantidad_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cantidad (see GCBO)
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
a.BaudRate = 9600;   %Se define la velocidad de transimisión de datos
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');

opcion=get(handles.menu,'Value');

%numero=get(handles.cantidad,'String');
%numero=str2num(numero);

switch opcion
    case 1
        t_solic=Inf;
        muestras=Inf;
    case 2
        cantidad=get(handles.cantidad,'String');
        muestras=str2num(cantidad);
        t_solic=Inf;
    case 3
        cantidad=get(handles.cantidad,'String');
        t_solic=str2num(cantidad);
        muestras=Inf;
end

n=1;
global ax ay az gx gy gz d d2 t
ax=[];
ay=[];
az=[];
gx=[];
gy=[];
gz=[];
d=[];
d2=[];
t=[];
tiempo=0;
inicio=1;

fopen(a);

        while((inicio==1)&(n<=muestras)&(tiempo<=t_solic))
        
        error=fscanf(a,'%d');
            if(error==0)
            
                accelx=fscanf(a,'%d');
                accely=fscanf(a,'%d');
                accelz=fscanf(a,'%d');
                gyrox =fscanf(a,'%d');
                gyroy =fscanf(a,'%d');
                gyroz =fscanf(a,'%d');
                degree=fscanf(a,'%d')*(300/987);
                degree2=fscanf(a,'%d')*(300/987);

                    if n>1;
                    t1=toc;
                    tiempo=tiempo+t1;
                    end
                tic;
                
                if((degree>0)&(degree2>0)&(degree<400)&(degree2<400))
                t(n)=tiempo;
                ax(n)=accelx;
                ay(n)=accely;
                az(n)=accelz;
                gx(n)=gyrox;
                gy(n)=gyroy;
                gz(n)=gyroz;
                d(n)=degree;
                d2(n)=degree2;
                end
                
                if((mod(n, 25)==0))
                
                    axes(handles.axes11);
                    plot(t,d);
                    title(['\fontsize{12}\color{yellow}Goniometro 1']) 
                    ylabel('Angulos (grados)')
                    xlabel('Tiempo (s)')
                    grid on
                    
                    axes(handles.axes21);
                    plot(t,d2);
                    title(['\fontsize{12}\color{yellow}Goniometro 2']) 
                    ylabel('Angulos (grados)')
                    xlabel('Tiempo (s)')
                    grid on

                    axes(handles.axes12);
                    plot(t,ax,'r');
                    hold on
                    plot(t,ay,'g');
                    hold on
                    plot(t,az,'b');
                    hold off  
                    legend('x', 'y', 'z')
                    title(['\fontsize{12}\color{yellow}Aceleración x,y,z']) 
                    ylabel('Aceleracion')
                    xlabel('Tiempo (s)')
                    grid on  
                    
                    axes(handles.axes22);
                    plot(t,gx,'r');
                    hold on
                    plot(t,gy,'g');
                    hold on
                    plot(t,gz,'b');
                    hold off  
                    legend('x', 'y', 'z')
                    title(['\fontsize{12}\color{yellow}Giro x,y,z']) 
                    ylabel('Giro')
                    xlabel('Tiempo (s)')
                    grid on  
                    
                    drawnow
                end
                n=n+1;
            end
        end     
fclose(a);
delete(a);



% --- Executes on button press in detener.
function detener_Callback(hObject, eventdata, handles)
% hObject    handle to detener (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global inicio
inicio=0;



% --- Executes on button press in listado.
function listado_Callback(hObject, eventdata, handles)
% hObject    handle to listado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ultimo
for i=1:1:ultimo
    disp(v(i))
end


% --- Executes during object creation, after setting all properties.
function axes22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes22


% --- Executes on mouse press over axes background.
function axes22_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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



% --- Executes on button press in analisis.
function analisis_Callback(hObject, eventdata, handles)
% hObject    handle to analisis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Goniometro_digital
Analisis



% --- Executes on button press in muestreo.
function muestreo_Callback(hObject, eventdata, handles)
% hObject    handle to muestreo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes11


% --- Executes on button press in guardar.
function guardar_Callback(hObject, eventdata, handles)
% hObject    handle to guardar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global ax ay az gx gy gz d d2 t;

%save(get(handles.nombre,'String'),'ax','ay','az','gx','gy','gz','d','d2','t');
save(uiputfile,'ax','ay','az','gx','gy','gz','d','d2','t');
msgbox('Archivo guardado correctamente','Guardar','help');


function nombre_Callback(hObject, eventdata, handles)
% hObject    handle to nombre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nombre as text
%        str2double(get(hObject,'String')) returns contents of nombre as a double


% --- Executes during object creation, after setting all properties.
function nombre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nombre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
