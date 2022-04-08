clear all;
close all;
clc;

load K.txt
load F.txt
load rm.txt
#from remove: will state the node needing removed
# nodes 1_x and 3_x



#Reducing K and F before inv:
#step 1 removing all relevant rows/cols from last to fist index
n = length(rm);
K_red = K
F_red = F;
while (n > 0)
  x = 2*rm(n)-1;
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
#removing the first element one more time, setting dy0=0
len =length(K_red);
K_red = K_red(2:len,:);
K_red = K_red(:,2:len);
F_red = F_red(2:len,:);




#testing in here
%{
K_global =zeros(8);
L = [1,2,3,4,5,6,7,8];
for row = 1:length(L)
  for col = 1:length(L)
    K_global(L(row), L(col)) = K_global(L(row), L(col)) + K(row,col)
  endfor
endfor
%}
#end testing


#calculating the reduced displacement matrix
d_red = (inv(K_red))*F_red;

#Adding back the missing indexs as 0 displacement so we can return global displacement

d = d_red;
d = [0; d];
for n = 1:length(rm)
  x = 2*rm(n)-1;
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
