function set_up_project()
%set_up_project  Configure the environment for this project
%
%   Set up the environment for the current project. This function is set to
%   Run at Startup.

%   Copyright 2011-2014 The MathWorks, Inc.



% Set the location of slprj to be the "work" folder of the current project:
myCacheFolder = fullfile(project_path, '_work');
if ~exist(myCacheFolder, 'dir')
    mkdir(myCacheFolder)
end
Simulink.fileGenControl('set', 'CacheFolder', myCacheFolder, ...
   'CodeGenFolder', myCacheFolder);

% add path to project folders
temp = paths_project();
for i=1:length(temp)
    addpath([project_path temp{i}]);
end

%load common data to all models
project_preload;

end