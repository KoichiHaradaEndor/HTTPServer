//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
/**
* This method is called in On Web Connection database method
* of the host database. Please pass Web Server object as the
* first parameter, then $3 and $4 arguments of the OWC database
* method to this method:
* {@code
* // On Web Connection database method
* C_TEXT($1;$2;$3;$4;$5;$6)
* OnWebConnection(Web Server;$3;$4)
* }
*
* Then this method does:
* - initialize Request and Response objects
* - find routes that matches the incoming request host, method and path
* - calls route handler methods with passing Request and Response objects
*
* @param {Object} $1 Web Server object
* @param {Text} $2 IP address of the request sender
* @param {Text} $3 IP address of the server that receives the request
*/

// * Note that do not use USE clause in this method since
// * I don't want to block other web processes
// * HttpServer configuration phase has already been finishied

C_OBJECT:C1216($1; $webServer_o)
C_TEXT:C284($2; $ipClient_t)
C_TEXT:C284($3; $ipServer_t)

C_OBJECT:C1216($request_o; $response_o; $host_o; $route_o; $process_o; $webServer_o; $params_o; $formula_o)
C_COLLECTION:C1488($hosts_c; $routes_c)
C_TEXT:C284($requestHost_t; $requestMethod_t; $requestPath_t; $webServerName_t)
C_TEXT:C284($routeMethod_t; $routePath_t; $name_t; $baseUrl_t)
C_BOOLEAN:C305($match_b)
C_LONGINT:C283($index_l)

$webServer_o:=$1
$ipClient_t:=$2
$ipServer_t:=$3

$request_o:=cs:C1710.Request.new($ipClient_t; $ipServer_t)
$response_o:=cs:C1710.Response.new($webServer_o; $request_o)

$webServerName_t:=$webServer_o.name
$hosts_c:=Storage:C1525[$webServerName_t].hosts

$requestHost_t:=$request_o.hostname
$requestMethod_t:=$request_o.method
$requestPath_t:=$request_o.path

// Find a Host that matches Host request header
If ($hosts_c.length=1)
	
	// only default host is present, use it
	$host_o:=$hosts_c[0]
	
Else 
	
	$host_o:=$hosts_c.find("HS_findVhost"; $requestHost_t; True:C214)
	
End if 

// Find routes that matches HTTP method and path
$process_o:=New object:C1471()
$process_o.index:=0
$process_o.formulas:=New collection:C1472()
$process_o.request:=$request_o
$process_o.response:=$response_o
$process_o.next:=Formula:C1597(HS_callNextCallback)

$routes_c:=$host_o.routes
For each ($route_o; $routes_c)
	
	$routeMethod_t:=$route_o.method
	$routePath_t:=$route_o.path
	
	If ($routeMethod_t="all") | ($routeMethod_t="use") | ($routeMethod_t=$requestMethod_t)
		
		ARRAY LONGINT:C221($positions_al; 0)
		ARRAY LONGINT:C221($lengths_al; 0)
		$match_b:=Match regex:C1019($routePath_t; $requestPath_t; 1; $positions_al; $lengths_al)
		If ($match_b)
			
			// retrieve path param
			$params_o:=New object:C1471()
			If ($route_o.params#Null:C1517)
				
				$index_l:=1
				For each ($name_t; $route_o.params) While (Size of array:C274($positions_al)>=$index_l)
					
					$params_o[$name_t]:=Substring:C12($requestPath_t; $positions_al{$index_l}; $lengths_al{$index_l})
					$index_l:=$index_l+1
					
				End for each 
				
			End if 
			
			// compute baseUrl
			$baseUrl_t:=""
			Case of 
				: ($route_o.baseUrl=Null:C1517)
				: ($route_o.baseUrl="")
				Else 
					
					ARRAY LONGINT:C221($positions_al; 0)
					ARRAY LONGINT:C221($lengths_al; 0)
					$match_b:=Match regex:C1019($route_o.baseUrl; $requestPath_t; 1; $positions_al; $lengths_al)
					If ($match_b) & (Size of array:C274($positions_al)>0)
						
						$baseUrl_t:=Substring:C12($requestPath_t; $positions_al{1}; $lengths_al{1})
						
					End if 
					
			End case 
			
			$process_o.formulas.push(New object:C1471(\
				"callback"; $route_o.callback; \
				"baseUrl"; $baseUrl_t; \
				"params"; $params_o))
			
		End if 
		
	End if 
	
End for each 

// Then execute callbacks
For each ($formula_o; $process_o.formulas) Until ($process_o.callNext=False:C215)
	
	$process_o.callNext:=False:C215  // This flag will be set to true when next() is called
	$request_o.params:=$formula_o.params
	$request_o.baseUrl:=$formula_o.baseUrl
	
	$formula_o.callback.call($process_o; $request_o; $response_o; $process_o.next)
	
End for each 
