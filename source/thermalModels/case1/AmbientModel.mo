model AmbientModel "House and environment simulation model"
  Modelica.Blocks.Sources.Sine ambient_temperature(amplitude = 5, freqHz = 1 / 24 / 3600, offset = 15) "day and night temperature wariations" annotation(Placement(visible = true, transformation(origin = {-115, 5}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Noise.UniformNoise wind_random(y_min = 3, y_max = 6, samplePeriod = 600) "some random ambient wind" annotation(Placement(visible = true, transformation(origin = {-116.569, 42.129}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HouseCase1Model houseCase1Model annotation(Placement(visible = true, transformation(origin = {21.113, -8.887}, extent = {{-81.113, -81.113}, {81.113, 81.113}}, rotation = 0)));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed annotation(Placement(visible = true, transformation(origin = {-115, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(houseCase1Model.atmospheric_wind_speed, wind_random.y) annotation(Line(visible = true, origin = {-92.199, 41.727}, points = {{34.111, -0.401}, {-10.37, -0.401}, {-10.37, 0.401}, {-13.37, 0.401}}, color = {1, 37, 163}));
  connect(ambient_temperature.y, houseCase1Model.atmospheric_temperature) annotation(Line(visible = true, origin = {-72.022, 5.782}, points = {{-31.978, -0.782}, {9.022, -0.782}, {9.022, 0.782}, {13.934, 0.782}}, color = {1, 37, 163}));
  annotation(experiment(StopTime = 432000, Interval = 600, __Wolfram_Algorithm = "rk4"), Diagram(coordinateSystem(extent = {{-148.5, -105}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end AmbientModel;
