/**
* Authentication class
*
* Root class for other authentication methods
* 
* @author HARADA Koichi
*/

Class constructor
	
	C_OBJECT:C1216($1; $configuration_o)
	
	This:C1470.verifyCallback:=New object:C1471()
	
	If (Count parameters:C259>0)
		
		$configuration_o:=$1
		
		Case of 
			: ($configuration_o.verifyCallback=Null:C1517)
			: (OB Instance of:C1731($configuration_o.verifyCallback; 4D:C1709.Function)=False:C215)
			Else 
				
				This:C1470.verifyCallback:=$configuration_o.verifyCallback
				
		End case 
		
	End if 
	
	