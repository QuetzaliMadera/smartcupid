function varargout = Compatibilidad(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Compatibilidad_OpeningFcn, ...
                   'gui_OutputFcn',  @Compatibilidad_OutputFcn, ...
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
global a;
a = zeros(1,6);


% --- Entrenamiento de la red
function Compatibilidad_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

global net;
global Tn;
     % Edad
X = [24 25 23 23 22 57 31 39 24 24 29 31 25 24 22 22 26 26 24 23 51 35 37 25 25 23 28 25 25 21;...
     % Fotos
    293 159 159 446 538 43 106 9 41 105 160 63 134 172 302 608 28 112 687 415 298 20 2 10 32 101 287 26 39 597;...
     % Amigos
    305 201 126 890 122 111 300 149 90 147 143 137 306 233 298 340 274 178 1375 321 152 80 198 144 130 162 162 78 281 299;...
     % Post anual
    18 10 12 13 21 13 18 5 17 9 21 16 24 13 22 15  11 18 29 56 11 4 8 6 7 14 13 11 15 19;...
     % Me gusta
    128 28 62 94 101 102 139 9 72 21 83 98 158 20 130 313 170 116 263 260 84 2 20 18 12 93 90 9 171 279;...
     % Comentarios
    187 30 68 55 84 187 127 6 54 15 57 103 136 32 195 129 176 101 191 199 90 1 13 7 9 74 111 5 184 141];

     % Edad
T = [22 26 26 24 23 51 35 37 25 25 23 28 25 25 21 24 25 23 23 22 57 31 39 24 24 29 31 25 24 22;...
     % Fotos
    608 28 112 687 415 298 20 2 10 32 101 287 26 39 597 293 159 159 446 538 43 106 9 41 105 160 63 134 172 302;...
     % Amigos
    340 274 178 1375 321 152 80 198 144 130 162 162 78 281 299 305 201 126 890 122 111 300 149 90 147 143 137 306 233 298;...
     % Post anual
    15  11 18 29 56 11 4 8 6 7 14 13 11 15 19 18 10 12 13 21 13 18 5 17 9 21 16 24 13 22;...
     % Me gusta
    313 170 116 263 260 84 2 20 18 12 93 90 9 171 279 128 28 62 94 101 102 139 9 72 21 83 98 158 20 130;...
     % Comentarios
    129 176 101 191 199 90 1 13 7 9 74 111 5 184 141 187 30 68 55 84 187 127 6 54 15 57 103 136 32 195];

% --- Datos Normalizados
Xn = [X(1,:)/57;X(2,:)/687;X(3,:)/1375;X(4,:)/56;X(5,:)/313;X(6,:)/199];
Tn = [T(1,:)/57;T(2,:)/687;T(3,:)/1375;T(4,:)/56;T(5,:)/313;T(6,:)/199];

Xi = repmat(Xn,1,20);
Ti = repmat(Tn,1,20);

net = feedforwardnet(10);
net = configure(net, Xi, Ti);
net = train(net, Xi, Ti);




function varargout = Compatibilidad_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function txt_edad_Callback(hObject, eventdata, handles)

function txt_edad_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txt_fotos_Callback(hObject, eventdata, handles)
function txt_fotos_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txt_amigos_Callback(hObject, eventdata, handles)
function txt_amigos_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txt_post_Callback(hObject, eventdata, handles)
function txt_post_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txt_megusta_Callback(hObject, eventdata, handles)

function txt_megusta_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function txt_comentarios_Callback(hObject, eventdata, handles)

function txt_comentarios_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Compatibilidad entre personas
function cmd_ok_Callback(hObject, eventdata, handles)
global a;
global net;
global Tn;

% --- Obtencion de los datos
edad = get(handles.txt_edad,'String');
fotos = get(handles.txt_fotos,'String');
amigos = get(handles.txt_amigos,'String');
post = get(handles.txt_post,'String');
megusta = get(handles.txt_megusta,'String');
comentarios = get(handles.txt_comentarios,'String');

% --- Se llena el vector
a(1)= str2num(edad);
a(2)= str2num(fotos);
a(3)= str2num(amigos);
a(4)= str2num(post);
a(5)= str2num(megusta);
a(6)= str2num(comentarios);

% --- Vector normalizado
a = [a(1)/57;a(2)/687;a(3)/1375;a(4)/56;a(5)/313;a(6)/199];

% --- Similitud por coseno (Formula)
contador = 1;
r = net(a);
for j = Tn
    acc = 0;
    for i = 1:size(j)
        acc = acc + r(i)*j(i);
    end
    pp = acc;

    acc = 0;
    for i = 1:size(r)
        acc = acc + r(i).^2;
    end
    magA = sqrt(acc);

    acc = 0;
    for i = 1:size(j)
        acc = acc + j(i).^2;
    end
    magB = sqrt(acc);

    sim(contador) = pp/(magA*magB);
    contador = contador + 1;
end

r = max(sim);
[~,indx] = ismember([r],sim','rows');


% --- Se imprime el nombre de la persona
switch indx
    case 1
        set(handles.lbl_pareja,'String','Silvia Alejandra');
    case 2
        set(handles.lbl_pareja,'String','Mariel Gamez');
    case 3
        set(handles.lbl_pareja,'String','Marie Collinn');
    case 4
        set(handles.lbl_pareja,'String','Ariel Olguin');
    case 5
        set(handles.lbl_pareja,'String','Jhoann Bugueño');
    case 6
        set(handles.lbl_pareja,'String','Reyna Aguila');
    case 7
        set(handles.lbl_pareja,'String','Josep León');
    case 8
        set(handles.lbl_pareja,'String','Raquel Garcia');   
    case 9
        set(handles.lbl_pareja,'String','Daniel Chavez');
    case 10
        set(handles.lbl_pareja,'String','Joel Ochoa');
    case 11
        set(handles.lbl_pareja,'String','Karen Velazquez');
    case 12
        set(handles.lbl_pareja,'String','Chris Estrada');
    case 13
        set(handles.lbl_pareja,'String','Sonia Lizarraga');
    case 14
        set(handles.lbl_pareja,'String','Lizbeth Herrera ');
    case 15
        set(handles.lbl_pareja,'String','Silvia Alejandra');
    case 16
        set(handles.lbl_pareja,'String','Sergio Armando');
    case 17
        set(handles.lbl_pareja,'String','Marco Marin');
    case 18
        set(handles.lbl_pareja,'String','Martin Croteau');
    case 19
        set(handles.lbl_pareja,'String','Pamela Luppi');
    case 20
        set(handles.lbl_pareja,'String','Pabla Orellana');
    case 21
        set(handles.lbl_pareja,'String','Javier Hernandez');
    case 22
        set(handles.lbl_pareja,'String','Noelia Martín');
    case 23
        set(handles.lbl_pareja,'String','Juli Tarres');
    case 24
        set(handles.lbl_pareja,'String','Ruth Johnson');
    case 25
        set(handles.lbl_pareja,'String','Yajaira Araujo');
    case 26
        set(handles.lbl_pareja,'String','Oswaldo Ficachi');  
    case 27
        set(handles.lbl_pareja,'String','Raul Ruiz'); 
    case 28
        set(handles.lbl_pareja,'String','Manuel Salcedo');
    case 29
        set(handles.lbl_pareja,'String','Fernando Luna'); 
    case 30
        set(handles.lbl_pareja,'String','Sergio Armando'); 
end

