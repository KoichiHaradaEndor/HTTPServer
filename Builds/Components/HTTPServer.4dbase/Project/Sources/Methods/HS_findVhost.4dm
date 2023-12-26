//%attributes = {"invisible":true,"preemptive":"capable"}
/**
* This method finds vhost that matches given host name
*
* @param {Object} $1 Given by collection.find function
* @param {Text} $2 Host name to search
* @param {Booolean} $3 Use regex if true
* @author HARADA Koichi
*/

C_OBJECT:C1216($1)
C_TEXT:C284($2;$hostname_t)
C_BOOLEAN:C305($3;$useRegex_b)

C_OBJECT:C1216($host_o)

ASSERT:C1129(Value type:C1509($1.value)=Is object:K8:27)

$host_o:=$1.value
$hostname_t:=$2
$useRegex_b:=$3

If ($useRegex_b)
	
	$1.result:=Match regex:C1019($host_o.hostname;$hostname_t;1)
	
Else 
	
	$1.result:=($host_o.hostname=$hostname_t)
	
End if 
