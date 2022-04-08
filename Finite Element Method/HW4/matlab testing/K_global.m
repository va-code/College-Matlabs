#plane-stress Plate

#Copyright: MIT Licence
#Copyright <2022> <Vaughn Anderson>
#Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
#The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


clear all;
close all;
clc;

load elems.out
load nodes.out
load leftlist.out
load rightlist.out

E = 210e9;
v = 0.3;
t = 0.001;
thickness = 0.001;
# load right edge with pressure force totalling 1000N(51 nodes)

RnodeForce = 1000/51;

D = (E/(1-(v**2))).*[1,v,0; v,1,0; 0,0,(0.5-(0.5*v))];
#K = tA(B^T)DB

###fprintf('%i\n',x)
#fprintf('%i\n',elems(1,:));


#calculating F matrix(5546x1) ==> [u1,v1,u2,v2...]Transp.
F =zeros(2*length(nodes),1);
for i = 1:length(rightlist)
  x = (rightlist(i)*2)-1;
  F(x,1) = RnodeForce;
end

K_global = zeros(2*length(nodes));

#making K for each element then adding to the global K
for l = 1:(length(elems))
  i = elems(l,1);
  j = elems(l,2);
  m = elems(l,3);
  Bt_i = nodes(j,2)-nodes(m,2);
  Bt_j = nodes(m,2)-nodes(i,2);
  Bt_m = nodes(i,2)-nodes(j,2);
  Yt_i = nodes(m,1)-nodes(j,1);
  Yt_j = nodes(i,1)-nodes(m,1);
  Yt_m = nodes(j,1)-nodes(i,1);
  
  #fprintf('%i\n',l)
  A2_i = (nodes(i,1)*(nodes(j,2)-nodes(m,2)))-(nodes(j,1)*(nodes(i,2)-nodes(m,2)))+(nodes(m,1)*(nodes(i,2)-nodes(j,2)));

  
  B_i = (1/(A2_i)).*[Bt_i,0,Bt_j,0,Bt_m,0; 0,Yt_i,0,Yt_j,0,Yt_m; Yt_i,Bt_i,Yt_j,Bt_j,Yt_m,Bt_m];
  K_i = t*(A2_i*0.5)*(B_i.')*D*B_i;
    #error checking stuff:
  if A2_i == 0
   
    fprintf('Error at: %i\n',l)
    (nodes(i,1)*(nodes(j,2)-nodes(m,2)))
    (nodes(j,1)*(nodes(i,2)-nodes(m,2)))
    (nodes(k,1)*(nodes(i,2)-nodes(m,2)))
    return
  endif
  
  L = [i*2-1,i*2,j*2-1,j*2,m*2-1,m*2];
  for x = 1:length(L)
    for y = 1:length(L)
      K_global(L(x),L(y)) = K_global(L(x),L(y))+K_i(x,y);
    endfor
  endfor
endfor

#Reducing K by setting relevant stationary d vals
#setting left nodes in K to 0



fprintf('K_1165_1647 soln: %i\n',K_global(1165,1647))
fprintf('K_1664_1339 soln: %i\n',K_global(1664,1339))


fprintf('Q_5244 soln: %i\n',F(5244,1))
fprintf('Q_5259 soln: %i\n',F(5259,1))

n = length(leftlist);
K_red = K_global;
F_red = F;
while (n > 0)
  x = 2*leftlist(n)-1;
  len = length(K_red);
  if x == len
    K_red = K_red(1:x,:);
    K_red = K_red(:,1:x);
    F_red = F_red(1:x,:);
  elseif x == 1
    K_red = K_red(2:len,:);
    K_red = K_red(:,2:len);
    F_red = F_red(2:len,:);
   else
    #remove col; K(row,col)
    K_red = [K_red(:,1:(x-1)),K_red(:,(x+1):len)];
    #remove row:
    K_red = [K_red(1:(x-1),:);K_red((x+1):len,:)];
    #removing for F_red
    F_red = [F_red(1:(x-1),:);F_red((x+1):len),:];
  end

  n--;
endwhile
len =length(K_red);
K_red = K_red(2:len,:);
K_red = K_red(:,2:len);
F_red = F_red(2:len,:);


#computing soln
d_red = (inv(K_red))*F_red;

#adding back the 0 displacement nodes
d = d_red;
d = [0; d];
for n = 1:length(leftlist)
  x = 2*leftlist(n)-1;
  len = length(d);
  if x == len
    d = [d(:,:);0];
  elseif x == 1
    d = [0;d(:,:)];
   else
    #adding 0 for F_red
    d= [d(1:(x-1),:);0;d((x):len),:];
  end
endfor



fprintf('d_3616(nodal displacement) soln: %i\n',d(3616,1))
fprintf('d_5476(nodal displacement) soln: %i\n',d(5476,1))



#getting stress:
#(min stress,max stress)
max_stress = [0,0];
for l = 1:length(elems)
  i = elems(l,1);
  j = elems(l,2);
  m = elems(l,3);
  Bt_i = nodes(j,2)-nodes(m,2);
  Bt_j = nodes(m,2)-nodes(i,2);
  Bt_m = nodes(i,2)-nodes(j,2);
  Yt_i = nodes(m,1)-nodes(j,1);
  Yt_j = nodes(i,1)-nodes(m,1);
  Yt_m = nodes(j,1)-nodes(i,1);
  
  #fprintf('%i\n',l)
  A2_i = (nodes(i,1)*(nodes(j,2)-nodes(m,2)))-(nodes(j,1)*(nodes(i,2)-nodes(m,2)))+(nodes(m,1)*(nodes(i,2)-nodes(j,2)));
  B_i = (1/(A2_i)).*[Bt_i,0,Bt_j,0,Bt_m,0; 0,Yt_i,0,Yt_j,0,Yt_m; Yt_i,Bt_i,Yt_j,Bt_j,Yt_m,Bt_m];
  di_x =d(2*i-1);
  di_y =d(2*i);
  dj_x =d(2*j-1);
  dj_y =d(2*j);
  dm_x =d(2*m-1);
  dm_y =d(2*m);
  d_i = [di_x;di_y;dj_x;dj_y;dm_x;dm_y];
  epsilon = B_i*d_i;
  stress_i = D*epsilon;
  for s = 1:length(stress_i)
    if s > max_stress(1)
      max_stress(1) = stress_i(s);
    elseif s < max_stress(2)
      max_stress(2) = stress_i(s);
    endif
  endfor
endfor
max_stress




#things to turn in:
# this script
#max stress
# K_1165_1647
# K_1664_1339
#Q_5244(nodal loads vector)
#Q_5259(nodal loads vector)
#d_3616(nodal displacement)
#d_5476(nodal displacement)
