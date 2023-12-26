//%attributes = {"invisible":true,"preemptive":"capable"}
/**
* This method is internally used.
*
* This method append Router item to host route.
*
* @param {Object} $1 Host object
* @param {Text} $2 Path
* @param {Object} $3 Router object
* @author HARADA Koichi
*/

C_OBJECT:C1216($1; $host_o)
C_TEXT:C284($2; $pathHost_t)
C_OBJECT:C1216($3; $router_o)

C_OBJECT:C1216($param_o; $formula_o; $route_o)
C_TEXT:C284($pathRouter_t)

$host_o:=$1
$pathHost_t:=$2
$router_o:=$3

// removes the last "/"
While ($pathHost_t="@/")
	
	$pathHost_t:=Substring:C12($pathHost_t; 1; Length:C16($pathHost_t)-1)
	
End while 

For each ($route_o; $router_o.routes)
	
	$pathRouter_t:=$route_o.path
	
	If ($pathRouter_t#"/@")
		
		$pathRouter_t:="/"+$pathRouter_t
		
	End if 
	
	$param_o:=New object:C1471(\
		"method"; $route_o.method; \
		"path"; $pathHost_t+$pathRouter_t; \
		"callbacks"; New collection:C1472($route_o.callback); \
		"baseUrl"; $pathHost_t\
		)
	// added baseUrl attribute to implement request.baseUrl
	// 2021/05/02 by Koichi
	
	$formula_o:=Formula:C1597(HS_addRoute)
	$formula_o.call($host_o; $param_o)
	
End for each 
