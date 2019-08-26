function visualizeCellsCylindrical3D(MeshStructure, phi)
%VISUALIZECELLS plots the values of cell variable phi
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

% domain_length = MeshStructure.numberofcells.*MeshStructure.cellsize;
d = MeshStructure.numberofcells;
[TH,R,Z]=meshgrid(MeshStructure.cellcenters.y, ...
    MeshStructure.cellcenters.x, MeshStructure.cellcenters.z);
[X,Y,Z]=pol2cart(TH,R,Z);
hold on
% surf three cylinders
surf(squeeze(X(floor(2*d(1)/3),:,:)), squeeze(Y(floor(2*d(1)/3),:,:)), ...
    squeeze(Z(floor(2*d(1)/3),:,:)), squeeze(phi(floor(2*d(1)/3),:,:)));
surf(squeeze(X(floor(d(1)/3),:,:)), squeeze(Y(floor(d(1)/3),:,:)), ...
    squeeze(Z(floor(d(1)/3),:,:)), squeeze(phi(floor(d(1)/3),:,:)));
surf(squeeze(X(1,:,:)), squeeze(Y(1,:,:)), ...
    squeeze(Z(1,:,:)), squeeze(phi(1,:,:)));

% surf three circles
surf(squeeze(X(:,:,1)), squeeze(Y(:,:,1)), ...
    squeeze(Z(:,:,1)), squeeze(phi(:,:,1)));
surf(squeeze(X(:,:,floor(d(3)/2))), squeeze(Y(:,:,floor(d(3)/2))), ...
    squeeze(Z(:,:,floor(d(3)/2))), squeeze(phi(:,:,floor(d(3)/2))));
surf(squeeze(X(:,:,end)), squeeze(Y(:,:,end)), ...
    squeeze(Z(:,:,end)), squeeze(phi(:,:,end)));

% surf two sections
surf(squeeze(X(:,floor(d(2)/3),:)), squeeze(Y(:,floor(d(2)/3),:)), ...
    squeeze(Z(:,floor(d(2)/3),:)), squeeze(phi(:,floor(d(2)/3),:)));
surf(squeeze(X(:,floor(2*d(2)/3),:)), squeeze(Y(:,floor(2*d(2)/3),:)), ...
    squeeze(Z(:,floor(2*d(2)/3),:)), squeeze(phi(:,floor(2*d(2)/3),:)));

% pcolor(MeshStructure.cellcenters.x, MeshStructure.cellcenters.y, phi')
axis equal tight
view([60 25]);
alpha(0.8);
colorbar;
% xlabel('Cell centers [x vlaues]');
% ylabel('Cell centers [y vlaues]');
hold off


