daat work.newsalesemps;
length First_Name $12
Last_Name $ 18
Job_Title $ 25;
infile '/tutorials/eg/data/ecprg1/newemps.csv dlm=',';
input First_Name $
Last_Name $
Job_Title $ Salary /* Salary is Numeric ;
run;

proc print newsalesemps
 run;
 title 'New Sales Employees';

proc means data=work.newsalesemps average max;
class job_title;
var salary;
run;
title;
 