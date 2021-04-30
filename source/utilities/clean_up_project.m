function clean_up_project()
%clean_up_project   Clean up local customizations of the environment
% 
%   Clean up the environment for the current project. This function undoes
%   the settings applied in "set_up_project". It is set to Run at Shutdown.

%   Copyright 2011-2014 The MathWorks, Inc.

% Use Simulink Project API to get the current project:


% Reset the location where generated code and other temporary files are
% created (slprj) to the default:
Simulink.fileGenControl('reset');

% remove project folders paths
rmpath(genpath(project_path));

evalin('base','clear');
evalin('base','clc');
end
