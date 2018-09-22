% CSCI-631 Project
% Eshaan Shah (es7933@g.rit.edu)
% Pranit Meher (pxm3417@g.rit.edu)
% Object size estimation using photogrammetry
% This is the GUI

function varargout = eshaan_pranit_gui(varargin)
% ESHAAN_PRANIT_GUI MATLAB code for eshaan_pranit_gui.fig
%      ESHAAN_PRANIT_GUI, by itself, creates a new ESHAAN_PRANIT_GUI or raises the existing
%      singleton*.
%
%      H = ESHAAN_PRANIT_GUI returns the handle to a new ESHAAN_PRANIT_GUI or the handle to
%      the existing singleton*.
%
%      ESHAAN_PRANIT_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ESHAAN_PRANIT_GUI.M with the given input arguments.
%
%      ESHAAN_PRANIT_GUI('Property','Value',...) creates a new ESHAAN_PRANIT_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before eshaan_pranit_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to eshaan_pranit_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help eshaan_pranit_gui

% Last Modified by GUIDE v2.5 03-Dec-2017 12:29:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @eshaan_pranit_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @eshaan_pranit_gui_OutputFcn, ...
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


% --- Executes just before eshaan_pranit_gui is made visible.
function eshaan_pranit_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to eshaan_pranit_gui (see VARARGIN)

% Choose default command line output for eshaan_pranit_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes eshaan_pranit_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = eshaan_pranit_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% Select Image
% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);
    imageName = uigetfile('*.*','Select the image');
    handles.img = imread(imageName);
    handles.img = imresize(handles.img, 0.2);
    handles.img = im2double(handles.img);
    axes(handles.axes3);
    imshow(handles.img);
    set(handles.text6, 'String', imageName);
    guidata(hObject, handles);

% Rotate Left
% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject);
    handles.img = imrotate(handles.img, 90);
    axes(handles.axes3);
    imshow(handles.img);
    guidata(hObject, handles);

% Rotate Right
% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    handles = guidata(hObject);
    handles.img = imrotate(handles.img, -90);
    axes(handles.axes3);
    imshow(handles.img);
    guidata(hObject, handles);

% Width of the Box textbox
function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double

% Width of the Box textbox
% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Estimate Button
% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    handles = guidata(hObject);
    handles.width = str2double(get(handles.edit2,'string'));
    % [handles.height, handles.result] = ObjectSizeEstimationCode(handles.img, handles.width);
    [handles.height, handles.result] = eshaan_pranit(handles.img, handles.width);
    axes(handles.axes4);
    imshow(handles.result);
    set(handles.text9, 'String', handles.height);
    guidata(hObject, handles);
