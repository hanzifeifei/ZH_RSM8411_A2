LIBNAME orion BASE "/global/home/ut_zhan1/RSM8411/Assignment2/Datasets";

/* a) Orion Star would like a data set containing only the small retail stores from these observations. */
data work.newcompetitors;
	set orion.newcompetitors;
	
	/* Create a new variable, Country, that contains the first two characters of ID */;
	Country = substr(ID,1,2);
	
	/* Create a new variable, Store_Code, that contains the other characters from the value in
ID. Left justify the value so that there are no leading blanks. */;
	Store_Code = strip(substr(ID,3));
	
	/*The first character in the value of Store_Code indicates the size of the store, and 1 is the
code for a small retail store. */;
	if substr(Store_Code,1,1) NE 1 
		THEN DELETE;
		
	/* Make sure that the City values appear in proper case */;
	City = propcase(City);
run;	

/* b) Print your results with an appropriate title. Only show columns Store_Code, Country, City, and Postal_Code. */;
title "New Small-Store Competitors";
proc print data=work.newcompetitors;
	var Store_Code Country City Postal_Code;
run;
title;