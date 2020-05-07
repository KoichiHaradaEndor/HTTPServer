//%attributes = {"invisible":true,"preemptive":"capable"}
/**
* This method compares two text and returns true
* if both texts are equal. Comparison made case-sensitive.
*
* @param {Text} $1 Text to compare
* @param {Text} $2 Text to compare
* @return {Boolean} $0 True if they are equal
* @author HARADA Koichi
*/

C_TEXT:C284($1;$2)
C_BOOLEAN:C305($0;$equals_b)

$equals_b:=False:C215
Case of 
	: (Length:C16($1)#Length:C16($2))
		
	: (Position:C15($1;$2;*)=1)
		$equals_b:=True:C214
		
End case 

$0:=$equals_b
