function [M, Mx, My, Mz] = convectionTermCylindrical3D(MeshStructure, u)
% This function uses the central difference scheme to discretize a 2D
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
Nxyz = MeshStructure.numberofcells;
Nr = Nxyz(1); Ntetta = Nxyz(2); Nz = Nxyz(3);
d = MeshStructure.cellsize;
dx = d(1); dtetta = d(2); dz = d(3);
rp = repmat(MeshStructure.cellcenters.x', 1, Ntetta, Nz);
rf = repmat(MeshStructure.facecenters.x', 1, Ntetta, Nz);

% define the vectors to stores the sparse matrix data
iix = zeros(3*(Nr+2)*(Ntetta+2)*(Nz+2),1);	
jjx = zeros(3*(Nr+2)*(Ntetta+2)*(Nz+2),1);	
sx = zeros(3*(Nr+2)*(Ntetta+2)*(Nz+2),1);	
iiy = zeros(3*(Nr+2)*(Ntetta+2)*(Nz+2),1);
jjy = zeros(3*(Nr+2)*(Ntetta+2)*(Nz+2),1);
sy = zeros(3*(Nr+2)*(Ntetta+2)*(Nz+2),1);
iiz = zeros(3*(Nr+2)*(Ntetta+2)*(Nz+2),1);
jjz = zeros(3*(Nr+2)*(Ntetta+2)*(Nz+2),1);
sz = zeros(3*(Nr+2)*(Ntetta+2)*(Nz+2),1);
mnx = Nr*Ntetta*Nz;	mny = Nr*Ntetta*Nz;   mnz = Nr*Ntetta*Nz;

% extract the velocity data 
% note: size(ux) = [1:m+1, 1:n] and size(uy) = [1:m, 1:n+1]
ux = u.xvalue;
uy = u.yvalue;
uz = u.zvalue;

% reassign the east, west, north, and south velocity vectors for the 
% code readability
ue = ux(2:Nr+1,:,:);		uw = ux(1:Nr,:,:);
vn = uy(:,2:Ntetta+1,:);     vs = uy(:,1:Ntetta,:);
wf = uz(:,:,2:Nz+1);     wb = uz(:,:,2:Nz+1);
re = rf(2:Nr+1,:,:);         rw = rf(1:Nr,:,:);

% calculate the coefficients for the internal cells
AE = reshape(re.*ue./(2*rp*dx),mnx,1);
AW = reshape(-rw.*uw./(2*rp*dx),mnx,1);
AN = reshape(vn./(2*dtetta*rp),mny,1);
AS = reshape(-vs./(2*dtetta*rp),mny,1);
AF = reshape(wf/(2*dz),mnz,1);
AB = reshape(-wb/(2*dz),mnz,1);
APx = reshape((re.*ue-rw.*uw)./(2*rp*dx),mnx,1);
APy = reshape((vn-vs)./(2*rp*dtetta),mny,1);
APz = reshape((wf-wb)/(2*dz),mnz,1);

% build the sparse matrix based on the numbering system
rowx_index = reshape(G(2:Nr+1,2:Ntetta+1,2:Nz+1),mnx,1); % main diagonal x
iix(1:3*mnx) = repmat(rowx_index,3,1);
rowy_index = reshape(G(2:Nr+1,2:Ntetta+1,2:Nz+1),mny,1); % main diagonal y
iiy(1:3*mny) = repmat(rowy_index,3,1);
rowz_index = reshape(G(2:Nr+1,2:Ntetta+1,2:Nz+1),mnz,1); % main diagonal z
iiz(1:3*mnz) = repmat(rowz_index,3,1);
jjx(1:3*mnx) = [reshape(G(1:Nr,2:Ntetta+1,2:Nz+1),mnx,1); reshape(G(2:Nr+1,2:Ntetta+1,2:Nz+1),mnx,1); reshape(G(3:Nr+2,2:Ntetta+1,2:Nz+1),mnx,1)];
jjy(1:3*mny) = [reshape(G(2:Nr+1,1:Ntetta,2:Nz+1),mny,1); reshape(G(2:Nr+1,2:Ntetta+1,2:Nz+1),mny,1); reshape(G(2:Nr+1,3:Ntetta+2,2:Nz+1),mny,1)];
jjz(1:3*mnz) = [reshape(G(2:Nr+1,2:Ntetta+1,1:Nz),mnz,1); reshape(G(2:Nr+1,2:Ntetta+1,2:Nz+1),mnz,1); reshape(G(2:Nr+1,2:Ntetta+1,3:Nz+2),mnz,1)];
sx(1:3*mnx) = [AW; APx; AE];
sy(1:3*mny) = [AS; APy; AN];
sz(1:3*mnz) = [AB; APz; AF];

% build the sparse matrix
kx = 3*mnx;
ky = 3*mny;
kz = 3*mnz;
Mx = sparse(iix(1:kx), jjx(1:kx), sx(1:kx), (Nr+2)*(Ntetta+2)*(Nz+2), (Nr+2)*(Ntetta+2)*(Nz+2));
My = sparse(iiy(1:ky), jjy(1:ky), sy(1:ky), (Nr+2)*(Ntetta+2)*(Nz+2), (Nr+2)*(Ntetta+2)*(Nz+2));
Mz = sparse(iiz(1:kz), jjz(1:kz), sz(1:kz), (Nr+2)*(Ntetta+2)*(Nz+2), (Nr+2)*(Ntetta+2)*(Nz+2));
M = Mx + My + Mz;
