//%attributes = {"invisible":true,"preemptive":"capable"}
/**
* This method is used to parse web variables.
*
* Please refer to {@link Request.About Request Object#Request.query}
*
* @retuen {Object} $0 Parsed variable
*/

C_OBJECT:C1216($0;$parsedVariable_o)

C_COLLECTION:C1488($data_c)
C_TEXT:C284($pattern_t;$name_t;$value_t;$main_t;$sub_t)
C_OBJECT:C1216($eachItem_o)
C_BOOLEAN:C305($matched_b)

$parsedVariable_o:=New object:C1471()

ARRAY TEXT:C222($dataNames_at;0)
ARRAY TEXT:C222($dataValues_at;0)
WEB GET VARIABLES:C683($dataNames_at;$dataValues_at)
$data_c:=New collection:C1472()
ARRAY TO COLLECTION:C1563($data_c;$dataNames_at;"name";$dataValues_at;"value")

$pattern_t:="^(.+)\\[(.*)\\]$"  // to find pair of brackets
For each ($eachItem_o;$data_c)
	
	$name_t:=$eachItem_o.name
	$value_t:=$eachItem_o.value
	
	ARRAY LONGINT:C221($positions_al;0)
	ARRAY LONGINT:C221($lengths_al;0)
	$matched_b:=Match regex:C1019($pattern_t;$name_t;1;$positions_al;$lengths_al)
	If ($matched_b)
		
		  // with brackets (main[sub])
		$main_t:=Substring:C12($name_t;$positions_al{1};$lengths_al{1})
		$sub_t:=Substring:C12($name_t;$positions_al{2};$lengths_al{2})
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
