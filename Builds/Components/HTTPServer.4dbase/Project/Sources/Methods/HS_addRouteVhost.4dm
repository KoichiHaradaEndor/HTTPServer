//%attributes = {"invisible":true,"preemptive":"capable"}
/**
* This method is internally used.
*
* This method adds VirtualHost definition to the application.
*
* @param {Object} $1 HttpServer object
* @param {Object} $2 VirtualHost object
* @author HARADA Koichi
*/

C_OBJECT:C1216($1;$httpServer_o)
C_OBJECT:C1216($2;$vhost_o)

C_OBJECT:C1216($route_o;$param_o;$formula_o)

$httpServer_o:=$1
$vhost_o:=$2

For each ($route_o;$vhost_o.routes)
	
	$param_o:=New object:C1471(\
		"hostname";$vhost_o.hostname;\
		"method";$route_o.method;\
		"path";$route_o.path;\
		"callbacks";New collection:C1472($route_o.callback)\
		)
	
	$formula_o:=Formula:C1597(HS_addRoute )
	$formula_o.call($httpServer_o;$param_o)
	
End for each 
