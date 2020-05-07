//%attributes = {"invisible":true,"preemptive":"capable"}
/**
* This method is used to initialize Storage for the specified Web Server.
*
* @param {Object} $1 Web server object
* @author HARADA Koichi
*/

C_OBJECT:C1216($1;$webServer_o)

C_TEXT:C284($key_t)

$webServer_o:=$1
$webServerName_t:=$webServer_o.name

Use (Storage:C1525)
	
	  //#####
	  // Web Server
	  //#####
	
	  // If the web server that has specified name has not
	  // been registered in the Storage, add one.
	
	If (Storage:C1525[$webServerName_t]=Null:C1517)
		
		Storage:C1525[$webServerName_t]:=New shared object:C1526()
		
		Use (Storage:C1525[$webServerName_t])
			
			  //#####
			  // Web Server component options
			  //#####
			
			Storage:C1525[$webServerName_t].componentOptions:=New shared object:C1526()
			
			  //#####
			  // Web Server options
			  //#####
			
			Storage:C1525[$webServerName_t].options:=New shared object:C1526()
			
			Use (Storage:C1525[$webServerName_t].options)
				
				For each ($key_t;$webServer_o)
					
					Case of 
						: ($key_t="isRunning")
						: ($key_t="name")
						: ($key_t="openSSLVersion")
						: ($key_t="perfectForwardSecrecy")
						Else 
							
							Storage:C1525[$webServerName_t].options[$key_t]:=$webServer_o[$key_t]
							
					End case 
					
				End for each 
				
			End use 
			
			  //#####
			  // Web Server hosts
			  //#####
			
			Storage:C1525[$webServerName_t].hosts:=New shared collection:C1527()
			Storage:C1525[$webServerName_t].hosts.push(New shared object:C1526())
			
			  // Initialize default host of the web server
			Use (Storage:C1525[$webServerName_t].hosts[0])
				
				Storage:C1525[$webServerName_t].hosts[0].hostname:=Storage:C1525.__constants__.defaultHostPattern
				Storage:C1525[$webServerName_t].hosts[0].routes:=New shared collection:C1527()
				
			End use 
			
		End use   // Use (Storage[$webServerName_t])
		
	End if   // If (Storage[$webServerName_t]=Null)
	
End use   // Use (Storage)
