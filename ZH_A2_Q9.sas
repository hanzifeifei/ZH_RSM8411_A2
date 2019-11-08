/*a) Create a data set named work.sale_stats with three new variables for all months in which the customer placed an order*/
libname orion "/global/home/ut_zhan1/RSM8411/Assignment2";

data work.sale_stats;
	set orion.orders_midyear;
	MonthAvg=round(mean(of month1-month6));
	MonthMax=max(of month1-month6);
	MonthSum=sum(of month1-month6);
run;

/*b) Print the variables Customer_ID, MonthAvg, MonthMax, and MonthSum*/
proc print data= work.sale_stats noobs;
	var Customer_ID MonthAvg MonthMax MonthSum;
run;

/*c) Orion Star now wants to look at information about the median order and the top two months’ orders*/
data work.freqcustomers;
	set orion.orders_midyear;
	if n(of month1-month6)>=5;
	Month_Median=median(of month1-month6);
	Month_Highest=largest(1,of month1-month6);
	Month_2ndHighest=largest(2,of month1-month6);	
run;

/*d) Print your results with an appropriate title*/
proc print data =work.freqcustomers noobs;
run;