LIBNAME orion BASE "/global/home/ut_zhan1/RSM8411/Assignment2/Datasets";

proc sort data=orion.sales out=sales;
	by Country descending Salary ;
run;

title"Sorted Orion Table";

proc print data=orion.sales;
	var Country Job_Title Salary Last_Name;
run;