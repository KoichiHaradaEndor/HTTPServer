//%attributes = {"invisible":true,"preemptive":"capable"}
/**
* This method returns true if error was generated
* after calling error_try method.
*
* When this function is called, the current error
* handler is uninstalled. If next error handler method
* is passed, it is installed.
*
* @param {Text} $1 Next error handler method (optional)
* @return {Boolean} $0 true: error was generated, otherwise false
* @author HARADA Koichi
*/

C_TEXT:C284($1;$nextErrorHandler_t)
C_BOOLEAN:C305($0;$result_b)

C_COLLECTION:C1488(error_c)

If (Count parameters:C259=0)
	
	$nextErrorHandler_t:=""
	
Else 
	
	$nextErrorHandler_t:=$1
	
End if 

ON ERR CALL:C155($nextErrorHandler_t)

$result_b:=False:C215
Case of 
	: (error_c=Null:C1517)
		
	: (error_c.length=0)
		
	Else 
		
		$result_b:=True:C214
		
End case 

$0:=$result_b
