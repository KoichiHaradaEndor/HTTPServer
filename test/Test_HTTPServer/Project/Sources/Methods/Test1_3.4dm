//%attributes = {"invisible":true,"preemptive":"capable"}
/*
* This code registers route handlers.
* $app_o.use is used to respond "/test1-3" and its sub directory.
*/

C_OBJECT:C1216($1;$app_o)

$app_o:=$1

$app_o.use("/test1-3";Formula:C1597(Test1_3_1 ))
$app_o.get("/test1-3/sub";Formula:C1597(Test1_3_2 ))
