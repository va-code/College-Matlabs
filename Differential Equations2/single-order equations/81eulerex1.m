## Copyright (C) 2021 13163
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} Matlab_Euler_Approx (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: 13163 <13163@DESKTOP-2PEC5I7>
## Created: 2021-10-16

##function retval = Matlab_Euler_Approx (input1, input2)

##endfunction
clearvars;
close all;


t_outs = [0.0 0.1 0.2 0.3 0.4 0.5 1 1.5 2.0];          
t = 0.0;           %t initial
y = 1.0;          %y initial
h = 0.01;       %step size
steps = (2.00/h);     %number of steps
outputs = [];
step = 0;

while step <= steps
  append = [t y]
  %if ismember(t, t_outs)
    outputs=[outputs;append];
  %end
  fn = (1 - t + 4*y);
  y = y + h*fn;
  t = t + h;
  step = step + 1;
end