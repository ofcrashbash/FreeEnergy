model Orangery
  //WeatherData Inputs
  input Modelica.SIunits.Irradiance DNI[3];
  input Modelica.SIunits.Irradiance DHI;
  input Modelica.SIunits.Irradiance GHI;
  input Modelica.SIunits.Temperature DryTemp, WetTemp;
  input Real Humidity;
  input Modelica.SIunits.Velocity WindSpeed;
  input Real WindDir;
  //Output State variables
  output Modelica.SIunits.Temperature Temp;
  //output Real Test;
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature AmbientTemperatureSource annotation(Placement(visible = true, transformation(origin = {-389.315, 195}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Modelica.SIunits.Area S1[3] = {0, 0, 0} "Wall aboveground -  back" annotation(Dialog(tab = "Surface", group = "Parameters"));
  parameter Modelica.SIunits.Area S2[3] = {0, 0, 0} "Wall aboveground -  east" annotation(Dialog(tab = "Surface", group = "Parameters"));
  parameter Modelica.SIunits.Area S3[3] = {0, 0, 0} "Wall aboveground -  west" annotation(Dialog(tab = "Surface", group = "Parameters"));
  parameter Modelica.SIunits.Area S4[3] = {0, 0, 0} "Wall aboveground -  front" annotation(Dialog(tab = "Surface", group = "Parameters"));
  parameter Modelica.SIunits.Area S5[3] = {0, 0, 0} "Side glasses -  back" annotation(Dialog(tab = "Surface", group = "Parameters"));
  parameter Modelica.SIunits.Area S6[3] = {0, 0, 0} "Side glasses - east" annotation(Dialog(tab = "Surface", group = "Parameters"));
  parameter Modelica.SIunits.Area S7[3] = {0, 0, 0} "Side glasses - west side" annotation(Dialog(tab = "Surface", group = "Parameters"));
  parameter Modelica.SIunits.Area S8[3] = {0, 0, 0} "Side glasses - front side" annotation(Dialog(tab = "Surface", group = "Parameters"));
  parameter Modelica.SIunits.Area S9[3] = {0, 0, 0} "Roof Front" annotation(Dialog(tab = "Surface", group = "Parameters"));
  parameter Modelica.SIunits.Area S10[3] = {0, 0, 0} "Roof Back" annotation(Dialog(tab = "Surface", group = "Parameters"));
  parameter Modelica.SIunits.Area S11[3] = {0, 0, 0} "Roof Back Glass" annotation(Dialog(tab = "Surface", group = "Parameters"));
  parameter Modelica.SIunits.Area Sg1 = 0 "Wall undeground" annotation(Dialog(tab = "Surface", group = "Underground Surface"));
  parameter Modelica.SIunits.Area Sg2 = 0 "Floor" annotation(Dialog(tab = "Surface", group = "Underground Surface"));
  parameter Modelica.SIunits.Volume V1 = 0 "Volume of whole orangery" annotation(Dialog(tab = "Surface", group = "Volumes"));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G = sqrt(S1 * S1) * 0.2) annotation(Placement(visible = true, transformation(origin = {-200, 195}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C = V1 * 1000, T.fixed = true, der_T.fixed = false, T.start = -5) annotation(Placement(visible = true, transformation(origin = {-134.913, 140}, extent = {{-10, -10}, {10, 10}}, rotation = -180)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation(Placement(visible = true, transformation(origin = {-99.913, 195}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(Placement(visible = true, transformation(origin = {-240, 195}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Sqrt sqrt1 annotation(Placement(visible = true, transformation(origin = {-350, 227.592}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = 2.537 * 0.75 * sqrt(4 / sqrt(S1 * S1))) annotation(Placement(visible = true, transformation(origin = {-316.533, 227.944}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(Placement(visible = true, transformation(origin = {-230, 156.874}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain WindSpeedSource(k = 1) annotation(Placement(visible = true, transformation(origin = {-387.883, 227.592}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain DHISource(k = 1) annotation(Placement(visible = true, transformation(origin = {-390, 125}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.MatrixGain DNISource(K = [1, 0, 0; 0, 1, 0; 0, 0, 1], nin = 3, nout = 3) annotation(Placement(visible = true, transformation(origin = {-390, 157.194}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.MatrixGain matrixGain(nin = 3, nout = 1, K = array(S1) * 0.1) annotation(Placement(visible = true, transformation(origin = {-345, 157.163}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Abs abs1 annotation(Placement(visible = true, transformation(origin = {-313.397, 156.603}, extent = {{-6.603, -6.603}, {6.603, 6.603}}, rotation = 0)));
  Modelica.Blocks.Math.Gain WindDirectionSource(k = Modelica.Constants.pi / 180) annotation(Placement(visible = true, transformation(origin = {-386.997, 260}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(gain.y, convection.Gc) annotation(Line(visible = true, origin = {-261.844, 220.296}, points = {{-43.689, 7.648}, {21.844, 7.648}, {21.844, -15.296}}, color = {0, 0, 127}));
  connect(abs1.y, prescribedHeatFlow.Q_flow) annotation(Line(visible = true, origin = {-258.033, 156.739}, points = {{-48.1, -0.136}, {15.033, -0.136}, {15.033, 0.135}, {18.033, 0.135}}, color = {0, 0, 127}));
  connect(matrixGain.y[1], abs1.u) annotation(Line(visible = true, origin = {-325.99, 156.883}, points = {{-8.01, 0.28}, {1.67, 0.28}, {1.67, -0.28}, {4.67, -0.28}}, color = {0, 0, 127}));
  connect(DNISource.y[:], matrixGain.u[:]) annotation(Line(visible = true, origin = {-364, 157.178}, points = {{-15, 0.016}, {4, 0.016}, {4, -0.016}, {7, -0.016}}, color = {0, 0, 127}));
  connect(WindSpeedSource.y, sqrt1.u) annotation(Line(visible = true, origin = {-369.442, 227.592}, points = {{-7.442, 0}, {7.442, 0}}, color = {0, 0, 127}));
  connect(prescribedHeatFlow.port, thermalConductor.port_a) annotation(Line(visible = true, origin = {-214, 175.937}, points = {{-6, -19.063}, {1, -19.063}, {1, 19.063}, {4, 19.063}}, color = {191, 0, 0}));
  connect(sqrt1.y, gain.u) annotation(Line(visible = true, origin = {-332.65, 227.768}, points = {{-6.35, -0.176}, {1.117, -0.176}, {1.117, 0.176}, {4.117, 0.176}}, color = {0, 0, 127}));
  connect(convection.fluid, thermalConductor.port_a) annotation(Line(visible = true, origin = {-220, 195}, points = {{-10, 0}, {10, 0}}, color = {191, 0, 0}));
  connect(AmbientTemperatureSource.port, convection.solid) annotation(Line(visible = true, origin = {-314.658, 195}, points = {{-64.657, 0}, {64.658, 0}}, color = {191, 0, 0}));
  connect(temperatureSensor.port, heatCapacitor.port) annotation(Line(visible = true, origin = {-126.58, 180}, points = {{16.667, 15}, {-8.333, 15}, {-8.333, -30}}, color = {191, 0, 0}));
  connect(thermalConductor.port_b, heatCapacitor.port) annotation(Line(visible = true, origin = {-153.275, 180}, points = {{-36.725, 15}, {18.362, 15}, {18.362, -30}}, color = {191, 0, 0}));
  //Input connections
  connect(DryTemp, AmbientTemperatureSource.T);
  connect(WindSpeed, WindSpeedSource.u);
  connect(WindDir, WindDirectionSource.u);
  connect(DNI, DNISource.u);
  connect(DHI, DHISource.u);
  //Output Connections
  connect(temperatureSensor.T, Temp);
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10})), Diagram(coordinateSystem(extent = {{-420.5, -297}, {420.5, 297}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Orangery;