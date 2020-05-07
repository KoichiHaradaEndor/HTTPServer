//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($1;$req_o)
C_OBJECT:C1216($2;$res_o)
C_OBJECT:C1216($3;$next_o)

$req_o:=$1
$res_o:=$2
$next_o:=$3

  // This method is called for any path and any HTTP method

C_BOOLEAN:C305($authenticated_b)

$authenticated_b:=False:C215

Case of 
	: ($req_o.cookies=Null:C1517)
		
	: ($req_o.cookies["SESSID"]=Null:C1517)
		
	: ($req_o.cookies["SESSID"]#"REALLY-SECURED-ID")
		
	Else 
		
		$authenticated_b:=True:C214
		
End case 

If ($authenticated_b)
	
	  // Assumes database is queried to fetch following information.
	$res_o.locals["privilege"]:="user"
	$res_o.locals["userId"]:="1234"
	$next_o.call(This:C1470)
	
Else 
	
	$res_o.sendStatus(401)  // Unauthorized
	
End if 
