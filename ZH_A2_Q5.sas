
proc sort data=orion.shoes_eclipse
	out=work.eclipsesort;
    by Product_Name;
run;

/* a) Add a PROC SORT step after the PROC SORT step to sort orion.shoes_tracker by Product_Name to create a new data set named work.trackersort. */;

data prod_name;
	set orion.shoes_tracker;
    Product_Name = propcase(Product_Name);
run;

proc sort data=prod_name 
	out=work.trackersort;
    by Product_Name;
run;

/* b) Add a DATA step after the two PROC SORT steps to interleave the two sorted data sets by Product_Name to create a new data set named work.e_t_shoes. Include only the following variables: Product_Group, Product_Name, and Supplier_ID. */;

data work.e_t_shoes;
	set eclipsesort trackersort;
	by Product_Name;
	
	keep Product_Group Product_Name Supplier_ID;
run;

/* c)Create the report that prints the data */;

proc print data=e_t_shoes;
	var Product_Group Product_Name Supplier_ID;
run;