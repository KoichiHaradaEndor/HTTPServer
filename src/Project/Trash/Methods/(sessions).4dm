//%attributes = {}
/*
* Session class
*
* Session class is used to manage web session.
*
* @Author: HARADA Koichi
*/

Class constructor
	
	C_OBJECT:C1216($1; $0)
	
	ASSERT:C1129(Count parameters:C259>0; "Session class constructor : parameteris missing.")
	ASSERT:C1129(Type:C295($1)=Is object:K8:27; "Session class constructor : parameter must be object type")
	ASSERT:C1129($1.secret#Null:C1517; "Session class constructor : option parameter must contain 'secret' attribute")
	
	This:C1470.options:=$1
	$0:=Formula:C1597(This:C1470.initialize)
	
Function initialize
	
	C_OBJECT:C1216($0)
	
	$0:=Formula:C1597(This:C1470.sessionStart)
	
Function sessionStart
	
	C_OBJECT:C1216($1; $request_o)
	C_OBJECT:C1216($2; $response_o)
	C_OBJECT:C1216($3; $next_o)
	
	C_OBJECT:C1216($options_o)
	ALERT:C41(JSON Stringify:C1217(This:C1470))
	$request_o:=$1
	$response_o:=$2
	$next_o:=$3
	
	$options_o:=This:C1470.options
	
	$cookie_o:=New object:C1471
	Case of 
		: ($options_o.cookie=Null:C1517)
		: (Value type:C1509($options_o.cookie)#Is object:K8:27)
		Else 
			
			$cookie_o:=$options_o.cookie
			
	End case 
	
	$name_t:="HttpServer.sid"
	Case of 
		: ($options_o.name=Null:C1517)
		: (Value type:C1509($options_o.name)#Is text:K8:3)
		Else 
			
			$name_t:=$options_o.name
			
	End case 
	
	$proxy_b:=False:C215
	Case of 
		: ($options_o.proxy=Null:C1517)
		: (Value type:C1509($options_o.proxy)#Is boolean:K8:9)
		Else 
			
			$proxy_b:=$options_o.proxy
			
	End case 
	
	$saveUninitialized_b:=False:C215
	Case of 
		: ($options_o.saveUninitialized=Null:C1517)
		: (Value type:C1509($options_o.saveUninitialized)#Is boolean:K8:9)
		Else 
			
			$saveUninitialized_b:=$options_o.saveUninitialized
			
	End case 
	
	Case of 
		: ($options_o.secret=Null:C1517)
		: (Value type:C1509($options_o.secret)=Is text:K8:3)
			
			$secret_t:=$options_o.secret
			
		: (Value type:C1509($options_o.secret)=Is collection:K8:32)
			
			$secret_c:=$options_o.secret
			
	End case 
	
	$store_o:=SS_MemoryStore
	Case of 
		: ($options_o.store=Null:C1517)
		: (OB Instance of:C1731($options_o.store; 4D:C1709.Function)=False:C215)
		Else 
			
			$store_o:=$options_o.store()
			
	End case 
	
	