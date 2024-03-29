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

% Last Modified by GUIDE v2.5 12-Nov-2014 15:39:06

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
clear all
clc
%global a
%a=arduino('COM11')


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
global inicio

delete(instrfind({'Port'},{get(handles.puerto,'String')}));
a = serial(get(handles.puerto,'String'));  %Variable que guarda los datos brinda el arduino
a.BaudRate = 9600;   %Se define la velocidad de transimisión de datos
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');

opcion=get(handles.menu,'Value');
numero=get(handles.cantidad,'String');
numero=str2num(numero);

n=1;
ax=[];
ay=[];
az=[];
gx=[];
gy=[];
gz=[];
d=[];
t=[];
tiempo=0;
inicio=1;

%Abre el puerto serial
fopen(a);

switch opcion
    case 1
        while(inicio==1) 
      
        str1=fscanf(a,'%s');
        str2=fscanf(a,'%s');
        str3=fscanf(a,'%s');
        str4=fscanf(a,'%s');
        str5=fscanf(a,'%s');
        
        error=str2num(str1);
        
            %if(error~=0)
                acel=str2num(str2);
                accelx=acel(1);
                accely=acel(2);
                accelz=acel(3);
                temp=str2num(str3);
                gyro=str2num(str4);
                gyrox=gyro(1);
                gyroy=gyro(2);
                gyroz=gyro(3);
                degree=str2num(str5)*(300/987);

                %sensorValue = fscanf(a,'%d');
                %degree = sensorValue*(270/1023);
                %degree = sensorValue*(300/987);
                    if n>1;
                    t1=toc;
                    tiempo=tiempo+t1;
                    end
                tic;
                t(n)=tiempo;
                ax(n)=accelx;
                ay(n)=accely;
                az(n)=accelz;
                gx(n)=gyrox;
                gy(n)=gyroy;
                gz(n)=gyroz;
                d(n)=degree;
                
                axes(handles.axes11);
                plot(t,d);
                title('Goniometro 1')
                ylabel('Angulos (grados)')
                xlabel('Tiempo (s)')
                grid on
                
                axes(handles.axes12);
                plot(t,ax);
                title('Aceleracion x, y, z')
                ylabel('Aceleracion')
                xlabel('Tiempo (s)')
                grid on
                
                
                
                drawnow
                n=n+1;
            %end
        end
    case 2
        while((n<=numero)&(inicio==1))
        sensorValue =  fscanf(a,'%d');
        %degree = sensorValue*(270/1023);
        degree = sensorValue*(300/987);
            if n>1;
            t1=toc;
            tiempo=tiempo+t1;
            end
        tic;
        t(n)=tiempo;
        v(n)=degree;
        plot(t,v);
        title('Goniometro 1')
        xlabel('Tiempo (s)')
        ylabel('Angulos (grados)')
        grid on
        drawnow
        n=n+1;
        end
    case 3
        while((tiempo<=numero)&(inicio==1))
        sensorValue = fscanf(a,'%d');
        %degree = sensorValue*(270/1023);
        degree = sensorValue*(300/987);
            if n>1;
            t1=toc;
            tiempo=tiempo+t1;
            end
        tic;
        t(n)=tiempo;
        v(n)=degree;
        plot(t,v);
        title('Goniometro 1')
        xlabel('Tiempo (s)')
        ylabel('Angulos (grados)')
        grid on
        drawnow
        n=n+1;
        end
    
     
end

global ultimo
ultimo=n;
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



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
