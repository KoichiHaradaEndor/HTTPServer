//%attributes = {"invisible":true,"preemptive":"capable"}
/**
* This method throws an error.
*
* @author HARADA Koichi
*/

C_TEXT:C284($1;$errorMessage_t)

C_COLLECTION:C1488(error_c)

$errorMessage_t:=$1

If (error_c=Null:C1517)
	
	error_c:=New collection:C1472()
	
End if 

error_c.push(New object:C1471("message";$errorMessage_t;"date";Timestamp:C1445))
