function Hw4Prob1
  load hw4(1).mat;
  %Final Score for Roy
  roy_tot_score = sum(score(13,:));
  fprintf('%s%d\n','Final Score for Roy = ',roy_tot_score);
  
  %Class Avg. for final
  Class_Avg_Final = mean(score(:,8));
  fprintf('%s%d\n','Class Avarage for Final Exam = ',Class_Avg_Final);
  
  % Max Score for Midterm
  Midterm_Max = max(score(:,7));
  fprintf('%s%d\n','Maximum Score for Midterm Exam = ',Midterm_Max);

  % Max Score for Midterm
  Quiz_Avgs = mean(score(:,1:6));
  Quiz_Min = min(Quiz_Avgs(1,:));
  fprintf('%s%d\n','Minimum Class Average Score for Quiz = ',Quiz_Min);
  
  %Class average of final score
  Scores_Total = sum(score'(:,:));
  Class_Avg_Total = mean(Scores_Total);
  fprintf('%s%d\n','Class Average for Total Score = ',Class_Avg_Total);
  
  %Checking how many students there are in the class
  Num_Students = size(score(),1);
  fprintf('%s%d\n','Total Number of Students = ',Num_Students);
  
 end