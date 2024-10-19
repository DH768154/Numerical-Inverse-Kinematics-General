function R=RotXYZ(theta,varargin)
% Rotation Matrix
% Optional Input:
% 1. RotAxis, 1,2,3 is 'x','y','z'
% 2. Unit, default is rad

p = inputParser;
addParameter(p,'RotAxis',3)
addParameter(p,'Unit','rad')
addParameter(p,'RSize',3)
parse(p,varargin{:});
dir = p.Results.RotAxis;
unit = p.Results.Unit;
rsize = p.Results.RSize;

if length(theta)~=1
    error('length(theta)~=1, Use RotXYZ2 Instead of RotXYZ')
end

if strcmpi(unit,'deg')
    c=cosd(theta); s=sind(theta);
elseif strcmpi(unit,'rad')
    c=cos(theta); s=sin(theta);
end

if dir==1
    R=[1,0,0;0,c,-s;0,s,c];
elseif dir==2
    R=[c,0,s;0,1,0;-s,0,c];
elseif dir==3
    R=[c,-s,0;s,c,0;0,0,1];
end

if rsize == 4
    R = [R,[0,0,0]'];
    R = [R;[0,0,0,1]];
end
end