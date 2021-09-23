
i = 1;
while (i <= 10) % control logic for outer “while”, 1≤i≤5
  j = 1;
  while (j <= i) % control logic for inner “while”, 1≤j≤i
    fprintf(' '); % display star
    j = j + 1;
  end
  x = 1;
  while (x <= 10-i) % control logic for inner “while”, 1≤j≤i
    fprintf('*'); % display star
    x = x +1;
  end
  fprintf('\n'); % add <enter>
  i = i + 1;
end
