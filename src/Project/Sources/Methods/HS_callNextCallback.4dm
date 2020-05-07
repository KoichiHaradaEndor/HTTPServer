//%attributes = {"invisible":true,"preemptive":"capable"}
/**
* This method is next() function passed to
* route handler callback method.
*
* @author HARADA Koichi
*/

C_LONGINT:C283($nextIndex_l;$length_l)
C_OBJECT:C1216($formula_o)

$formula_o:=This:C1470

$nextIndex_l:=$formula_o.index+1
$length_l:=$formula_o.formulas.length

If ($nextIndex_l<$length_l)
	
	$formula_o.index:=$nextIndex_l
	$formula_o.formulas[$formula_o.index].call($formula_o;$formula_o.request;$formula_o.response;$formula_o.next)
	
End if 
