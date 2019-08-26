function r = funceval(f, varargin)
%FUNCEVAL calculates the value of the function f at the face variable phi
% f must be able to accept matrices
% f: function handle
% phi: input to the function f
% r: output of the function f
% f can handle 3 input phi variables, but they should all be of the same
% class
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

% analyze phi to find the dimension of the matrix

switch nargin
    case 2
        if isstruct(varargin{1})==1
            m = size(varargin{1}.xvalue);
            d = ndims(varargin{1}.xvalue);
            if (min(m) == 1) % 1D: only x value
                r.xvalue = f(varargin{1}.xvalue);
            elseif (d == 2) % 2D: x and y values
                r.xvalue = f(varargin{1}.xvalue);
                r.yvalue = f(varargin{1}.yvalue);
            else % 3D:x, y, and z values
                r.xvalue = f(varargin{1}.xvalue);
                r.yvalue = f(varargin{1}.yvalue);
                r.zvalue = f(varargin{1}.zvalue);
            end
        elseif isstruct(varargin{1})==0
            r = f(varargin{:});
        end
    case 3
        if isstruct(varargin{1})==1
            m = size(varargin{1}.xvalue);
            d = ndims(varargin{1}.xvalue);
            if (min(m) == 1) % 1D: only x value
                r.xvalue = f(varargin{1}.xvalue, varargin{2}.xvalue);
            elseif (d == 2) % 2D: x and y values
                r.xvalue = f(varargin{1}.xvalue, varargin{2}.xvalue);
                r.yvalue = f(varargin{1}.yvalue, varargin{2}.yvalue);
            else % 3D:x, y, and z values
                r.xvalue = f(varargin{1}.xvalue, varargin{2}.xvalue);
                r.yvalue = f(varargin{1}.yvalue, varargin{2}.yvalue);
                r.zvalue = f(varargin{1}.zvalue, varargin{2}.zvalue);
            end
        elseif isstruct(varargin{1})==0
            r = f(varargin{:});
        end
end