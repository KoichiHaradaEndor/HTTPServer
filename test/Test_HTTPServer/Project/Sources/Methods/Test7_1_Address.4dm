//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
C_OBJECT:C1216($1;$req_o)
C_OBJECT:C1216($2;$res_o)
C_OBJECT:C1216($3;$next_o)

C_OBJECT:C1216($postalCode_o)
C_TEXT:C284($address_t)
C_COLLECTION:C1488($result_c)

$req_o:=$1
$res_o:=$2
$next_o:=$3

Case of 
	: ($req_o.query=Null:C1517)
		
		$res_o.status(400).json(New object:C1471("message";"The 'address' parameter is required."))
		
	: ($req_o.query["address"]=Null:C1517)
		
		$res_o.status(400).json(New object:C1471("message";"The 'address' parameter is required."))
		
	Else 
		
		$result_c:=New collection:C1472()
		$address_t:=$req_o.query["address"]
		$postalCode_o:=PostalCode   //  Get PostalCode object
		$result_c:=$postalCode_o.queryByAddress($address_t)
		$res_o.set("Access-Control-Allow-Origin";"*").json($result_c)
		
End case 

