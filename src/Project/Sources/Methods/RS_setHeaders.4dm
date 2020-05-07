//%attributes = {"invisible":true,"preemptive":"capable"}
/**
* This method sets HTTP response headers
* that already registered in Response.__headers__
* before sending resonse to the client.
*
* This method is not Response member function
* but uses This object to access Response.__headers__
* collection. So this must be called via Formula.call
* or Formula.apply with This argument.
*
* @author HARADA Koichi
*/

C_COLLECTION:C1488($headers_c;$indices_c)
C_OBJECT:C1216($headerItem_o)
C_LONGINT:C283($index_l)

$headers_c:=This:C1470.__headers__

  // X-VERSION and X-STATUS must be first and second of
  // the elements respectively.

$indices_c:=$headers_c.indices("name = :1";"X-STATUS")
If ($indices_c.length>0)
	
	$index_l:=$indices_c[0]
	$headerItem_o:=$headers_c[$index_l]
	$headers_c.remove($index_l)
	$headers_c.unshift($headerItem_o)
	
End if 

$indices_c:=$headers_c.indices("name = :1";"X-VERSION")
If ($indices_c.length>0)
	
	$index_l:=$indices_c[0]
	$headerItem_o:=$headers_c[$index_l]
	$headers_c.remove($index_l)
	$headers_c.unshift($headerItem_o)
	
End if 

ARRAY TEXT:C222($names_at;0)
ARRAY TEXT:C222($values_at;0)

COLLECTION TO ARRAY:C1562($headers_c;$names_at;"name";$values_at;"value")
WEB SET HTTP HEADER:C660($names_at;$values_at)
