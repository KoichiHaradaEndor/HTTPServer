//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($1;$req_o)
C_OBJECT:C1216($2;$res_o)
C_OBJECT:C1216($3;$next_o)

$req_o:=$1
$res_o:=$2
$next_o:=$3

C_OBJECT:C1216($formats_o)

$formats_o:=New object:C1471(\
"application/json";Formula:C1597(Test2_5_1_Json );\
"text/plain";Formula:C1597(Test2_5_1_Plain );\
"default";Formula:C1597(Test2_5_1_Default )\
)

$res_o.format($formats_o)
