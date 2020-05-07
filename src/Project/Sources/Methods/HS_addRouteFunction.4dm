//%attributes = {"invisible":true,"preemptive":"capable"}
/**
* This method is internally used.
*
* This method append Function item to host route.
*
* @param {Object} $1 Host object
* @param {Text} $2 Path
* @param {Object} $3 Function object
* @author HARADA Koichi
*/

C_OBJECT:C1216($1;$host_o)
C_TEXT:C284($2;$path_t)
C_OBJECT:C1216($3;$function_o)

C_OBJECT:C1216($param_o;$formula_o)

$host_o:=$1
$path_t:=$2
$function_o:=$3

$method_t:="use"

$param_o:=New object:C1471(\
"method";$method_t;\
"path";$path_t;\
"callbacks";New collection:C1472($function_o)\
)

$formula_o:=Formula:C1597(HS_addRoute )
$formula_o.call($host_o;$param_o)
