function JJ = jacob0_rot3(T_cum)

axisnum = size(T_cum,3)-1;

JJ = NaN(6,axisnum*3);
P = T_cum(1:3,4,end);

for i=1:axisnum
    R = T_cum(1:3,1:3,i);
    dP = (P-T_cum(1:3,4,i))*[1,1,1];
    JJ(1:3,i*3-2:i*3)=cross(R,dP);
    JJ(4:6,i*3-2:i*3)=T_cum(1:3,1:3,i);
end

end