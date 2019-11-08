/* a) Use explicit output to create a data set named work.split*/
libname orion "/global/home/ut_zhan1/RSM8411/Assignment2/Datasets";
data work.split;
	set orion.employee_donations;
	PctLoc=find(Recipients,'%');
	if PctLoc>0 then do;
		Charity=substr(Recipients,1,PctLoc);
	output;
		Charity=substr(Recipients,PctLoc+3);
	output;
	end;
	else do;
		Charity=catx(' ',Recipients,' 100%');
	output;
	end;
	drop PctLoc Recipients;	
run;


/*b) Using the program to read the entire orion.employee_donations dataset.*/
title 'Charity Contributions for each Employee';
proc print data= work.split noobs;
	var Employee_ID Charity;
run;