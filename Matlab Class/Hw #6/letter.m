clear all
load hw6(1).mat
#student finished
TotalScorePerStudent = [sum(score,2)];
#done
N_A = 0;
#tudent finished
N_B = 0;
N_C = 0;
N_D = 0;
#done
N_F = 0;
[NumStudent NumAssignment] = size(score);

for i = 1:NumStudent
  if (TotalScorePerStudent(i) >=90)
    LetterGrade = 'A'; N_A = N_A + 1;
    #tudent finished
    
  elseif (TotalScorePerStudent(i) >=80 && TotalScorePerStudent(i)< 90)
    LetterGrade = 'B'; N_B = N_B + 1;
    
  elseif (TotalScorePerStudent(i) >=70 && TotalScorePerStudent(i)< 80)
    LetterGrade = 'C'; N_C = N_C + 1;
    
  elseif (TotalScorePerStudent(i) >=60 && TotalScorePerStudent(i)< 70)
    LetterGrade = 'D'; N_D = N_D + 1;
    
  else
    LetterGrade = 'F'; N_F = N_F + 1;
  
    #done
  endif
  fprintf('For Student %d, Total Score = %d,Letter Grade = %s\n',i,TotalScorePerStudent(i),LetterGrade);
  
end

fprintf('Head Count for Grade A = %d, B = %d, C =%d, D = %d, F = %d\n',N_A,N_B,N_C,N_D,N_F);