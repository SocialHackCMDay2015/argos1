function varargout = Sugerencias(varargin)
%SUGERENCIAS M-file for Sugerencias.fig
%      SUGERENCIAS, by itself, creates a new SUGERENCIAS or raises the existing
%      singleton*.
%
%      H = SUGERENCIAS returns the handle to a new SUGERENCIAS or the handle to
%      the existing singleton*.
%
%      SUGERENCIAS('Property','Value',...) creates a new SUGERENCIAS using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Sugerencias_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      SUGERENCIAS('CALLBACK') and SUGERENCIAS('CALLBACK',hObject,...) call the
%      local function named CALLBACK in SUGERENCIAS.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Sugerencias

% Last Modified by GUIDE v2.5 10-Oct-2015 19:59:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Sugerencias_OpeningFcn, ...
                   'gui_OutputFcn',  @Sugerencias_OutputFcn, ...
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


% --- Executes just before Sugerencias is made visible.
function Sugerencias_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Sugerencias
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Sugerencias wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Sugerencias_OutputFcn(hObject, eventdata, handles)
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
close Sugerencias
HappyTree


% --- Executes on button press in datos.
function datos_Callback(hObject, eventdata, handles)
% hObject    handle to datos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close Sugerencias
Datos
