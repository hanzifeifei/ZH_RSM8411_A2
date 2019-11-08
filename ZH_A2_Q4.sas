LIBNAME orion BASE "/global/home/ut_zhan1/RSM8411/Assignment2";

/* a) Write and submit three PROC CONTENTS steps to compare the variables */;

proc data=orion.shoes_eclipse;
run;

proc data=orion.shoes_tracker;
run;

proc data=orion.shoes;
run;

/*b) Write a PROC DATASETS */;
 
proc datasets;
 data work.orion_shoes;
	set orion.shoes orion.shoes_eclipse orion.shoes_tracker;
run;

/*c) Submit the PROC DATASETS step followed by a PROC PRINT t */;

 proc print data=work.orion_shoes;
 run;