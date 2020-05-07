//%attributes = {"invisible":true,"preemptive":"capable"}
/**
* This method installs error handler method and activate
* error handling.
* It should be called before any code that may 
* generate error.
*
* If error handler parameter is passed, it is installed
* as error handler. If it is omitted or empty string
* is passed, versatile error handler is used.
*
* @param {Text} $1 Error handler name (optional)
* @return {Text} $0 Previously installed error handler name
* @author HARADA Koichi
*/

C_TEXT:C284($1;$errorHandler_t)
C_TEXT:C284($0;$preInstalledHandler_t)

Case of 
	: (Count parameters:C259=0)
		
		$errorHandler_t:="error_handler"
		
	: ($1="")
		
		$errorHandler_t:="error_handler"
		
	Else 
		
		$errorHandler_t:=$1
		
End case 

$preInstalledHandler_t:=Method called on error:C704
ON ERR CALL:C155($errorHandler_t)

$0:=$preInstalledHandler_t
