model Orangery "Contains all components to simulate orangery and its surrounding"
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G = 1) annotation(Placement(visible = true, transformation(origin = {-38.419, 11.604}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C = 10, T.fixed = true, der_T.fixed = false, T.start = 100) annotation(Placement(visible = true, transformation(origin = {-2.004, -13.229}, extent = {{-10, -10}, {10, 10}}, rotation = -180)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature annotation(Placement(visible = true, transformation(origin = {-85, 12.027}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(fixedTemperature.port, thermalConductor.port_a) annotation(Line(visible = true, origin = {-56.564, 11.815}, points = {{-18.436, 0.211}, {5.145, 0.211}, {5.145, -0.211}, {8.145, -0.211}}, color = {191, 0, 0}));
  connect(thermalConductor.port_b, heatCapacitor.port) annotation(Line(visible = true, origin = {-10.809, 6.659}, points = {{-17.609, 4.944}, {8.805, 4.944}, {8.805, -9.888}}, color = {191, 0, 0}));
  annotation(experiment(StartTime = 0, StopTime = 10, NumberOfIntervals = 2000, Algorithm = "dassl", Tolerance = 1e-006), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end Orangery;