function [M, Mx, My] = convectionUpwindTerm2D(MeshStructure, u)
% This function uses the upwind scheme to discretize a 2D
% convection term in the form \grad (u \phi) where u is a face vactor
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
Nxy = MeshStructure.numberofcells;
Nx = Nxy(1); Ny = Nxy(2);
dxdy = MeshStructure.cellsize;
dx = dxdy(1); dy = dxdy(2);

% define the vectors to stores the sparse matrix data
iix = zeros(3*(Nx+2)*(Ny+2),1);	iiy = zeros(3*(Nx+2)*(Ny+2),1);
jjx = zeros(3*(Nx+2)*(Ny+2),1);	jjy = zeros(3*(Nx+2)*(Ny+2),1);
sx = zeros(3*(Nx+2)*(Ny+2),1);	sy = zeros(3*(Nx+2)*(Ny+2),1);
mnx = Nx*Ny;	mny = Nx*Ny;

% extract the velocity data 
% note: size(ux) = [1:m+1, 1:n] and size(uy) = [1:m, 1:n+1]
ux = u.xvalue;
uy = u.yvalue;

% reassign the east, west, north, and south velocity vectors for the 
% code readability
ue = ux(2:Nx+1,:);		uw = ux(1:Nx,:);
vn = uy(:,2:Ny+1);       vs = uy(:,1:Ny);

% find the velocity direction for the upwind scheme
ue_min = min(ue,0);	ue_max = max(ue,0);
uw_min = min(uw,0);	uw_max = max(uw,0);
vn_min = min(vn,0);	vn_max = max(vn,0);
vs_min = min(vs,0);	vs_max = max(vs,0);

% calculate the coefficients for the internal cells
AE = ue_min/dx;
AW = -uw_max/dx;
AN = vn_min/dy;
AS = -vs_max/dy;
APx = (ue_max-uw_min)/dx;
APy = (vn_max-vs_min)/dy;

% Also correct for the boundary cells (not the ghost cells)
% Left boundary:
APx(1,:) = APx(1,:)-uw_max(1,:)/(2*dx);   AW(1,:) = AW(1,:)/2;
% Right boundary:
AE(end,:) = AE(end,:)/2;    APx(end,:) = APx(end,:) + ue_min(end,:)/(2*dx);
% Bottom boundary:
APy(:,1) = APy(:,1)-vs_max(:,1)/(2*dy);   AS(:,1) = AS(:,1)/2;
% Top boundary:
AN(:,end) = AN(:,end)/2;    APy(:,end) = APy(:,end) + vn_min(:,end)/(2*dy);

AE = reshape(AE,mnx,1);
AW = reshape(AW,mnx,1);
AN = reshape(AN,mny,1);
AS = reshape(AS,mny,1);
APx = reshape(APx,mnx,1);
APy = reshape(APy,mny,1);

% build the sparse matrix based on the numbering system
rowx_index = reshape(G(2:Nx+1,2:Ny+1),mnx,1); % main diagonal x
iix(1:3*mnx) = repmat(rowx_index,3,1);
rowy_index = reshape(G(2:Nx+1,2:Ny+1),mny,1); % main diagonal y
iiy(1:3*mny) = repmat(rowy_index,3,1);
jjx(1:3*mnx) = [reshape(G(1:Nx,2:Ny+1),mnx,1); reshape(G(2:Nx+1,2:Ny+1),mnx,1); reshape(G(3:Nx+2,2:Ny+1),mnx,1)];
jjy(1:3*mny) = [reshape(G(2:Nx+1,1:Ny),mny,1); reshape(G(2:Nx+1,2:Ny+1),mny,1); reshape(G(2:Nx+1,3:Ny+2),mny,1)];
sx(1:3*mnx) = [AW; APx; AE];
sy(1:3*mny) = [AS; APy; AN];

% build the sparse matrix
kx = 3*mnx;
ky = 3*mny;
Mx = sparse(iix(1:kx), jjx(1:kx), sx(1:kx), (Nx+2)*(Ny+2), (Nx+2)*(Ny+2));
My = sparse(iiy(1:ky), jjy(1:ky), sy(1:ky), (Nx+2)*(Ny+2), (Nx+2)*(Ny+2));
M = Mx + My;
