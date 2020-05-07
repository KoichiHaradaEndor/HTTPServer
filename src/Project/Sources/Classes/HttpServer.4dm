/**
* HttpServer class
*
* This is main application class that contains functions for
* starting/stopping HTTP server, and routing functions that
* inherit from Route class.
* 
* @author HARADA Koichi
*/

Class extends Route

Class constructor
	
/**
* The first parameter is caller database's web server object
* returned with "Web Server" command which is imeplemented
* starting from 4D v18R3.
* The (optional) second parameter is an object that contains
* parameters of the web server. For details, please refer to
* Web Server command 4D reference.
*
* @param {Object} $1 Web Server object
* @param {Object} $2 Web Server options
*/
	
	C_OBJECT:C1216($1;$2)
	
	C_LONGINT:C283($numParams_l)
	
	$numParams_l:=Count parameters:C259
	
	ASSERT:C1129($numParams_l>=1;"Lack of parameters")
	ASSERT:C1129(Value type:C1509($1)=Is object:K8:27;"The first parameter must be web server object")
	ASSERT:C1129($1.certificateFolder#Null:C1517;"The first parameter must be web server object")
	
	This:C1470.webServer:=$1
	
	HS_initStorageCommon 
	HS_initStorageWebServer (This:C1470.webServer)
	
	If ($numParams_l>=2)
		
		ASSERT:C1129(Value type:C1509($2)=Is object:K8:27;"The second parameter must be object type")
		
		This:C1470.setOption($2)
		
	End if 
	
Function start
	
/**
* This function is called to start HTTP server.
* 
* @return {Object} $0 Result message
* @author: HARADA Koichi
*/
	
	C_OBJECT:C1216($0;$result_o)
	
	$result_o:=New object:C1471()
	Case of 
		: (This:C1470.webServer.isRunning)
			
			$result_o.success:=False:C215
			$result_o.errors:=New collection:C1472(\
				New object:C1471(\
				"componentSignature";"4DRT";\
				"errCode";-10744;\
				"message";"Web Server is already running."\
				))
			
		: (Storage:C1525[This:C1470.webServer.name].options=Null:C1517)
			
			$result_o:=This:C1470.webServer.start()
			
		Else 
			
			$result_o:=This:C1470.webServer.start(Storage:C1525[This:C1470.webServer.name].options)
			
	End case 
	
	$0:=$result_o
	
Function stop
	
/**
* This function is called to stop HTTP server.
* 
* @author: HARADA Koichi
*/
	
	If (This:C1470.webServer.isRunning)
		
		This:C1470.webServer.stop()
		
	End if 
	
Function restart
	
/**
* This function is called to restart HTTP server.
* 
* @return {Object} $0 Result message
* @author: HARADA Koichi
*/
	
	C_TEXT:C284($0;result_o)
	
	This:C1470.stop()
	result_o:=This:C1470.start()
	
	$0:=result_o
	
Function setOption
	
/**
* This function is used to set HTTP server option(s).
* For available key names list, please refer to
* the 4D's Web Server command reference.
*
* This will overwrite the values of the each option.
* Even when passing options object, it will not replace
* options object with the one passed, but overwrite
* the values that has the same key.
*
* The key "dynamicFolder" is an addition to the available keys.
* The value of the key is used by this component, not by
* Web server. It defines the folder where the component
* look for files to make response.
*
* HttpServer.setOption(option)
* @param {Object} $1 Object that contains web server options
* 
* HttpServer.setOption(key; value)
* @param {Text} $1 Option name
* @param {Variant} $2 Option value
*
* @author: HARADA Koichi
*/
	
	C_VARIANT:C1683($1)
	C_VARIANT:C1683($2)
	
	C_LONGINT:C283($numParams_l;$mibenum_l)
	C_TEXT:C284($key_t)
	C_OBJECT:C1216($options_o)
	
	$numParams_l:=Count parameters:C259
	
	$options_o:=Storage:C1525[This:C1470.webServer.name].options
	
	Case of 
		: ($numParams_l=1)
			
			ASSERT:C1129(Value type:C1509($1)=Is object:K8:27;"The first parameter must be web server object")
			
			Use ($options_o)
				
				For each ($key_t;$1)
					
					  // Ignores keys that is not allowed overwrite.
					Case of 
						: ($key_t="isRunning")
						: ($key_t="name")
						: ($key_t="openSSLVersion")
						: ($key_t="perfectForwardSecrecy")
						: ($key_t="dynamicFolder")
							
							This:C1470.setDynamicFolder($1[$key_t])
							
						: ($key_t="characterSet") & (Value type:C1509($1[$key_t])=Is text:K8:3)
							
							$mibenum_l:=charSetNameToMIBEnum ($1[$key_t])
							If ($mibenum_l#0)
								
								$options_o[$key_t]:=$mibenum_l
								
							End if 
							
						Else 
							
							$options_o[$key_t]:=$1[$key_t]
							
					End case 
					
				End for each 
				
			End use 
			
		: ($numParams_l=2)
			
			ASSERT:C1129(Value type:C1509($1)=Is text:K8:3;"The first parameter must be a key")
			
			$key_t:=$1
			
			Use ($options_o)
				
				Case of 
					: ($key_t="isRunning")
					: ($key_t="name")
					: ($key_t="openSSLVersion")
					: ($key_t="perfectForwardSecrecy")
					: ($key_t="dynamicFolder")
						
						This:C1470.setDynamicFolder($2)
						
					: ($key_t="characterSet") & (Value type:C1509($2)=Is text:K8:3)
						
						$mibenum_l:=charSetNameToMIBEnum ($2)
						If ($mibenum_l#0)
							
							$options_o[$key_t]:=$mibenum_l
							
						End if 
						
					Else 
						
						$options_o[$key_t]:=$2
						
				End case 
				
			End use 
			
	End case 
	
Function getOption
	
/**
* This function returns web server option previously set
* in this class.
*
* If no parameter was passed, it returns option object.
* If key parameter is passed, it will return the value
* that corresponds to the key.
*
* HttpServer.getOption()
* @return {Object} $0 Option object
*
* HttpServer.getOption(key)
* @param {Text} $1 Key value of the option to get
* @return {Object} $0 Option value
*
* @author HARADA Koichi
* 
*/
	
	C_TEXT:C284($1)  // Key
	C_VARIANT:C1683($0)
	
	C_LONGINT:C283($numParams_l)
	
	$numParams_l:=Count parameters:C259
	
	Case of 
		: (Storage:C1525[This:C1470.webServer.name].options=Null:C1517)
			
		: ($numParams_l=0)
			
			$0:=Storage:C1525[This:C1470.webServer.name].options
			
		: (Storage:C1525[This:C1470.webServer.name].options[$1]=Null:C1517)
			
		Else 
			
			$0:=Storage:C1525[This:C1470.webServer.name].options[$1]
			
	End case 
	
Function setDynamicFolder
	
/**
* This function is used to set dynamic contents folder.
* When this component is used in the host database,
* the path can be either filesystem path, POSIX path or platform path.
* When this component is used in the other component,
* the path must not be filesystem path but POSIX path or platform path.
*
* @param {Object} $1 Folder object to the dynamic folder
* @author HARADA Koichi
*/
	
	C_OBJECT:C1216($1)
	
	ASSERT:C1129(OB Instance of:C1731($1;4D:C1709.Folder);"The parameter must be of type 4D.Folder.")
	
	Use (Storage:C1525[This:C1470.webServer.name].componentOptions)
		
		Storage:C1525[This:C1470.webServer.name].componentOptions.dynamicFolder:=$1
		
	End use 
	
Function getDynamicFolder
	
/**
* This function is used to retrieve current dynamicFolder object
* setting.
*
* @return {Object} $0 Folder object to the dynamic folder
* @author HARADA Koichi
*/
	
	$0:=Storage:C1525[This:C1470.webServer.name].componentOptions.dynamicFolder
	
Function route
	
/**
* This method creates and returns an SingleRoute object,
* which you can then add handlers subsequently.
* 
* @param {Text} $1 The path for which the callback function is invoked
* @return {Object} SingleRoute object.
* @author: HARADA Koichi
*/
	
	C_TEXT:C284($1;$path_t)
	C_OBJECT:C1216($0;$route_o)
	
	$path_t:=$1
	$route_o:=cs:C1710.SingleRoute.new(This:C1470;$path_t)
	
	$0:=$route_o
	
Function clearRoutes
	
/**
* This function is used to clear the routes
* registered in this component's Storage.
* By using this, you can clear the routes
* definition then add them again from start.
* This is intended to use development phase.
*
* @author HARADA Koichi
*/
	
	Use (Storage:C1525[This:C1470.webServer.name].hosts)
		
		Storage:C1525[This:C1470.webServer.name].hosts:=New shared collection:C1527()
		
	End use 
	