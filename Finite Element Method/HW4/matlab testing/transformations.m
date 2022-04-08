#plane-stress Plate
clear all;
close all;
clc;

load elems.out
load nodes.out
load leftlist.out
load rightlist.out
#load K_global.out
#load Fmat.out

#solving for d
#K_inv = inv(K_global);

#d = K_inv*Fmat;


#[i, j, k] = elems(1,:)
e = elems
i = elems(e,1)
j = elems(e,2)
k = elems(e,3)

k_global = zeros(2*length(nodes));

for e = 1#:length(elems)

















%{
#Reducing K by setting relevant stationary d vals
#setting left nodes in K to 0
for i = 1:length(leftlist)
  mtxlcx = (leftlist(i)*2)-1;
  K_global(:,mtxlcx) = 0;
endfor
#setting a y node to 0 displacement
K_global(:,2)=0;
#reducting matrices for solving
for i = 1:(length(leftlist))
  x = (leftlist(i)*2)-1;
  F(x,1) = 'a';
  
  K_global(x,1:(length(K_global)))='a'+0.5;
end
F_red = F(F~='a');
F_red = F_red(2:length(F_red),1);
K_red = K_global;


i = (length(leftlist));
while (i >= 1)
  x = (leftlist(i)*2)-1;
  if (x > (size(K_red)(1)-1))
    K_red =K_red(1:(x-1),1:(x-1));
  elseif (x < 0)
    K_red =K_red((x+1):length(K_red),(x+1):length(K_red));
  else
    K_red = [K_red(1:(x-1),:) ; K_red((x+1):size(K_red)(1),:)];
    K_red = [K_red(:,1:(x-1)) , K_red(:,(x+1):size(K_red)(1))];
  endif
  i--;
endwhile
K_red = K_red(1:length(F_red),:);
#computing soln

fprintf('K_1165_1647 soln: %i\n',K_global(1165,1647))
fprintf('K_1664_1339 soln: %i\n',K_global(1664,1339))

d_red = (inv(K_red))*F_red;
d = [0;d_red];

for i = 1:(length(leftlist))
  x = (leftlist(i)*2)-1;
  if x < length(d)
    d = [d(1:x,:);0;d((x+1):length(d),1)];
  else
    d = [d;0];
  endif
end
fprintf('d_3616(nodal displacement) soln: %i\n',d(3616,1))
fprintf('d_5476(nodal displacement) soln: %i\n',d(5476,1))
%}


#things to turn in:
# this script
#max stress
# K_1165_1647
# K_1664_1339
#Q_5244(nodal loads vector)
#Q_5259(nodal loads vector)
#d_3616(nodal displacement)
#d_5476(nodal displacement)
