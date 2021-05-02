//%attributes = {"invisible":true,"preemptive":"capable"}
/**
* This method is next() function passed to
* route handler callback method.
*
* @author HARADA Koichi
*/

C_LONGINT:C283($nextIndex_l; $length_l)
C_OBJECT:C1216($process_o)

$process_o:=This:C1470

$nextIndex_l:=$process_o.index+1
$length_l:=$process_o.formulas.length

If ($nextIndex_l<$length_l)
	
	$process_o.index:=$nextIndex_l
	
	$process_o.request.params:=$process_o.formulas[$process_o.index].params
	$process_o.request.baseUrl:=$process_o.formulas[$process_o.index].baseUrl
	
	$process_o.formulas[$process_o.index].callback.call($process_o; $process_o.request; $process_o.response; $process_o.next)
	
End if 
