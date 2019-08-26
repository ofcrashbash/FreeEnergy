function M = diffusionTermCylindrical1D(MeshStructure, D)
% This function uses the central difference scheme to discretize a 1D
% diffusion term in the form \grad . (D \grad \phi) where u is a face vactor
% It also returns the x and y parts of the matrix of coefficient.
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
Nr = MeshStructure.numberofcells;
dx = MeshStructure.cellsize;
rp = MeshStructure.cellcenters.x';
rf = MeshStructure.facecenters.x';

% define the vectors to store the sparse matrix data
iix = zeros(3*(Nr+2),1);
jjx = zeros(3*(Nr+2),1);
sx = zeros(3*(Nr+2),1);

% extract the velocity data 
% note: size(Dx) = [1:m+1, 1:n] and size(Dy) = [1:m, 1:n+1]
Dx = D.xvalue;

% reassign the east, west, north, and south velocity vectors for the 
% code readability
De = Dx(2:Nr+1);		Dw = Dx(1:Nr);
re = rf(2:Nr+1);     rw = rf(1:Nr);

% calculate the coefficients for the internal cells
AE = reshape(re.*De./(rp*dx^2),Nr,1);
AW = reshape(rw.*Dw./(rp*dx^2),Nr,1);
APx = reshape(-(re.*De+rw.*Dw)./(rp*dx^2),Nr,1);

% build the sparse matrix based on the numbering system
rowx_index = reshape(G(2:Nr+1),Nr,1); % main diagonal x
iix(1:3*Nr) = repmat(rowx_index,3,1);
jjx(1:3*Nr) = [reshape(G(1:Nr),Nr,1); reshape(G(2:Nr+1),Nr,1); reshape(G(3:Nr+2),Nr,1)];
sx(1:3*Nr) = [AW; APx; AE];

% build the sparse matrix
kx = 3*Nr;
M = sparse(iix(1:kx), jjx(1:kx), sx(1:kx), Nr+2, Nr+2);
