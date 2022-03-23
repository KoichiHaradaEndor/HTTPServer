Class extends Authentication

Class constructor
	
	C_OBJECT:C1216($1; $configuration_o)
	
	$configuration_o:=$1
	
	Super:C1705($configuration_o)
	
	// Default Parameter Names
	This:C1470.parameter:=New object:C1471()
	This:C1470.parameter.usernameField:="username"
	This:C1470.parameter.passwordField:="password"
	
	Case of 
		: ($configuration_o.usernameField=Null:C1517)
		: (Value type:C1509($configuration_o.usernameField)#Is text:K8:3)
		Else 
			
			This:C1470.parameter.usernameField:=$configuration_o.usernameField
			
	End case 
	
	Case of 
		: ($configuration_o.passwordField=Null:C1517)
		: (Value type:C1509($configuration_o.passwordField)#Is text:K8:3)
		Else 
			
			This:C1470.parameter.passwordField:=$configuration_o.passwordField
			
	End case 
	
Function authenticate
	
	C_OBJECT:C1216($1)  // options
	C_OBJECT:C1216($0)  // formula
	
	// $options_o.successRedirect - path
	// $options_o.failureRedirect - path
	// $options_o.failureFlash - bool or message text, defaults to false
	// $options_o.successFlash - text
	// $options_o.session - bool, defaults to true
	
	If (Count parameters:C259>0)
		
		This:C1470.options:=$1
		
	Else 
		
		This:C1470.options:=New object:C1471
		
	End if 
	
	If (This:C1470.options.failureFlash=Null:C1517)
		
		This:C1470.options.failureFlash:=False:C215
		
	End if 
	
	If (This:C1470.options.session=Null:C1517)
		
		This:C1470.options.session:=True:C214
		
	End if 
	
	$0:=Formula:C1597(This:C1470.authFormula)
	
Function authFormula
	
	C_OBJECT:C1216($1; $request_o)
	C_OBJECT:C1216($2; $response_o)
	C_OBJECT:C1216($3; $next_o)
	
	C_TEXT:C284($usernameField_t; $username_t)
	C_TEXT:C284($passwordField_t; $password_t)
	C_OBJECT:C1216($result_o)
	
	$request_o:=$1
	$response_o:=$2
	$next_o:=$3
	
	// Retirieve username and password
	$usernameField_t:=This:C1470.parameter.usernameField
	$username_t:=$request_o.body[$usernameField_t]
	
	$passwordField_t:=This:C1470.parameter.passwordField
	$password_t:=$request_o.body[$passwordField_t]
	
	$result_o:=This:C1470.verifyCallback($username_t; $password_t)
	
	// $result_o may contain
	// .user : user info object when login succeeded, otherwise false is set
	// .error : error info object when server error occured
	// .message : flash message
	
	Case of 
		: ($result_o.error#Null:C1517)
			
			// Server error
			
		: ($result_o.user=False:C215)
			
			// Login failure
			
		: (Value type:C1509($result_o.user)=Is object:K8:27)
			
			// Login succeeded
			
	End case 
	