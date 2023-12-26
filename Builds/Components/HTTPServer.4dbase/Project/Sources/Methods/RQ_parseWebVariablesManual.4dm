//%attributes = {"invisible":true,"preemptive":"capable"}
/**
* This method is used to parse web variables.
* Instead of using WEB GET VARIABLES, it parses query string manually
* in order for parsing query string in PUT or POST method.
* (WEB GET VARIABLES parses body part when the method is PUT or POST.)
*
* Please refer to {@link Request.About Request Object#Request.query}
*
* @retuen {Object} $0 Parsed variable
*/

C_TEXT:C284($1; $queryString_t)
C_OBJECT:C1216($0; $parsedVariable_o)

C_COLLECTION:C1488($data_c)
C_TEXT:C284($pattern_t; $name_t; $value_t; $main_t; $sub_t)
C_OBJECT:C1216($eachItem_o)
C_BOOLEAN:C305($matched_b)
C_LONGINT:C283($startPosition_l)

$queryString_t:=$1
$parsedVariable_o:=New object:C1471()

$pattern_t:="(?:\\?|&)(.*?)=(.*?)(?:&|#|$)"
$startPosition_l:=1

ARRAY LONGINT:C221($position_al; 0)
ARRAY LONGINT:C221($length_al; 0)
$data_c:=New collection:C1472
While (Match regex:C1019($pattern_t; $queryString_t; $startPosition_l; $position_al; $length_al))
	$name_t:=Substring:C12($queryString_t; $position_al{1}; $length_al{1})
	$name_t:=decodeURIComponent($name_t)
	$value_t:=Substring:C12($queryString_t; $position_al{2}; $length_al{2})
	$value_t:=decodeURIComponent($value_t)
	$data_c.push(New object:C1471("name"; $name_t; "value"; $value_t))
	$startPosition_l:=$position_al{0}+$length_al{0}-1
End while 

$pattern_t:="^(.+)\\[(.*)\\]$"  // to find pair of brackets
For each ($eachItem_o; $data_c)
	
	$name_t:=$eachItem_o.name
	$value_t:=$eachItem_o.value
	
	ARRAY LONGINT:C221($positions_al; 0)
	ARRAY LONGINT:C221($lengths_al; 0)
	$matched_b:=Match regex:C1019($pattern_t; $name_t; 1; $positions_al; $lengths_al)
	If ($matched_b)
		
		// with brackets (main[sub])
		$main_t:=Substring:C12($name_t; $positions_al{1}; $lengths_al{1})
		$sub_t:=Substring:C12($name_t; $positions_al{2}; $lengths_al{2})
		If ($sub_t="")
			
			// when "sub" is empty, values are assigned as collection
			If ($parsedVariable_o[$main_t]=Null:C1517)
				
				$parsedVariable_o[$main_t]:=New collection:C1472()
				
			End if 
			
			$parsedVariable_o[$main_t].push($value_t)
			
		Else 
			
			// when "sub" is not empty, the value is assigned under main.sub
			If ($parsedVariable_o[$main_t]=Null:C1517)
				
				$parsedVariable_o[$main_t]:=New object:C1471()
				
			End if 
			
			$parsedVariable_o[$main_t][$sub_t]:=$value_t
			
		End if 
		
	Else 
		
		// no brackets
		$parsedVariable_o[$name_t]:=$value_t
		
	End if 
	
End for each 

$0:=$parsedVariable_o
