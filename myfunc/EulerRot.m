function R_Euler = EulerRot(euler_angle,varargin)
% Optional Input:
% 1. EulerOrder, default is zyz
% 2. Angle Unit, default is rad
%
% example:
% Euler Order ZYZ, 20,30,40 Deg
% R_Euler = EULERXYZ([20,30,40],Unit='deg')
%
% example:
% Euler Order XYZ, pi,pi/3,pi/6 Rad
% R_Euler = EULERXYZ([pi,pi/3,pi/6],EulerOrder=[1,2,3])

if length(euler_angle)~=3
    error('Euler Angle Should be Size of 3')
end

p = inputParser;
addParameter(p,'EulerOrder',[3,2,3]) % zyz
addParameter(p,'Unit','rad')
addParameter(p,'RSize',3)
parse(p,varargin{:});
EulerOrder = p.Results.EulerOrder;
unit = p.Results.Unit;
rsize = p.Results.RSize;

if isa(euler_angle,'sym')
    R = sym(NaN([3,3,3]));
else
    R = NaN([3,3,3]);
end

for i=1:3
    R(:,:,i) = RotXYZ(euler_angle(i),'RotAxis',EulerOrder(i),'Unit',unit);
end
R_Euler = R(:,:,1)*R(:,:,2)*R(:,:,3);

if rsize == 4
    R_Euler = [R_Euler,[0,0,0]';0,0,0,1];
end
end