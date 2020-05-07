//%attributes = {"invisible":true,"preemptive":"capable"}
/** 
* This method is used to sort Accept header value.
* 
*/

C_OBJECT:C1216($1)

C_OBJECT:C1216($first_o;$second_o)
C_REAL:C285($first_r;$second_r)
C_TEXT:C284($first_t;$second_t)

$first_o:=$1.value
$first_r:=$first_o.priority
$first_t:=$first_o.mimetype

$second_o:=$1.value2
$second_r:=$second_o.priority
$second_t:=$second_o.mimetype

Case of 
	: ($first_r>$second_r)
		
		$1.result:=True:C214
		
	: ($first_r=$second_r)
		
		If (Position:C15("*";$second_t)>0)
			
			$1.result:=True:C214
			
		End if 
		
End case 
