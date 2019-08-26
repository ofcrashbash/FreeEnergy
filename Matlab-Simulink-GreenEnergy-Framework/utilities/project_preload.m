function project_preload()
%PROJECT_PRELOAD preload all common data to simulink models
% from DATA folder

%in power of project structure DATA always
%is in the same folder with model
dataFolder = [project_path '\DATA'];

mask = '\*.*';

%get list of all files and folders
d = dir([dataFolder mask]);

nfiles = length(d);

%load all files in folder
for k = 1:nfiles
    
    %take file extension
    [ans name ext] = fileparts(d(k).name);
    
    
    disp([name ext])
    
    %if file is script (.m) then run it
    %if file is data file (.mat) then load it
    if strcmp(ext,'.m')
        %use evalin instead of run or load becouse
        %becouse there is fucking magic with it!!!
        evalin('base', name);
    elseif strcmp(ext,'.mat')
        command = ['load(' ''''  name ext '''' ')'];
        evalin('base',command);
    elseif strcmp(ext,'.')||strcmp(ext,'..')
        continue
    else
        disp([name ext ' :unknown format'])
        continue
    end
end

%remove DATA folder to path
end

