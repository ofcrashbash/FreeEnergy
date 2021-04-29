model test
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {76, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {76, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Sine sine annotation(
    Placement(visible = true, transformation(origin = {-82, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(sine.y, y) annotation(
    Line(points = {{-70, 44}, {76, 44}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "3.2.3")),
    Diagram);
end test;
