//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($1;$app_o)

C_OBJECT:C1216($postalCode_o)

$app_o:=$1

$postalCode_o:=PostalCode 

$app_o.get("/test7-1-code";$postalCode_o.webQueryByCode)
$app_o.get("/test7-1-address";Formula:C1597(Test7_1_Address ))
