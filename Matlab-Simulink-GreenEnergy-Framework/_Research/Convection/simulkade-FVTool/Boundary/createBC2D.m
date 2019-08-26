function BC = createBC2D(MeshStructure)
% Creates a boundary condition structure from a mesh structure
% for a 2D mesh. The boundary conditions on all boundaries are Neumann;
% The index of each boundary condition is defined as:
%	1:	Dirichlet
%	2:	Neumann
%	3:	Mixed	
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

% Extract number of cells from the mesh structure
Nxy = MeshStructure.numberofcells;
Nx = Nxy(1); Ny = Nxy(2);

% Define the top, bottom, right, and left boundary conditions 
% (default = Neumann, i.e., a = 1, b = 0, c = 0)
BC.top.a = ones(Nx,1);
BC.top.b = zeros(Nx,1);
BC.top.c = zeros(Nx,1);
BC.top.periodic = 0;

BC.bottom.a = ones(Nx,1);
BC.bottom.b = zeros(Nx,1);
BC.bottom.c = zeros(Nx,1);
BC.bottom.periodic = 0;

BC.right.a = ones(1,Ny);
BC.right.b = zeros(1,Ny);
BC.right.c = zeros(1,Ny);
BC.right.periodic = 0;

BC.left.a = ones(1,Ny);
BC.left.b = zeros(1,Ny);
BC.left.c = zeros(1,Ny);
BC.left.periodic = 0;

