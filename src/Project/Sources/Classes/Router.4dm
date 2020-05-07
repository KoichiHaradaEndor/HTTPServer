/**
* Router class.
*
* @author HARADA Koichi
*/

Class extends Route

Class constructor
	
	This:C1470.routes:=New collection:C1472()
	
Function route
	
/**
* This method creates and returns an SingleRoute object,
* which you can then add handlers subsequently.
* 
* @param {Text} $1 The path for which the callback function is invoked
* @return {Object} SingleRoute object.
* @author: HARADA Koichi
*/
	
	C_TEXT:C284($1;$path_t)
	C_OBJECT:C1216($0;$route_o)
	
	$path_t:=$1
	$route_o:=cs:C1710.SingleRoute.new(This:C1470;$path_t)
	
	$0:=$route_o
	
	