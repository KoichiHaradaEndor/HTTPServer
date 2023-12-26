//%attributes = {"invisible":true,"preemptive":"capable"}
/**
* This method removes the specified HTTP response
* header field.
*
* This method is not Response member function
* but uses This object to access Response.__headers__
* collection. So it must be called via Formula.call
* or Formula.apply with This argument.
*
* @param {Text} $1 Field name to remove
* @return {Object} $0 Request object
* @author HARADA Koichi
*/

C_TEXT:C284($1;$fieldName_t)
C_OBJECT:C1216($0)

$fieldName_t:=$1

This:C1470.__headers__:=This:C1470.__headers__.query("name != :1";$fieldName_t)

$0:=This:C1470
