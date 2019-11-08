LIBNAME orion BASE "/global/home/ut_zhan1/RSM8411/Assignment2/Datasets";

*/ a) Create a temporary data set, work.bigdonations, using orion.employee_donations as input*/;

data bigdonations;
	set orion.employee_donations;
	
*/ b) Create a new variable named Total that is equal to the sum of Qtr1, Qtr2, Qtr3, and Qtr4 */;
	Total = sum(0, of Qtr1-Qtr4);
	
*/ c)Create a new variable named NoDonation that is equal to the count of missing values in Qtr1,
Qtr2, Qtr3, and Qtr4. Use the NMISS function. */;
	NoDonation = NMISS(Qtr1, Qtr2, Qtr3, Qtr4);

*/ d) Sort the final dataset so that it only contains total value greater than 50 and NoDonation value equal to 0 */;	
	if Total lt 50 or NoDonation ne 0
		THEN DELETE ;
		
*/ e) Write a PROC PRINT step to create the report below */;  

title"Big Donation List";
		
proc print data=bigdonations;
	id Employee_ID;
	var Qtr1 Qtr2 Qtr3 Qtr4 Total NoDonation;
	
run;






