//%attributes = {"invisible":true,"preemptive":"capable"}
/*
* This code registers route handlers for method="GET" and path="/test1-1",
* then when such request comes, three methods should be invoked in order.
*/

C_OBJECT:C1216($1;$app_o)

C_LONGINT:C283($selector_l)

$app_o:=$1

$selector_l:=1

Case of 
	: ($selector_l=1)
		
		  // multiple selectors can be passed
		$app_o.get("/test1-1";Formula:C1597(Test1_1_1 );Formula:C1597(Test1_1_2 );Formula:C1597(Test1_1_3 ))
		
	: ($selector_l=2)
		
		  // accepts handler collection
		C_COLLECTION:C1488($handlers_c)
		$handlers_c:=New collection:C1472(Formula:C1597(Test1_1_1 );Formula:C1597(Test1_1_2 );Formula:C1597(Test1_1_3 ))
		$app_o.get("/test1-1";$handlers_c)
		
	: ($selector_l=3)
		
		  // combination
		C_COLLECTION:C1488($handlers_c)
		$handlers_c:=New collection:C1472(Formula:C1597(Test1_1_1 );Formula:C1597(Test1_1_2 ))
		$app_o.get("/test1-1";$handlers_c;Formula:C1597(Test1_1_3 ))
		
	: ($selector_l=4)
		
		  // multiple call for the same route
		$app_o.get("/test1-1";Formula:C1597(Test1_1_1 ))
		$app_o.get("/test1-1";Formula:C1597(Test1_1_2 ))
		$app_o.get("/test1-1";Formula:C1597(Test1_1_3 ))
		
	: ($selector_l=5)
		
		  // can use generic method
		$app_o.method("get";"/test1-1";Formula:C1597(Test1_1_1 );Formula:C1597(Test1_1_2 );Formula:C1597(Test1_1_3 ))
		
End case 
