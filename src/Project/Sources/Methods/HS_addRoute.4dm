//%attributes = {"invisible":true,"preemptive":"capable"}
/**
* This is a generic method used to add a route to the host object.
*
* Storage.hosts is a collection that consists of the host objects.
* <pre>
* Storage.{ServerName}.hosts[{host}]
* </pre>
*
* The sructure of the host object is as follow:
* <pre>
* {
*     hostname : {Text} regular expression pattern used to search by Host request header value
*     routes : [{
*         method : {Text} used to search by HTTP method value 
*         path : {Text} regular expression pattern used to search by request path
*         callback : {Object} formula reference which is called when above conditions are match
*         params : {Collection} collection of keys used for path parameter
*     }]
* }
* </pre>
* 
* @param {Object} $1 Parameters whose structure is
* {
*     "hostname": {Text} Host name, this is needed when registering VirtualHost to HttpServer
*     "method": {Text} HTTP method or flag,
*     "path": {Text} The path for which the callback function is invoked
*     "baseUrl": {Text} The path for which the middleware is mounted
*     "callbacks": {Collection} Collection of callback functions
* }
* @author: HARADA Koichi
*/

C_OBJECT:C1216($1; $param_o)

C_TEXT:C284($hostname_t; $method_t; $path_t; $pattern_t; $param_t; $pathParam_t; $serverName_t; $baseUrl_t)
C_COLLECTION:C1488($callbacks_c; $pathParams_c)
C_OBJECT:C1216($host_o; $callback_o; $routeItem_o)
C_LONGINT:C283($start_l; $index_l; $insertionPosition_l)
C_BOOLEAN:C305($matched_b)

$param_o:=$1

