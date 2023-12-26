//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
/**
* https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURIComponent
*/

C_TEXT:C284($1;$toEncode_t)
C_TEXT:C284($0;$encoded_t)

C_COLLECTION:C1488($toEncode_c)
C_TEXT:C284($aChar_t;$notEscape_t)
C_BLOB:C604($utf8Code_x)
C_LONGINT:C283($i)

$toEncode_t:=$1
$encoded_t:=""

$notEscape_t:="[A-Z|a-z|0-9|\\-|_|\\.|!|~|\\*|'|\\(|\\)]"

$toEncode_c:=Split string:C1554($toEncode_t;"")
For each ($aChar_t;$toEncode_c)
	
	If (Match regex:C1019($notEscape_t;$aChar_t;1)=False:C215)
		
		CONVERT FROM TEXT:C1011($aChar_t;"UTF-8";$utf8Code_x)
		$aChar_t:=""
		For ($i;0;BLOB size:C605($utf8Code_x)-1)
			
			$aChar_t:=$aChar_t+"%"+Substring:C12(String:C10($utf8Code_x{$i};"&$");2)
			
		End for 
		
	End if 
	
	$encoded_t:=$encoded_t+$aChar_t
	
End for each 

$0:=$encoded_t