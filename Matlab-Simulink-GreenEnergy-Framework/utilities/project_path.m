function projectRoot = project_path()
%PROJECT_PATH returns path to simulink project
try
project = simulinkproject;
projectRoot = project.RootFolder;
catch
    disp('error to evaluate project path')
end
end

