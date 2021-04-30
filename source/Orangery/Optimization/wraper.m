function Energy = wraper(alpha)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
 mdl = 'SimpleGeomMdlGreenHouseOptimization';
 
 StartTimeSimulation = 0;
 EndTimeSimulation = 17518/2;
 run('WeatherData.m');
 
 %%array format - in cinfiguration set data import/export in
 %% inputData set [time, inputSignal]
%  time = (1:8759)';
%  inputSignal = [zeros(1,8759)+alpha(1); zeros(1,8759)+alpha(2);...
%                zeros(1,8759)+alpha(3) ;zeros(1,8759)+alpha(4)]';

%%Structure with time format
%% in field of importData set - inputSignal
 inputSignal.time = 0:8758;
 inputSignal.signals(1).values = zeros(8759,1)+alpha(1);
 inputSignal.signals(1).dimensions = 1;
 inputSignal.signals(2).values = zeros(8759,1)+alpha(2);
 inputSignal.signals(2).dimensions=1;
 inputSignal.signals(3).values = zeros(8759,1)+alpha(3);
 inputSignal.signals(3).dimensions=1;
 inputSignal.signals(4).values = zeros(8759,1)+alpha(4);
 inputSignal.signals(4).dimensions=1;
 
 simOut = sim(mdl,'SrcWorkspace','current');
 yout = get(simOut,'yout');
 Energy = -yout.signals.values(end);
 
end

