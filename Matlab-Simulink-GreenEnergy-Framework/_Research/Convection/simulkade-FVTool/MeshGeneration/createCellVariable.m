function cellvar = createCellVariable(MeshStructure, cellval, varargin)
% cellvar = createCellVariable(MeshStructure, cellval)
% cellvar = createCellVariable(MeshStructure, cellval, BC)
% this function creates a cell variable based on the dimension of the
% problem. The cell variable does not include the ghost cells, unless 
% the boundary condition is supplied as an input. The value of
% the ghost cells can be added to the cell variable using the 
% cellBoundary function or by supplying the BC structure as the third
% argument of this function.
% SYNOPSIS:
%   cellvar = createCellVariable(MeshStructure, cellval)
%   cellvar = createCellVariable(MeshStructure, cellval, BC)
% 
% PARAMETERS:
%   MeshStructure: a mesh structure created by buildMesh* functions
%   cellValue: the value that will be assigned to the internal cells
%   BC (optional): boundary condition structure created by createBC
%   function
% 
% RETURNS:
%   cellvar: a (1D, 2D, or 3D) matrix depending on the mesh size
% 
% EXAMPLE:
%   m = buildMesh2D(3,4, 1.0, 2.0); % creates a mesh
%   bc = createBC(m); % creates a Neumann boundary condition
%   phi_val = 2.0; % value to be assigned to all cells
%   phi = createCellVariable(m, phi_val); % value assigned to the internal cells
%   phi_with_ghost = createCellVariable(m, phi_val, bc); % value assigned to the internal and ghost cells
%
% SEE ALSO:
%     createFaceVariable, createBC, buildMesh1D, 
%     buildMesh2D, buildMesh3D, 
%     buildMeshCylindrical1D, buildMeshCylindrical2D,
%     cellBoundary, combineBC

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

% check the size of the variable and the mesh dimension
d = MeshStructure.dimension;
mn = MeshStructure.numberofcells;

if (d ==1) || (d==1.5)
	cellvar = cellval.*ones(mn, 1);
elseif (d == 2) || (d == 2.5) || (d == 2.8)
	cellvar = cellval.*ones(mn(1), mn(2));
elseif (d == 3) || (d==3.2)
    cellvar = cellval.*ones(mn(1), mn(2), mn(3));
end

if nargin == 3
    cellvar = cellBoundary(MeshStructure, varargin{1}, cellvar);
end