If ($param_o.hostname#Null:C1517)
	
	$hostname_t:=$param_o.hostname
	
End if 

If ($param_o.method#Null:C1517)
	
	$method_t:=$param_o.method
	
End if 

If ($param_o.path#Null:C1517)
	
	$path_t:=$param_o.path
	
End if 

If ($param_o.callbacks#Null:C1517)
	
	$callbacks_c:=$param_o.callbacks
	
End if 

If ($param_o.baseUrl#Null:C1517)
	
	$baseUrl_t:=$param_o.baseUrl
	
End if 

//#####
// Regiter each path to host
//#####
If (OB Instance of:C1731(This:C1470; cs:C1710.HttpServer))
	
	//#####
	// convert path parameter item to Regex
	//#####
	If (Position:C15("/:"; $path_t)>0)
		
		// convert named path parameter to regex
		$pathParams_c:=New collection:C1472()
		$pattern_t:="/:([A-Za-z0-9_]+)(?:/|$)"  // look for /:param
		$start_l:=1
		Repeat 
			
			ARRAY LONGINT:C221($positions_al; 0)
			ARRAY LONGINT:C221($length_al; 0)
			$matched_b:=Match regex:C1019($pattern_t; $path_t; $start_l; $positions_al; $length_al)
			Case of 
				: (Length:C16($path_t)<$start_l)
					
				: ($matched_b)
					
					$param_t:=Substring:C12($path_t; $positions_al{1}; $length_al{1})
					$pathParams_c.push($param_t)
					$path_t:=Replace string:C233($path_t; ":"+$param_t; "([^/]+)"; 1; *)
					$start_l:=$start_l+$positions_al{1}+$length_al{1}
					
			End case 
			
			If (Length:C16($path_t)<=$start_l)
				$matched_b:=False:C215
			End if 
			
		Until ($matched_b=False:C215)
		
	End if 
	// /convert path parameter item to Regex
	
	//#####
	// convert path to Regex
	//#####
	Case of 
		: ($method_t="use")
			
			// forward match
			While ($path_t="@/")
				
				$path_t:=Substring:C12($path_t; 1; Length:C16($path_t)-1)
				
			End while 
			
			$path_t:="^"+$path_t+"(?:/[^/]+)*$"
			
		Else 
			
			// full match
			$path_t:="^"+$path_t+"$"
			
	End case 
	// /convert path to Regex
	
	
	//#####
	// convert baseUrl to Regex
	//#####
	If ($baseUrl_t#"")
		
		// forward match
		While ($baseUrl_t="@/")
			
			$baseUrl_t:=Substring:C12($baseUrl_t; 1; Length:C16($baseUrl_t)-1)
			
		End while 
		
		$baseUrl_t:="^("+$baseUrl_t+")(?:/[^/]+)*$"
		
	End if 
	// /convert baseUrl to Regex
	
	
	// When the caller object is HttpServer, add the route
	// directly to Storage.{ServerName}.hosts.
	
	If ($hostname_t="")
		
		$hostname_t:=Storage:C1525.__constants__.defaultHostPattern
		
	End if 
	
	// Find a host
	$serverName_t:=This:C1470.webServer.name
	Use (Storage:C1525[$serverName_t].hosts)
		
		// Search for hostname inside Storage.{ServerName}.hosts to find if it is already registered
		$index_l:=Storage:C1525[$serverName_t].hosts.findIndex("HS_findVhost"; $hostname_t; False:C215)
		
		If ($index_l=-1)
			
			// Such hostname was not previously registered, so add one.
			// To make default host is always the last element,
			// insert vhost at second from the last.
			$insertionPosition_l:=Storage:C1525[$serverName_t].hosts.length-1
			
			// vhost object is standard object. So it cannot be inserted directly into Storge.
			Storage:C1525[$serverName_t].hosts.insert($insertionPosition_l; New shared object:C1526())
			Storage:C1525[$serverName_t].hosts[$insertionPosition_l].hostname:=$hostname_t
			Storage:C1525[$serverName_t].hosts[$insertionPosition_l].routes:=New shared collection:C1527()
			
		Else 
			
			// match hostname was found
			$insertionPosition_l:=$index_l
			
		End if 
		
		$host_o:=Storage:C1525[$serverName_t].hosts[$insertionPosition_l]
		
		Use ($host_o)
			
			// If route never be added
			If ($host_o.routes=Null:C1517)
				
				$host_o.routes:=New shared collection:C1527()
				
			End if 
			
			Use ($host_o.routes)
				
				// Note:
				// Here I append shared object first, then assign values.
				// This way, formula object can be appended.
				// If values are assigned directly in New shared object(),
				// the newly created shared object and method formula
				// becomes group. And group cannot be a member of another
				// shared collection (in this case $host_o.routes).
				
				For each ($callback_o; $callbacks_c)
					
					$host_o.routes.push(New shared object:C1526())
					$routeItem_o:=$host_o.routes[$host_o.routes.length-1]
					$routeItem_o["method"]:=$method_t
					$routeItem_o["path"]:=$path_t
					$routeItem_o["callback"]:=$callback_o
					$routeItem_o["baseUrl"]:=$baseUrl_t
					
					If ($pathParams_c#Null:C1517)
						
						$routeItem_o["params"]:=New shared collection:C1527()
						For each ($pathParam_t; $pathParams_c)
							
							$routeItem_o["params"].push($pathParam_t)
							
						End for each 
						
					End if   // If ($pathParams_c#Null)
					
				End for each 
				
			End use   // Use ($host_o.routes)
			
		End use   // Use ($host_o) 
		
	End use   // Use (Storage[$serverName_t].hosts)
	
Else 
	
	// When the caller object is VirtualHost or Router, add the route
	// to This object.
	$host_o:=This:C1470
	
	// If route never be added
	If ($host_o.routes=Null:C1517)
		
		$host_o.routes:=New collection:C1472()
		
	End if 
	
	For each ($callback_o; $callbacks_c)
		
		$host_o.routes.push(New object:C1471())
		$routeItem_o:=$host_o.routes[$host_o.routes.length-1]
		$routeItem_o["method"]:=$method_t
		$routeItem_o["path"]:=$path_t
		$routeItem_o["callback"]:=$callback_o
		$routeItem_o["baseUrl"]:=$baseUrl_t
		
		// removed on 2021/05/02 by Koichi
		// 'cause $pathParams_c is always null
		//If ($pathParams_c#Null)
		//$routeItem_o["params"]:=$pathParams_c
		//End if 
		
	End for each 
	
End if 
