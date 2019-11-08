data work.newsalesemps; 
length First_Name $12 
Last_Name $ 18 
Job_Title $ 25; 
infile '/global/home/ut_zhan1/RSM8411/Assignment2/Datasets/newemps.csv' dlm=','; 

input First_Name $ 
Last_Name $ 
Job_Title $ 
Salary; 
run;

proc print data=newsalesemps;
run;

title 'New Sales Employees';

proc means data=newsalesemps mean max; 
class job_title; 
var salary; 
run; 
title;