function [BCMatrix, BCRHS] = boundaryCondition2D(MeshStructure, BC)
% It creates the matrix of coefficient based on the BC structureprovided 
% by the user. It also generates the right hand side vector of the linear
% system of equations
% 
% SYNOPSIS:
%   
% 
% PARAMETERS:
%   
% 
% RETURNS:
%   
% 
% EXAMPLE:
% 
% SEE ALSO:
%     

%{
Copyright (c) 2012, 2013, Ali Akbar Eftekhari
All rights reserved.

Redistribution and use in source and binary forms, with or 
without modification, are permitted provided that the following 
conditions are met:

    *   Redistributions of source code must retain the above copyright notice, 
        this list of conditions and the following disclaimer.
    *   Redistributions in binary form must reproduce the above 
        copyright notice, this list of conditions and the following 
        disclaimer in the documentation and/or other materials provided 
        with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, 
THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR 
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, 
OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS 
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
%}

% extract data from the mesh structure
G = MeshStructure.numbering;
Nxy = MeshStructure.numberofcells;
Nx = Nxy(1); Ny = Nxy(2);
dxdy = MeshStructure.cellsize;
dx = dxdy(1); dy = dxdy(2);

% number of boundary nodes:
nb = 2*(Nx+Ny+2);

% define the vectors to be used for the creation of the sparse matrix
ii = zeros(nb,1);
jj = zeros(nb,1);
s = zeros(nb,1);

% define the RHS column vector
BCRHS = zeros((Nx+2)*(Ny+2), 1);

% assign value to the corner nodes (useless cells)
q = 1:4;
ii(q) = MeshStructure.corner; jj(q) = MeshStructure.corner;
s(q) = max(BC.top.b/2 + BC.top.a/dy); BCRHS(MeshStructure.corner) = 0;

% Assign values to the boundary condition matrix and the RHS vector based
% on the BC structure

if (BC.top.periodic ==0) && (BC.bottom.periodic ==0)
    % top boundary
    j=Ny+2;
    i=2:Nx+1;
    q = q(end)+(1:Nx);
    ii(q) = G(i,j);  jj(q) = G(i,j);  s(q) = BC.top.b/2 + BC.top.a/dy;
    q = q(end)+(1:Nx);
    ii(q) = G(i,j);  jj(q) = G(i,j-1); s(q) = BC.top.b/2 - BC.top.a/dy;
    BCRHS(G(i,j)) = BC.top.c; 

    % Bottom boundary
    j=1;
    i=2:Nx+1;
    q = q(end)+(1:Nx);
    ii(q) = G(i,j);  jj(q) = G(i,j+1);  s(q) = -(BC.bottom.b/2 + BC.bottom.a/dy);
    q = q(end)+(1:Nx);
    ii(q) = G(i,j);  jj(q) = G(i,j); s(q) = -(BC.bottom.b/2 - BC.bottom.a/dy);
    BCRHS(G(i,j)) = -(BC.bottom.c);
elseif (BC.top.periodic ==1) || (BC.bottom.periodic ==1) % periodic boundary
    % top boundary
    j=Ny+2;
    i=2:Nx+1;
    q = q(end)+(1:Nx);
    ii(q) = G(i,j);  jj(q) = G(i,j);  s(q) = 1;
    q = q(end)+(1:Nx);
    ii(q) = G(i,j);  jj(q) = G(i,2); s(q) = -1;
    BCRHS(G(i,j)) = 0; 

    % Bottom boundary
    j=1;
    i=2:Nx+1;
    q = q(end)+(1:Nx);
    ii(q) = G(i,j);  jj(q) = G(i,j);  s(q) = 1;
    q = q(end)+(1:Nx);
    ii(q) = G(i,j);  jj(q) = G(i,Ny+1); s(q) = -1;
    BCRHS(G(i,j)) = 0;
end


if (BC.right.periodic == 0) && (BC.left.periodic == 0)
    % Right boundary
    i=Nx+2;
    j=2:Ny+1;
    q = q(end)+(1:Ny);
    ii(q) = G(i,j);  jj(q) = G(i,j);  s(q) = BC.right.b/2 + BC.right.a/dx;
    q = q(end)+(1:Ny);
    ii(q) = G(i,j);  jj(q) = G(i-1,j); s(q) = BC.right.b/2 - BC.right.a/dx;
    BCRHS(G(i,j)) = BC.right.c;

    % Left boundary
    i = 1;
    j=2:Ny+1;
    q = q(end)+(1:Ny);
    ii(q) = G(i,j);  jj(q) = G(i+1,j);  s(q) = -(BC.left.b/2 + BC.left.a/dx);
    q = q(end)+(1:Ny);
    ii(q) = G(i,j);  jj(q) = G(i,j); s(q) = -(BC.left.b/2 - BC.left.a/dx);
    BCRHS(G(i,j)) = -(BC.left.c);
elseif (BC.right.periodic == 1) || (BC.left.periodic == 1) % periodic boundary
    % Right boundary
    i=Nx+2;
    j=2:Ny+1;
    q = q(end)+(1:Ny);
    ii(q) = G(i,j);  jj(q) = G(i,j);  s(q) = 1;
    q = q(end)+(1:Ny);
    ii(q) = G(i,j);  jj(q) = G(2,j); s(q) = -1;
    BCRHS(G(i,j)) = 0;

    % Left boundary
    i = 1;
    j=2:Ny+1;
    q = q(end)+(1:Ny);
    ii(q) = G(i,j);  jj(q) = G(i,j);  s(q) = 1;
    q = q(end)+(1:Ny);
    ii(q) = G(i,j);  jj(q) = G(Nx+1,j); s(q) = -1;
    BCRHS(G(i,j)) = 0;
end
% Build the sparse matrix of the boundary conditions
BCMatrix = sparse(ii(1:q(end)), jj(1:q(end)), s(1:q(end)), ...
    (Nx+2)*(Ny+2), (Nx+2)*(Ny+2));