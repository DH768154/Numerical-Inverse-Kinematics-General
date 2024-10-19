function T_cum = kineRob(ag,kinV,tcp)
axisnum = size(kinV,2);
T = NaN(4,4,axisnum+1);
for i = 1:axisnum
    T(:,:,i) = [eye(3),kinV(:,i);0,0,0,1] *...
                EulerRot(ag(i,:),'EulerOrder',[1,2,3],'RSize',4);
end
T(:,:,end) = [eye(3),tcp;0,0,0,1];

T_cum = cummult(T);
end