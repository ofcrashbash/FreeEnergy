package GreenEnergy
  package WeatherDataConnectors
    connector DHI
      input Modelica.SIunits.Irradiance DHI;
      annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-2.184, -2.719}, extent = {{-62.184, -52.719}, {62.184, 52.719}}, textString = "DHI")}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-5.344, 7.281}, extent = {{-62.184, -52.719}, {62.184, 52.719}}, textString = "DHI")}));
    end DHI;

    connector DNI "dirrect horizontal irradiance"
      input Modelica.SIunits.Irradiance DNI[3];
      annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-2.3, -2.184}, extent = {{-75.93600000000001, -72.184}, {75.93600000000001, 72.184}}, textString = "DNI")}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-4.064, 7.816}, extent = {{-75.93600000000001, -72.184}, {75.93600000000001, 72.184}}, textString = "DNI")}));
    end DNI;

    connector GHI "dirrect horizontal irradiance"
      input Modelica.SIunits.Irradiance GHI;
      annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-2.3, -2.184}, extent = {{-75.93600000000001, -72.184}, {75.93600000000001, 72.184}}, textString = "GHI")}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-4.064, 7.816}, extent = {{-75.93600000000001, -72.184}, {75.93600000000001, 72.184}}, textString = "GHI")}));
    end GHI;

    connector WetTemp "dirrect horizontal irradiance"
      input Modelica.SIunits.Temperature WetTemp;
      annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-2.3, -2.184}, extent = {{-75.93600000000001, -72.184}, {75.93600000000001, 72.184}}, textString = "WetTemp")}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-4.064, 7.816}, extent = {{-75.93600000000001, -72.184}, {75.93600000000001, 72.184}}, textString = "WetTemp")}));
    end WetTemp;

    connector Humidity = input Real "dirrect horizontal irradiance" annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-2.3, -2.184}, extent = {{-75.93600000000001, -72.184}, {75.93600000000001, 72.184}}, textString = "Humidity")}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-4.064, 7.816}, extent = {{-75.93600000000001, -72.184}, {75.93600000000001, 72.184}}, textString = "Humidity")}));

    connector DryTemp "dirrect horizontal irradiance"
      input Modelica.SIunits.Temperature DryTemp;
      annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-2.3, -2.184}, extent = {{-75.93600000000001, -72.184}, {75.93600000000001, 72.184}}, textString = "DryTemp")}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-4.064, 7.816}, extent = {{-75.93600000000001, -72.184}, {75.93600000000001, 72.184}}, textString = "DryTemp")}));
    end DryTemp;

    connector WindSpeed "dirrect horizontal irradiance"
      input Modelica.SIunits.Velocity WindSpeed;
      annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-2.3, -2.184}, extent = {{-75.93600000000001, -72.184}, {75.93600000000001, 72.184}}, textString = "WindSpeed")}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-4.064, 7.816}, extent = {{-75.93600000000001, -72.184}, {75.93600000000001, 72.184}}, textString = "WindSpeed")}));
    end WindSpeed;

    connector WindDir "dirrect horizontal irradiance"
      input Real WindDir;
      annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-2.3, -2.184}, extent = {{-75.93600000000001, -72.184}, {75.93600000000001, 72.184}}, textString = "WindDir")}), Diagram(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Text(visible = true, origin = {-4.064, 7.816}, extent = {{-75.93600000000001, -72.184}, {75.93600000000001, 72.184}}, textString = "WindDir")}));
    end WindDir;
    annotation(Diagram(coordinateSystem(extent = {{-248.5, -205}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
  end WeatherDataConnectors;
  annotation(Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = true, initialScale = 0.1, grid = {10, 10}), graphics = {Rectangle(visible = true, origin = {-0.22, 1.01}, fillColor = {0, 255, 0}, fillPattern = FillPattern.Solid, extent = {{-84.005, -81.01000000000001}, {84.005, 81.01000000000001}})}), Diagram(coordinateSystem(extent = {{-248.5, -205}, {148.5, 105}}, preserveAspectRatio = true, initialScale = 0.1, grid = {5, 5})));
end GreenEnergy;