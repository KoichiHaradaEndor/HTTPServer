//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($1;$req_o)
C_OBJECT:C1216($2;$res_o)
C_OBJECT:C1216($3;$next_o)

$req_o:=$1
$res_o:=$2
$next_o:=$3

C_OBJECT:C1216($message_o)
$message_o:=New object:C1471("message";"This text was passed as optional parameter.")
$res_o.render("test2_3.txt";$message_o)
