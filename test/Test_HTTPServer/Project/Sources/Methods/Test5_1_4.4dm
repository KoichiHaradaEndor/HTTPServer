//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($1;$req_o)
C_OBJECT:C1216($2;$res_o)
C_OBJECT:C1216($3;$next_o)

$req_o:=$1
$res_o:=$2
$next_o:=$3

  // This method is called when 
  // path is /User/:userId
  // method is GET

  // Authentication is granted in Test5_1_2

C_TEXT:C284($userId_t)

Case of 
	: ($req_o.params=Null:C1517)
		
	: ($req_o.params["userId"]=Null:C1517)
		
	Else 
		
		$userId_t:=$req_o.params["userId"]
		
End case 

If ($userId_t=$res_o.locals["userId"])
	
	$res_o.json(New object:C1471("userId";$res_o.locals["userId"];"privilege";$res_o.locals["privilege"]))
	
Else 
	
	$res_o.sendStatus(403)  // Forbidden
	
End if 

