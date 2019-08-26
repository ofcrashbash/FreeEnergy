function strtime2csv( yout )
%SIM2MATH Exports yout strucutre with time of simulink model to csv file
    folder = '_Common';
    sz = size(yout.signals);
    for i = 1:sz(2)
        csvwrite(fullfile(project_path, folder, [yout.signals(i).label '.csv']),...
            [yout.time yout.signals(i).values]);
    end
end