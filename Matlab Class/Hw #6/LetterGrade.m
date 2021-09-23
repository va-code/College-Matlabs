clear all
FinalScore = input('Final Score =');

if FinalScore >=90
  LetterGrade = 'A';
elseif FinalScore >=80 && FinalScore < 90
  LetterGrade = 'B';
elseif FinalScore >= 70 && FinalScore < 80
  LetterGrade = 'C';
elseif FinalScore >= 60 && FinalScore < 70
  LetterGrade = 'C';
else
  LetterGrade = 'F';
endif


fprintf('Letter Grade = %s\n',LetterGrade);