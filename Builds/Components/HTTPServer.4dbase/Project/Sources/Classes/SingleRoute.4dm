/**
* SingleRoute class
*
* DO NOT USE THIS CLASS DIRECTLY.
* THIS CLASS WILL BE INSTANTIATED INTERNALLY.
*
* This class is instantiated by route function of
* HttpServer, VirtualHost and Router class
* and is used to add request handler method for
* the same path, but for different HTTP method.
*
* @author HARADA Koichi
*/

Class extends Route

Class constructor
	
	C_OBJECT:C1216($1;$host_o)
	C_TEXT:C284($2;$path_t)
	
	$host_o:=$1  // HttpServer, VirtualHost or Router
	$path_t:=$2
	
	This:C1470.host:=$host_o
	This:C1470.path:=$path_t
	