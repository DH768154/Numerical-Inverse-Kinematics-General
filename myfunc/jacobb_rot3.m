function J = jacobb_rot3(T_cum)

J = jacob0_rot3(T_cum);
J(1:3,:) = T_cum(1:3,1:3,end)' * J(1:3,:);
J(4:6,:) = T_cum(1:3,1:3,end)' * J(4:6,:);

end