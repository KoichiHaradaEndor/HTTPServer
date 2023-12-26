/**
* Request class
*
* DO NOT USE THIS CLASS DIRECTLY.
* THIS CLASS WILL BE INSTANTIATED INTERNALLY.
*
* For more details, please refer to {@link Request.About Request Object}.
*
* @author: HARADA Koichi
*/

Class constructor
	
/**
* @param {Text} $1 IP address of the request sender
* @param {Text} $2 IP address of the server that receives the request
* @return {Object} $0 Request object
*/
	
	C_TEXT:C284($1; $ipClient_t)
	C_TEXT:C284($2; $ipServer_t)
	
	C_COLLECTION:C1488($headers_c; $queryResult_c; $cookies_c; $aCookie_c; $splitResult_c)
	C_TEXT:C284($contentType_t; $body_t; $cookie_t; $pattern_t; $uri_t; $queryString_t)
	C_BOOLEAN:C305($matched_b)
	
	$ipClient_t:=$1
	$ipServer_t:=$2
	
	This:C1470.__ipClient__:=$ipClient_t
	This:C1470.__ipServer__:=$ipServer_t
	
	//#####
	// Properties
	//#####
	
	// Retrieves request header information
	// Stores header collection into request object for later use
	This:C1470.__headers__:=New collection:C1472()
	ARRAY TEXT:C222($headerNames_at; 0)
	ARRAY TEXT:C222($headerValues_at; 0)
	WEB GET HTTP HEADER:C697($headerNames_at; $headerValues_at)
	ARRAY TO COLLECTION:C1563(This:C1470.__headers__; $headerNames_at; "name"; $headerValues_at; "value")
	$headers_c:=This:C1470.__headers__
	
	//#####
	// Request.body
	//#####
	$queryResult_c:=$headers_c.query("name = :1"; "Content-Type")
	SET TEXT TO PASTEBOARD:C523(JSON Stringify:C1217($queryResult_c))
	If ($queryResult_c.length>0)
		
		$contentType_t:=$queryResult_c[0].value
		SET TEXT TO PASTEBOARD:C523($contentType_t)
		Case of 
			: ($contentType_t="application/x-www-form-urlencoded")
				
				This:C1470.body:=RQ_parseWebVariables
				
			: (($contentType_t="application/json") | ($contentType_t="application/json; charset=UTF-8"))
				// modified by Koichi on 2023/12/26
				// content-type may be "application/json; charset=UTF-8"
				
				WEB GET HTTP BODY:C814($body_t)
				Case of 
					: (Length:C16($body_t)=0)
						
					: ($body_t[[1]]="{")  // Object structure
						
						This:C1470.body:=New object:C1471()
						This:C1470.body:=JSON Parse:C1218($body_t)
						
					: ($body_t[[1]]="[")  // Array structure
						
						ARRAY OBJECT:C1221($objects_ao; 0)
						JSON PARSE ARRAY:C1219($body_t; $objects_ao)
						This:C1470.body:=New collection:C1472()
						ARRAY TO COLLECTION:C1563(This:C1470.body; $objects_ao)
						
				End case 
				
		End case 
		
	End if 
	
	//#####
	// Request.cookies
	//#####
	This:C1470.cookies:=New object:C1471()
	$queryResult_c:=$headers_c.query("name = :1"; "Cookie")
	If ($queryResult_c.length>0)
		
		$cookies_c:=Split string:C1554($queryResult_c[0].value; ";"; sk ignore empty strings:K86:1+sk trim spaces:K86:2)
		For each ($cookie_t; $cookies_c)
			
			$aCookie_c:=Split string:C1554($cookie_t; "="; sk trim spaces:K86:2)
			Case of 
				: ($aCookie_c.length=1)
					This:C1470.cookies[$aCookie_c[0]]:=""
					
				: ($aCookie_c.length=2)
					This:C1470.cookies[$aCookie_c[0]]:=decodeURIComponent($aCookie_c[1])
					
			End case 
			
		End for each 
		
	End if 
	
	//#####
	// Request.hostname
	//#####
	This:C1470.hostname:=""
	$queryResult_c:=$headers_c.query("name = :1"; "Host")
	If ($queryResult_c.length>0)
		
		// removes port number part
		$splitResult_c:=Split string:C1554($queryResult_c[0].value; ":"; sk ignore empty strings:K86:1+sk trim spaces:K86:2)
		This:C1470.hostname:=$splitResult_c[0]
		
	End if 
	
	//#####
	// Request.ip
	//#####
	This:C1470.ip:=$ipClient_t
	
	//#####
	// Request.method
	//#####
	This:C1470.method:=""
	$queryResult_c:=$headers_c.query("name = :1"; "X-METHOD")
	If ($queryResult_c.length>0)
		
		This:C1470.method:=$queryResult_c[0].value
		
	End if 
	
	//#####
	// Request.path
	//#####
	This:C1470.path:=""
	$queryResult_c:=$headers_c.query("name = :1"; "X-URL")
	If ($queryResult_c.length>0)
		
		$pattern_t:="^(.*?)(?:\\?.*)?(?:#.*)?$"
		ARRAY LONGINT:C221($positions_al; 0)
		ARRAY LONGINT:C221($lengths_al; 0)
		$matched_b:=Match regex:C1019($pattern_t; $queryResult_c[0].value; 1; $positions_al; $lengths_al)
		If ($matched_b)
			
			This:C1470.path:=Substring:C12($queryResult_c[0].value; $positions_al{1}; $lengths_al{1})
			
		End if 
		
	End if 
	
	//#####
	// Request.protocol
	//#####
	This:C1470.protocol:=Choose:C955(WEB Is secured connection:C698; "https"; "http")
	
	//#####
	// Request.query
	//#####
	This:C1470.query:=New object:C1471()
	$queryResult_c:=$headers_c.query("name = :1"; "X-URL")
	If ($queryResult_c.length>0)
		
		$uri_t:=$queryResult_c[0].value
		
		// Removes fragment part (just in case)
		$position_l:=Position:C15("#"; $uri_t; *)
		If ($position_l>0)
			$uri_t:=Substring:C12($uri_t; 1; $position_l-1)
		End if 
		
		$pattern_t:="^(?:.*?)(\\?.+?)(?:#.*)?$"  // to find query string part
		ARRAY LONGINT:C221($position_al; 0)
		ARRAY LONGINT:C221($length_al; 0)
		
		$matched_b:=Match regex:C1019($pattern_t; $uri_t; 1; $position_al; $length_al)
		If ($matched_b)
			
			If (This:C1470.method="GET")
				This:C1470.query:=RQ_parseWebVariables()
			Else   // When the HTTP method is PUT or POST for instance
				$queryString_t:=Substring:C12($uri_t; $position_al{1}; $length_al{1})
				This:C1470.query:=RQ_parseWebVariablesManual($queryString_t)
			End if 
			
		End if 
		
	End if 
	
	//#####
	// Request.secure
	//#####
	This:C1470.secure:=WEB Is secured connection:C698
	
	//#####
	// Request.xhr
	//#####
	This:C1470.xhr:=False:C215
	$queryResult_c:=$headers_c.query("name = :1"; "X-Requested-With")
	If ($queryResult_c.length>0)
		
		This:C1470.xhr:=($queryResult_c[0].value="XMLHttpRequest")
		
	End if 
	
