% a tutorial adapted from the fipy diffusion 1D example
% see: http://www.ctcms.nist.gov/fipy/examples/diffusion/index.html

clc
clear

%% define the domain
L = 5;  % domain length
Nx = 1000; % number of cells
meshstruct = buildMesh1D(Nx, L);
BC = createBC(meshstruct); % all Neumann boundary condition structure
BC.left.a = 0; BC.left.b=1; BC.left.c=1; % left boundary
BC.right.a = 0; BC.right.b=1; BC.right.c=0; % right boundary
x = meshstruct.cellcenters.x;
%% define the transfer coeffs
D_val = 1;
alfa = createCellVariable(meshstruct, 1);
Dave = createFaceVariable(meshstruct, D_val);
%% define initial values
c.Old = createCellVariable(meshstruct, 0); % initial values
c.value = c.Old;
%% loop
dt = 0.00001; % time step
final_t = 100;
for t=dt:dt:final_t
    % step 1: calculate ghost cell values
    ctemp = cellBoundary(meshstruct, BC, c.Old);
    % step 2: calculate divergence term
    RHS = divergenceTerm(meshstruct, Dave.*gradientTerm(meshstruct, ctemp));
    % step 3: calculate the new value for internal cells
    c.value = dt*excludeGhostRHS(meshstruct, RHS+sourceExplicitTerm(meshstruct, c.Old))+c.Old(:);
    c_analytical = 1-erf(x/(2*sqrt(D_val*t)));
    figure(1);plot(x, c.value, x, c_analytical, '--');
    c.Old = c.value;
    disp(t)
end