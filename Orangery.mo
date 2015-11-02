model Orangery
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Air3(T.fixed = true, der_T.fixed = false, C = eps) annotation(Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -180)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Air2(C = eps, T.fixed = true, der_T.fixed = false) annotation(Placement(visible = true, transformation(origin = {5, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -180)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Air1(T.fixed = true, der_T.fixed = false, C = eps) annotation(Placement(visible = true, transformation(origin = {-20, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -180)));
  parameter Real eps = 1e-005;
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor Ground annotation(Placement(visible = true, transformation(origin = {57.699, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -180)));
  parameter Modelica.SIunits.Area Sg1 = eps "Area of ground surface #1";
  parameter Modelica.SIunits.Area Sg2 = eps "Area of ground surface #2";
  parameter Modelica.SIunits.Area S1[3] = eps "Area of side between enviroment #1";
  parameter Modelica.SIunits.Area S2[3] = eps "Area of side between enviroment #2";
  parameter Modelica.SIunits.Area S3[3] = eps "Area of side between enviroment #3";
  parameter Modelica.SIunits.Area S4[3] = eps "Area of side between enviroment #4";
  parameter Modelica.SIunits.Area S5[3] = eps "Area of side between enviroment #5";
  parameter Modelica.SIunits.Area S6[3] = eps "Area of side between enviroment #6";
  parameter Modelica.SIunits.Area S7[3] = eps "Area of side between enviroment #7";
  parameter Modelica.SIunits.Area S8[3] = eps "Area of side between enviroment #8";
  parameter Modelica.SIunits.Area S9[3] = eps "Area of side between enviroment #9";
  parameter Modelica.SIunits.Area S10[3] = eps "Area of side between enviroment #10";
  parameter Modelica.SIunits.Area S12[3] = eps "Area of side between enviroment #12";
  parameter Modelica.SIunits.Area S13[3] = eps "Area of side between enviroment #13";
  Modelica.Blocks.Interfaces.RealInput DNI annotation(Placement(visible = true, transformation(origin = {-148.236, 88.175}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-90.90900000000001, 4.762}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput DHI annotation(Placement(visible = true, transformation(origin = {-148.114, 61.614}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-94.276, -14.286}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput GHI annotation(Placement(visible = true, transformation(origin = {-148.019, 35}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-93.124, -33.333}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Humidity annotation(Placement(visible = true, transformation(origin = {-148.331, -42.164}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-94.276, 4.762}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput DryTemp annotation(Placement(visible = true, transformation(origin = {-148.167, 7.456}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-95.737, -23.81}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput WetTemp annotation(Placement(visible = true, transformation(origin = {-148.175, -17.667}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-94.276, -61.905}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput WindSpeed annotation(Placement(visible = true, transformation(origin = {-148.467, -70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-94.276, -73.243}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput WindDir annotation(Placement(visible = true, transformation(origin = {-148.175, -92.944}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-97.643, -95.238}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation

  annotation(experiment(StopTime = 1000000), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Orangery;