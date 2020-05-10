//%attributes = {"invisible":true,"preemptive":"capable"}
/**
* This is versatile error handler method that
* will be installed by error_try method.
*
* @author HARADA Koichi
*/

C_LONGINT:C283(error)
C_COLLECTION:C1488(error_c)

C_LONGINT:C283($index_l)
C_COLLECTION:C1488($error_c)

ARRAY LONGINT:C221($errorCodes_al;0)
ARRAY TEXT:C222($components_at;0)
ARRAY TEXT:C222($messages_at;0)

GET LAST ERROR STACK:C1015(\
$errorCodes_al;\
$components_at;\
$messages_at\
)

$error_c:=New collection:C1472()
ARRAY TO COLLECTION:C1563($error_c;\
$errorCodes_al;"errorNumber";\
$components_at;"component";\
$messages_at;"messaage"\
)

If (error_c=Null:C1517)
	
	error_c:=New collection:C1472()
	
End if 

error_c:=error_c.concat($error_c)
