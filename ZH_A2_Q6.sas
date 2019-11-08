LIBNAME orion BASE "/global/home/ut_zhan1/RSM8411/Assignment2/Datasets";

/* a)Write a DATA step that reads orion.orders to create work.ordertype. */;
data work.ordertype;
	set orion.orders;
	
	/* b)Create a new variable, DayOfWeek, that is equal to the weekday of Order_Date */;
	
	DayOfWeek = weekday(Order_Date);
	
	/* c) Create the new variable Type */ ;
	
	length Type $ 15;
	if Order_Type eq 1 THEN Type="Retail Sale";
	else if Order_Type eq 2 THEN Type="Catalog Sale";
	else if Order_Type eq 3 THEN Type="Internet Sale";
	
	/* d) Create the new variable SaleAds*/;
	
	if Order_Type eq 2 THEN SaleAds="Mail";
	else if Order_Type eq 3 THEN SaleAds="Email";
	
	/* e) Remove Order_Type, Employee_ID and Customer_ID in the new data set.*/;
	
	drop Order_Type Employee_ID Customer_ID;
	
run;

/* f) Create and print the report*/;

proc print data=work.ordertype;
run;

