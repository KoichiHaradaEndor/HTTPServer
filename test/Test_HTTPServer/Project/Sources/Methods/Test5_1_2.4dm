//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($1;$req_o)
C_OBJECT:C1216($2;$res_o)
C_OBJECT:C1216($3;$next_o)

$req_o:=$1
$res_o:=$2
$next_o:=$3

  // This method is called for /logout and GET HTTP method

C_OBJECT:C1216($options_o)

$options_o:=New object:C1471("maxAge";0)

$res_o\
.cookie("SESSID";"";$options_o)\
.type("text/plain")\
.send("Logged out")

