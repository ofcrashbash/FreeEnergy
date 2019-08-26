Copyright (c) 2012-2013, The MathWorks, Inc.

DESCRIPTION
-----------------------
This file contains multi-temperature lithium battery model examples with thermal dynamics that are implemented using the Simscape language.  There are equivalent circuit model examples containing 1 RC branch and 2 RC branches, plus an 80-cell battery pack model. The number of branches can be chosen to balance fidelity and parameter estimation complexity.  These models are implemented using Simulink and Simscape language.

This file also contains an example that uses Simulink Design Optimization.  This demo shows how you can use the parameter estimation tool to optimize parameters to match measured battery data.  


REQUIRED PRODUCTS
-----------------------
R2010b or later required, recommend R2012a or later

  MATLAB
  Simulink
  Simscape

For Parameter Estimation:

  Simulink Design Optimization
  Optimization Toolbox
  Parallel Computing Toolbox (recommended).  


DIRECTIONS TO USE THESE MODELS
-----------------------
After unzipping the files, browse to the folder relevant for your release of MATLAB. R2012a or later is recommended due to the tablelookup function in Simscape language, allowing a cleaner and simpler model.

Before using these models, you will need to build the Simscape library "LiBatteryElements":

1. Run "mex -setup" at the MATLAB command prompt and select a supported compiler.
2. Run "ssc_build LiBatteryElements" at the command prompt to build the required Simscape library

The demo models are as follows:

ssc_lithium_cell_1RC.mdl - This model implements a lithium cell equivalent circuit using one parallel RC branch.  This model automatically loads the parameter values stored in the file "ssc_lithium_cell_1RC_ini.m".  You can change between pulse discharge and constant current input signals using the Signal builder block.  (Note: This is a shipping Simscape demo starting in R2012b.)

ssc_lithium_cell_2RC.mdl - This model implements a lithium cell equivalent circuit using two parallel RC branches.  This model automatically loads the parameter values stored in the file "ssc_lithium_cell_2RC_ini.m".  You can change between pulse discharge and constant current input signals using the Signal builder block.  (Note: This is a shipping Simscape demo starting in R2012b.)

ssc_lithium_cell_1RC_estim.mdl - This model is set up for parameter estimation using Simulink Design Optimization.  This model automatically loads the parameter values stored in the file "ssc_lithium_cell_1RC_estim_ini.m".  To perform the parameter estimation, double-click on the orange block in the model to load the SDO parameter estimation project.  To start the estimation, browse to the "Project/Estimation Task/Estimation/One Temp Estim" in the tree, select the "Estimation" tab on the right pane, and then click "Start".  If you have Parallel Computing Toolbox, you can optionally speed up the estimation by:
1. Issue the command "matlabpool" at the command line to start the workers.
2. Turning on parallel computing in the Estimation Options button of the Estimation tab.

ssc_lithium_battery_80Cells.mdl - This model is a battery pack containing 80 prismatic cells organized into stacks of 8 cells each.

ssc_lithium_battery_1CellMultiplied.mdl - This model contains just one cell, but output voltage is multiplied to behave like a battery pack.


ISSUES
-----------------------
R2013a only: In the demo ssc_lithium_cell_1RC_estim.slx, there is a bug in R2013a related to the estimation if you have opened the saved estimation project by clicking on the blue block.  You need to click the variables tab and then the estimation tab again before running the estimation to avoid an error dialog.


RELATED MATERIALS
-----------------------
To see the parameter estimation tasks, watch this video (5 min):
http://www.mathworks.com/products/demos/simscape/estimating-parameters-of-a-battery/index.html

For more information you may also see these recorded webinars: 

“Lithium Battery Model with Thermal Effects for System-Level Analysis”
http://www.mathworks.com/company/events/webinars/wbnr65376.html

"Developing Accurate Battery Simulation Models"
http://www.mathworks.com/company/events/webinars/wbnr37544.html

The equivalent circuit model of a lithium cell is described in this IEEE paper:
IEEE 2012: High Fidelity Lithium Battery Model with Thermal Effect
http://www.mathworks.com/tagteam/71900_IEEE%202012%20High%20Fidelity%20Lithium%20Battery%20Model%20with%20Thermal%20Effect.pdf

Complete parameter estimation of the model to match multi-temperature and multi-current data is a complex task that can also be mostly automated using Simulink Design Optimization.  For coaching on this topic, please contact MathWorks Consulting Services:
http://www.mathworks.com/services/consulting/

To find other physical modeling examples, search for posts with the keyword "physical modeling" 
http://www.mathworks.com/matlabcentral/fileexchange/?term=%22physical+modeling%22

To learn more about MathWorks Physical Modeling Products, go to:
http://www.mathworks.com/physical-modeling/