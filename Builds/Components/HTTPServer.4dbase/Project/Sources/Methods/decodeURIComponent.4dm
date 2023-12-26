//%attributes = {"invisible":true,"shared":true,"preemptive":"capable"}
/**
* This method is used to decode a text encoded with encodeURIComponent.
*
* @param {Text} $1 Text to decode
* @return {Text} $0 Decoded text
* @author HARDA Koichi
*/

C_TEXT:C284($1;$textToDecode_t)
C_TEXT:C284($0;$decodedText_t)

C_BLOB:C604($buffer_x)
C_LONGINT:C283($i;$length_l;$numPercent_l;$resultBlobSize_l;$blobIndex_l)
C_TEXT:C284($removedPercent_t;$aChar_t)

$textToDecode_t:=$1

$length_l:=Length:C16($textToDecode_t)

  // count number of "%"
$removedPercent_t:=Replace string:C233($textToDecode_t;"%";"")
$numPercent_l:=$length_l-Length:C16($removedPercent_t)

  // then decoded blob size should be
$resultBlobSize_l:=$length_l-($numPercent_l*2)

SET BLOB SIZE:C606($buffer_x;$resultBlobSize_l;0x0000)

$blobIndex_l:=0
For ($i;1;$length_l)
	
	$aChar_t:=$textToDecode_t[[$i]]
	
	Case of 
		: ($aChar_t#"%")
			
			$buffer_x{$blobIndex_l}:=Character code:C91($aChar_t)
			
		: ($i>($length_l-2))
			
			  // if there are not at least 2 characters after the current position
			  // it cannot be %xx
			
		Else 
			
			$buffer_x{$blobIndex_l}:=(Position:C15($textToDecode_t[[$i+1]];"123456789ABCDEF") << 4)+Position:C15($textToDecode_t[[$i+2]];"123456789ABCDEF")
			$i:=$i+2
			
	End case 
	
	$blobIndex_l:=$blobIndex_l+1
	
End for 

$decodedText_t:=Convert to text:C1012($buffer_x;"utf-8")

$0:=$decodedText_t
