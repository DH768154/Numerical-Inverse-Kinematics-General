function T_cum = cummult(T,varargin)
% Matrix Cumulative Multiplication
[row,col,lay] = size(T);

if isa(T,'sym')
    T_cum = sym(NaN([row,col,lay]));
else
    T_cum = NaN([row,col,lay]);
end

T_cum(:,:,1) = T(:,:,1);
for i = 2:lay
    T_cum(:,:,i) = T_cum(:,:,i-1)*T(:,:,i);
end
if nargin==2 && strcmpi(varargin{1},'final')
    T_cum = T_cum(:,:,end);
end
end