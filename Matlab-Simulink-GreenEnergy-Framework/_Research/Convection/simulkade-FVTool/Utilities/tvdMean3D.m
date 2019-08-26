function phiFaceAverage = tvdMean3D(MeshStructure,u, phi, FL)
% This function gets the value of the field variable phi defined
% over the MeshStructure and calculates the upwind average on 
% the cell faces, based on the direction of the velocity vector for a uniform mesh.
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

% extract the velocity data
% note: size(ux) = [1:m+1, 1:n] and size(uy) = [1:m, 1:n+1]
ux = u.xvalue;
uy = u.yvalue;
uz = u.zvalue;

% check the size of the variable and the mesh dimension
Nxyz = MeshStructure.numberofcells;
Nx = Nxyz(1); Ny = Nxyz(2); Nz = Nxyz(3);

% define the tvd face vectors
phiX_p = zeros(Nx+1,Ny,Nz);
phiX_m = zeros(Nx+1,Ny,Nz);
phiY_p = zeros(Nx,Ny+1,Nz);
phiY_m = zeros(Nx,Ny+1,Nz);
phiZ_p = zeros(Nx,Ny,Nz+1);
phiZ_m = zeros(Nx,Ny,Nz+1);

% calculate the upstream to downstream gradient ratios for u>0 (+ ratio)
% x direction
dphiX_p = phi(2:Nx+2, 2:Ny+1, 2:Nz+1)-phi(1:Nx+1, 2:Ny+1, 2:Nz+1);
rX_p = dphiX_p(1:end-1,:,:)./fsign(dphiX_p(2:end,:,:));
phiX_p(2:Nx+1,:,:) = phi(2:Nx+1, 2:Ny+1, 2:Nz+1)+0.5*FL(rX_p).* ...
    (phi(3:Nx+2,2:Ny+1,2:Nz+1)-phi(2:Nx+1,2:Ny+1,2:Nz+1));
phiX_p(1,:,:) = (phi(1,2:Ny+1,2:Nz+1)+phi(2,2:Ny+1,2:Nz+1))/2; % left boundary
% y direction
dphiY_p = phi(2:Nx+1, 2:Ny+2, 2:Nz+1)-phi(2:Nx+1, 1:Ny+1, 2:Nz+1);
rY_p = dphiY_p(:,1:end-1,:)./fsign(dphiY_p(:,2:end,:));
phiY_p(:,2:Ny+1,:) = phi(2:Nx+1, 2:Ny+1, 2:Nz+1)+0.5*FL(rY_p).* ...
    (phi(2:Nx+1,3:Ny+2,2:Nz+1)-phi(2:Nx+1, 2:Ny+1,2:Nz+1));
phiY_p(:,1,:) = (phi(2:Nx+1,1,2:Nz+1)+phi(2:Nx+1,2,2:Nz+1))/2; % Bottom boundary
% z direction
dphiZ_p = phi(2:Nx+1, 2:Ny+1, 2:Nz+2)-phi(2:Nx+1, 2:Ny+1, 1:Nz+1);
rZ_p = dphiZ_p(:,:,1:end-1)./fsign(dphiZ_p(:,:,2:end));
phiZ_p(:,:,2:Nz+1) = phi(2:Nx+1, 2:Ny+1, 2:Nz+1)+0.5*FL(rZ_p).* ...
    (phi(2:Nx+1,2:Ny+1,3:Nz+2)-phi(2:Nx+1,2:Ny+1,2:Nz+1));
phiZ_p(:,:,1) = (phi(2:Nx+1,2:Ny+1,1)+phi(2:Nx+1,2:Ny+1,2))/2; % Back boundary

% calculate the upstream to downstream gradient ratios for u<0 (- ratio)
% x direction
rX_m = dphiX_p(2:end,:,:)./fsign(dphiX_p(1:end-1,:,:));
phiX_m(1:Nx,:,:) = phi(2:Nx+1, 2:Ny+1, 2:Nz+1)+0.5*FL(rX_m).* ...
    (phi(1:Nx, 2:Ny+1, 2:Nz+1)-phi(2:Nx+1, 2:Ny+1, 2:Nz+1));
phiX_m(Nx+1,:,:) = (phi(end,2:Ny+1,2:Nz+1)+phi(end-1,2:Ny+1,2:Nz+1))/2; % right boundary
% y direction
rY_m = dphiY_p(:,2:end,:)./fsign(dphiY_p(:,1:end-1,:));
phiY_m(:,1:Ny,:) = phi(2:Nx+1,2:Ny+1,2:Nz+1)+0.5*FL(rY_m).* ...
    (phi(2:Nx+1,1:Ny,2:Nz+1)-phi(2:Nx+1,2:Ny+1,2:Nz+1));
phiY_m(:,Ny+1,:) = (phi(2:Nx+1, end,2:Nz+1)+phi(2:Nx+1, end-1,2:Nz+1))/2; % top boundary
% z direction
rZ_m = dphiZ_p(:,:,2:end)./fsign(dphiZ_p(:,:,1:end-1));
phiZ_m(:,:,1:Nz) = phi(2:Nx+1,2:Ny+1,2:Nz+1)+0.5*FL(rZ_m).* ...
    (phi(2:Nx+1,2:Ny+1,1:Nz)-phi(2:Nx+1,2:Ny+1,2:Nz+1));
phiZ_m(:,:,Nz+1) = (phi(2:Nx+1,2:Ny+1,end)+phi(2:Nx+1,2:Ny+1,end-1))/2; % front boundary

% calculate the average value
phiFaceAverage.xvalue = (ux>0).*phiX_p+ ...
                        (ux<0).*phiX_m+ ...
                        0.5*(ux==0).*(phi(1:Nx+1,2:Ny+1,2:Nz+1)+phi(2:Nx+2,2:Ny+1,2:Nz+1));
phiFaceAverage.yvalue = (uy>0).*phiY_p+ ...
                        (uy<0).*phiY_m+ ...
                        0.5*(uy==0).*(phi(2:Nx+1,1:Ny+1,2:Nz+1)+phi(2:Nx+1,2:Ny+2,2:Nz+1));
phiFaceAverage.zvalue = (uz>0).*phiZ_p+ ...
                        (uz<0).*phiZ_m+ ...
                        0.5*(uz==0).*(phi(2:Nx+1,2:Ny+1,1:Nz+1)+phi(2:Nx+1,2:Ny+1,2:Nz+2));
end

function phi_out = fsign(phi_in)
% This function checks the value of phi_in and assigns an eps value to the
% elements that are less than or equal to zero, while keeping the signs of
% the nonzero elements
    phi_out = (abs(phi_in)>=eps).*phi_in+eps*(phi_in==0)+eps*(abs(phi_in)<eps).*sign(phi_in);
end