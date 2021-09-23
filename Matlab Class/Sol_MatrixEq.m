function x = Sol_MatrixEq(A,b)
  compAb = [A, b];
  x = rref(compAb);
 end