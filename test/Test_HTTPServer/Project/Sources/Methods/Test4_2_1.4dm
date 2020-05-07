//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($1;$req_o)
C_OBJECT:C1216($2;$res_o)
C_OBJECT:C1216($3;$next_o)

$req_o:=$1
$res_o:=$2
$next_o:=$3

C_OBJECT:C1216($body_o)
$body_o:=$req_o.body

$res_o.json($body_o)
