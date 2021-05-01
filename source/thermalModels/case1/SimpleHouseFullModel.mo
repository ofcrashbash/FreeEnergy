model SimpleHouseFullModel
  Modelica.Blocks.Sources.Sine ambient_temperature(amplitude = 5, freqHz = 1 / 24 / 3600, offset = 15) annotation(
    Placement(visible = true, transformation(origin = {-114.666, 17}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation(
    Placement(visible = true, transformation(origin = {-39, 17}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(
    Placement(visible = true, transformation(origin = {-9, 17}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G = 1)  annotation(
    Placement(visible = true, transformation(origin = {22, 17}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C = 10, T(displayUnit = "degC", start = 288.032))  annotation(
    Placement(visible = true, transformation(origin = {41, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = 1)  annotation(
    Placement(visible = true, transformation(origin = {70, 17}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection1 annotation(
    Placement(visible = true, transformation(origin = {115, 17}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(C = 100, T(displayUnit = "degC", start = 288.032))  annotation(
    Placement(visible = true, transformation(origin = {150, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant const(k = 0.001)  annotation(
    Placement(visible = true, transformation(origin = {-45, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.ToKelvin toKelvin1 annotation(
    Placement(visible = true, transformation(origin = {-73, 17}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(prescribedTemperature.port, convection.solid) annotation(
    Line(points = {{-29, 17}, {-19, 17}}, color = {191, 0, 0}));
  connect(convection.fluid, thermalConductor.port_a) annotation(
    Line(points = {{1, 17}, {12, 17}}, color = {191, 0, 0}));
  connect(thermalConductor.port_b, heatCapacitor.port) annotation(
    Line(points = {{32, 17}, {41, 17}, {41, -4}}, color = {191, 0, 0}));
  connect(thermalConductor1.port_a, heatCapacitor.port) annotation(
    Line(points = {{60, 17}, {41, 17}, {41, -4}}, color = {191, 0, 0}));
  connect(convection1.solid, thermalConductor1.port_b) annotation(
    Line(points = {{105, 17}, {80, 17}}, color = {191, 0, 0}));
  connect(convection1.fluid, heatCapacitor1.port) annotation(
    Line(points = {{125, 17}, {150, 17}, {150, -2}}, color = {191, 0, 0}));
  connect(convection.Gc, const.y) annotation(
    Line(points = {{-9, 27}, {-34, 27}, {-34, 74}}, color = {0, 0, 127}));
  connect(convection1.Gc, const.y) annotation(
    Line(points = {{115, 27}, {-34, 27}, {-34, 74}}, color = {0, 0, 127}));
  connect(toKelvin1.Celsius, ambient_temperature.y) annotation(
    Line(points = {{-85, 17}, {-104, 17}}, color = {0, 0, 127}));
  connect(prescribedTemperature.T, toKelvin1.Kelvin) annotation(
    Line(points = {{-51, 17}, {-62, 17}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(initialScale = 1, grid = {4, 4})),
    Diagram(coordinateSystem(grid = {1, 1})),
    uses(Modelica(version = "3.2.3")));
end SimpleHouseFullModel;
