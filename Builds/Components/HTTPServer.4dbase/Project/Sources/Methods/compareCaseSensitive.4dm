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

C_LONGINT:C283($i)

  // Following VDL's report, modified comparizon method
  // from using position to Character code
  // https://github.com/vdelachaux/tip-and-tricks/blob/master/docs/Diacritical%20comparison.md#benchmarking

  // *** Old way ***
  //$equals_b:=False
  //Case of 
  //: (Length($1)#Length($2))
  //: (Position($1;$2;*)=1)
  //$equals_b:=True
  //End case 

  // *** Optimized in 4D v18R3 ***
$equals_b:=(Length:C16($1)=Length:C16($2))
If ($equals_b)
	  //%R-
	For ($i;1;Length:C16($1))
		
		$equals_b:=$equals_b & (Character code:C91($1[[$i]])=Character code:C91($2[[$i]]))
		
	End for 
	  //%R+
End if 

$0:=$equals_b
