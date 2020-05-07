//%attributes = {"invisible":true,"preemptive":"capable"}
/**
* This is versatile error handler method that
* will be installed by error_try method.
*
* @author HARADA Koichi
*/

C_LONGINT:C283(error)

C_LONGINT:C283($index_l)

ARRAY LONGINT:C221($errorCodes_al;0)
ARRAY TEXT:C222($components_at;0)
ARRAY TEXT:C222($messages_at;0)

GET LAST ERROR STACK:C1015(\
$errorCodes_al;\
$components_at;\
$messages_at\
)

$index_l:=Find in array:C230($errorCodes_al;error)
If ($index_l>0)
	
	error_throw ($messages_at{$index_l})
	
Else 
	
	error_throw ("Error code: "+String:C10(error))
	
End if 
