% Plot the lookup table results for ssc_lithium_cell_1RC_estim.mdl
% 
% Copyright 2012 The MathWorks, Inc.

% Em
figure(1)
set(gcf,'WindowStyle','docked');
plot(SOC_LUT,Em)
title('Em (OCV) vs SOC'); xlabel('SOC'); ylabel('Voltage')

% R0
figure(2)
set(gcf,'WindowStyle','docked');
plot(SOC_LUT,R0)
title('R0 Resistance vs SOC'); xlabel('SOC'); ylabel('Resistance')

% R1
figure(3)
set(gcf,'WindowStyle','docked');
plot(SOC_LUT,R1)
title('R1 Resistance vs SOC'); xlabel('SOC'); ylabel('Resistance')

% R2
figure(4)
set(gcf,'WindowStyle','docked');
plot(SOC_LUT,C1)
title('C1 Capacitance vs SOC'); xlabel('SOC'); ylabel('Capacitance')