Function accepts
	
/**
* This function checks if the specified content types are acceptable,
* based on the request's Accept HTTP header field. The method
* returns the best match, or none of the specified content types is
* acceptable, returns empty string. In this case, the app should
* return 406 Not Acceptable.
*
* ex:
* Accept: text/html;q=.5, application/json
* mimetype list: ["application/json"; "text/html"]
* Then application/json is returned because it has high prority.
*/
	
	C_VARIANT:C1683($1)
	C_TEXT:C284($0; $matchedMimeType_t)
	
	C_LONGINT:C283($type_l)
	C_COLLECTION:C1488($candidates_c; $queryResult_c; $items_c; $parts_c; $acceptList_c)
	C_TEXT:C284($accept_t; $item_t; $pattern_t)
	C_REAL:C285($priority_r)
	C_OBJECT:C1216($item_o)
	
	$matchedMimeType_t:=""
	
	$type_l:=Value type:C1509($1)
	
	Case of 
		: ($type_l=Is text:K8:3)
			
			$candidates_c:=New collection:C1472($1)
			
		: ($type_l=Is collection:K8:32)
			
			$candidates_c:=$1
			
	End case 
	
	// construct Accept header collection
	$queryResult_c:=This:C1470.__headers__.query("name = :1"; "Accept")
	If ($queryResult_c.length>0)
		
		// $accept_t: something like text/*;q=.5, application/json
		$accept_t:=$queryResult_c[0].value
		
		// $items_c: ["text/*;q=.5"; "application/json"]
		$items_c:=Split string:C1554($accept_t; ","; sk ignore empty strings:K86:1+sk trim spaces:K86:2)
		
		$acceptList_c:=New collection:C1472()
		For each ($item_t; $items_c)
			
			// $item_t: "text/*;q=.5"
			// $parts_c: ["text/*"; "q=.5"] or [application/json]
			$parts_c:=Split string:C1554($item_t; ";"; sk ignore empty strings:K86:1+sk trim spaces:K86:2)
			Case of 
				: ($parts_c.length=1)
					
					$priority_r:=1
					$pattern_t:=Replace string:C233($parts_c[0]; "*"; "@")
					$acceptList_c.push(New object:C1471("mimetype"; $parts_c[0]; "priority"; $priority_r; "pattern"; $pattern_t))
					
				: ($parts_c.length=2)
					
					$priority_r:=Num:C11($parts_c[1])
					$pattern_t:=Replace string:C233($parts_c[0]; "*"; "@")
					$acceptList_c.push(New object:C1471("mimetype"; $parts_c[0]; "priority"; $priority_r; "pattern"; $pattern_t))
					
			End case 
			
		End for each 
		
		// sort by priority, when priority is the same value, more precise item has priority
		$acceptList_c.sort("RQ_sortAccept")
		
		// then execute query
		For each ($item_o; $acceptList_c) Until ($matchedMimeType_t#"")
			
			$pattern_t:=$item_o.pattern
			$matchedMimeType_t:=$candidates_c.find("RQ_findAccept"; $pattern_t)
			
		End for each 
		
	End if 
	
	$0:=$matchedMimeType_t
	
Function get
	
/**
* This method returns http request header field
* value.
*
* @param {Text} $1 Request header field name
* @return {Text} $0 Request header field value
*/
	
	C_TEXT:C284($1; $name_t)
	C_TEXT:C284($0; $value_t)
	
	C_COLLECTION:C1488($queryResult_c)
	
	$name_t:=$1
	$value_t:=""
	
	$queryResult_c:=This:C1470.__headers__.query("name = :1"; $name_t)
	If ($queryResult_c.length>0)
		
		$value_t:=$queryResult_c[0].value
		
	End if 
	
	$0:=$value_t
	