//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($1;$app_o)

$app_o:=$1

$app_o.post("/login";Formula:C1597(Test5_1_1 ))
$app_o.delete("/logout";Formula:C1597(Test5_1_2 ))
$app_o.use(Formula:C1597(Test5_1_3 ))
$app_o.get("/User/:userId";Formula:C1597(Test5_1_4 ))
