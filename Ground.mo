model Ground "Modeling heat conduction in a rod using a for loop"
  type TLenght = Modelica.SIunits.Length;
  type TArea = Modelica.SIunits.Area;
  type TVolume = Modelica.SIunits.Volume;
  type TDensity = Modelica.SIunits.Density;
  type TCoefficientOfHeatTransfer = Modelica.SIunits.CoefficientOfHeatTransfer;
  type TThermalConductivity = Modelica.SIunits.ThermalConductivity;
  type THeatCapacity = Modelica.SIunits.HeatCapacity;
  type TTemperature = Modelica.SIunits.Temperature;
  type TPower = Modelica.SIunits.Power;
  parameter Integer n = 2 "Mesh number on edge of cube";
  parameter Integer range[n] = 1:n;
  parameter TLenght L = 100 "Lenght of cube edge";
  parameter TLenght dL = L / n "Lenght of mesh edge";
  parameter TArea S = L ^ 2 "Surface of one side of whole ground cube";
  parameter TArea dS = dL ^ 2 "Surface of one side mesh cube";
  parameter TVolume V = L ^ 3 "Volume of a whole ground cube";
  parameter TVolume dV = dL ^ 3 "Volume of a mesh cube";
  parameter TDensity rho = 2.0 "Density of ground";
  parameter TCoefficientOfHeatTransfer h = 2.0 "Heat transfer coeficient between ground and atmosphere";
  parameter TThermalConductivity cond = 10 "Thermal conductivity of ground";
  parameter THeatCapacity C = 10.0;
  parameter TTemperature Tamb = 300 "Ambient temperature";
  parameter TTemperature Tearth = 300 "Ambient temperature";
  parameter TPower Qearth = 1.5 "Power from earth";
  TTemperature T[n, n, n];
  TPower Qleft[n, n, n];
  TPower Qright[n, n, n];
  TPower Qfront[n, n, n];
  TPower Qback[n, n, n];
  TPower Qtop[n, n, n];
  TPower Qbottom[n, n, n];
initial equation
  T = fill(5, n, n, n);
equation
  Qfront = array(array(array(if i == 1 then 0 else -cond * (T[i, j, k] - T[i - 1, j, k]) for i in range) for j in range) for k in range);
  Qback = array(array(array(if i == n then 0 else -cond * (T[i, j, k] - T[i + 1, j, k]) for i in range) for j in range) for k in range);
  Qleft = array(array(array(if j == 1 then 0 else -cond * (T[i, j, k] - T[i, j - 1, k]) for i in range) for j in range) for k in range);
  Qright = array(array(array(if j == n then 0 else -cond * (T[i, j, k] - T[i, j + 1, k]) for i in range) for j in range) for k in range);
  Qtop = array(array(array(if k == 1 then -h * (T[i, j, k] - Tamb) else -cond * (T[i, j, k] - T[i, j, k - 1]) for i in range) for j in range) for k in range);
  Qbottom = array(array(array(if k == n then Qearth else -cond * (T[i, j, k] - T[i, j, k + 1]) for i in range) for j in range) for k in range);
  rho * dV * C * der(T) = Qfront + Qback + Qleft + Qright + Qtop + Qbottom;
end Ground;