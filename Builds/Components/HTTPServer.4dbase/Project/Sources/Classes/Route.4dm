/**
* DO NOT USE THIS CLASS DIRECTLY.
* THIS CLASS WILL BE INSTANTIATED INTERNALLY.
*
* This is basic Route class.
* It contains common routing functions.
* Any other routing class will inherit this class.
*
* @author HARADA Koichi
*/

Function all
	
/**
* This method routes HTTP requests for the caller host
* to the speified path with the specified callbacks.
* It will match all HTTP verbs.
* 
* This method has two forms:
*
* <h3>CallerObj.all(path; callback)</h3>
* 
* In this form, CallerObj can be HttpServer, VirtualHost or Router object.
* The path parameter is for which the callback function is invoked.
* The callback parameter can be object (single formula),
* collection (list of formula object) or combination of them.
*
* @param {Text} $1 The path for which the callback function is invoked
* @param {Variant} ${2} Callback functions
*
* <h3>CallerObj.all(callback)</h3>
* 
* In this form, CallerObj can be SingleRoute object.
* In this case, path parameter is stored in the object,
* so only callback parameter is needed.
*
* @param {Variant} ${1} Callback functions
* @return {Object} This object
* @author: HARADA Koichi
*/
	
	C_VARIANT:C1683(${1})
	C_OBJECT:C1216($0)
	
	C_TEXT:C284($method_t)
	C_LONGINT:C283($i)
	C_COLLECTION:C1488($params_c)
	
	$method_t:="all"
	
	$params_c:=New collection:C1472()
	$params_c.push($method_t)
	For ($i; 1; Count parameters:C259)
		
		$params_c.push(${$i})
		
	End for 
	
	$0:=This:C1470.method.apply(This:C1470; $params_c)
	
Function delete
	
/**
* This method routes HTTP DELETE requests for the caller host
* to the speified path with the specified callbacks.
* 
* This method has two forms:
*
* <h3>CallerObj.delete(path; callback)</h3>
* 
* In this form, CallerObj can be HttpServer, VirtualHost or Router object.
* The path parameter is for which the callback function is invoked.
* The callback parameter can be object (single formula),
* collection (list of formula object) or combination of them.
*
* @param {Text} $1 The path for which the callback function is invoked
* @param {Variant} ${2} Callback functions
*
* <h3>CallerObj.delete(callback)</h3>
* 
* In this form, CallerObj can be SingleRoute object.
* In this case, path parameter is stored in the object,
* so only callback parameter is needed.
*
* @param {Variant} ${1} Callback functions
* @return {Object} This object
* @author: HARADA Koichi
*/
	
	C_VARIANT:C1683(${1})
	C_OBJECT:C1216($0)
	
	C_TEXT:C284($method_t)
	C_LONGINT:C283($i)
	C_COLLECTION:C1488($params_c)
	
	$method_t:="delete"
	
	$params_c:=New collection:C1472()
	$params_c.push($method_t)
	For ($i; 1; Count parameters:C259)
		
		$params_c.push(${$i})
		
	End for 
	
	$0:=This:C1470.method.apply(This:C1470; $params_c)
	
Function get
	
/**
* This method routes HTTP GET requests for the caller host
* to the speified path with the specified callbacks.
* 
* This method has two forms:
*
* <h3>CallerObj.get(path; callback)</h3>
* 
* In this form, CallerObj can be HttpServer, VirtualHost or Router object.
* The path parameter is for which the callback function is invoked.
* The callback parameter can be object (single formula),
* collection (list of formula object) or combination of them.
*
* @param {Text} $1 The path for which the callback function is invoked
* @param {Variant} ${2} Callback functions
*
* <h3>CallerObj.get(callback)</h3>
* 
* In this form, CallerObj can be SingleRoute object.
* In this case, path parameter is stored in the object,
* so only callback parameter is needed.
*
* @param {Variant} ${1} Callback functions
* @return {Object} This object
* @author: HARADA Koichi
*/
	
	C_VARIANT:C1683(${1})
	C_OBJECT:C1216($0)
	
	C_TEXT:C284($method_t)
	C_LONGINT:C283($i)
	C_COLLECTION:C1488($params_c)
	
	$method_t:="get"
	
	$params_c:=New collection:C1472()
	$params_c.push($method_t)
	For ($i; 1; Count parameters:C259)
		
		$params_c.push(${$i})
		
	End for 
	
	$0:=This:C1470.method.apply(This:C1470; $params_c)
	
Function post
	
/**
* This method routes HTTP POST requests for the caller host
* to the speified path with the specified callbacks.
* 
* This method has two forms:
*
* <h3>CallerObj.post(path; callback)</h3>
* 
* In this form, CallerObj can be HttpServer, VirtualHost or Router object.
* The path parameter is for which the callback function is invoked.
* The callback parameter can be object (single formula),
* collection (list of formula object) or combination of them.
*
* @param {Text} $1 The path for which the callback function is invoked
* @param {Variant} ${2} Callback functions
*
* <h3>CallerObj.post(callback)</h3>
* 
* In this form, CallerObj can be SingleRoute object.
* In this case, path parameter is stored in the object,
* so only callback parameter is needed.
*
* @param {Variant} ${1} Callback functions
* @return {Object} This object
* @author: HARADA Koichi
*/
	
	C_VARIANT:C1683(${1})
	C_OBJECT:C1216($0)
	
	C_TEXT:C284($method_t)
	
	$method_t:="post"
	
	$params_c:=New collection:C1472()
	$params_c.push($method_t)
	For ($i; 1; Count parameters:C259)
		
		$params_c.push(${$i})
		
	End for 
	
	$0:=This:C1470.method.apply(This:C1470; $params_c)
	
Function put
	
/**
* This method routes HTTP PUT requests for the caller host
* to the speified path with the specified callbacks.
* 
* This method has two forms:
*
* <h3>CallerObj.put(path; callback)</h3>
* 
* In this form, CallerObj can be HttpServer, VirtualHost or Router object.
* The path parameter is for which the callback function is invoked.
* The callback parameter can be object (single formula),
* collection (list of formula object) or combination of them.
*
* @param {Text} $1 The path for which the callback function is invoked
* @param {Variant} ${2} Callback functions
*
* <h3>CallerObj.put(callback)</h3>
* 
* In this form, CallerObj can be SingleRoute object.
* In this case, path parameter is stored in the object,
* so only callback parameter is needed.
*
* @param {Variant} ${1} Callback functions
* @return {Object} This object
* @author: HARADA Koichi
*/
	
	C_VARIANT:C1683(${1})
	C_OBJECT:C1216($0)
	
	C_TEXT:C284($method_t)
	
	$method_t:="put"
	
	$params_c:=New collection:C1472()
	$params_c.push($method_t)
	For ($i; 1; Count parameters:C259)
		
		$params_c.push(${$i})
		
	End for 
	
	$0:=This:C1470.method.apply(This:C1470; $params_c)
	
Function method
	
/**
* This is generic method intended to use by CallerObject.METHOD method.
* Additionally using this method, you can register routes that respond
* to any method like "mkcol", "purge", "unsubscribe" and so on.
*
* This method has two forms:
*
* <h3>CallerObj.method(method; path; callback)</h3>
* 
* In this form, CallerObj can be HttpServer, VirtualHost or Router object.
* The path parameter is for which the callback function is invoked.
* The callback parameter can be object (single formula),
* collection (list of formula object) or combination of them.
*
* @param {Text} $1 HTTP verb or all or use
* @param {Text} $2 The path for which the callback function is invoked
* @param {Variant} ${3} Callback functions
*
* <h3>CallerObj.method(method; callback)</h3>
* 
* In this form, CallerObj can be SingleRoute object.
* In this case, path parameter is stored in the object,
* so only callback parameter is needed.
*
* @param {Text} $1 HTTP verb or all or use
* @param {Variant} ${2} Callback functions
* @return {Object} This object
* @author: HARADA Koichi
*/
	
	C_TEXT:C284($1; $method_t)
	C_VARIANT:C1683(${2})
	C_OBJECT:C1216($0)
	
	C_OBJECT:C1216($param_o; $callback_o; $formula_o)
	C_COLLECTION:C1488($callbacks_c)
	C_LONGINT:C283($i; $type_l; $start_l)
	
	$method_t:=$1
	
	//#####
	// path and this object to path
	//#####
	Case of 
		: (OB Instance of:C1731(This:C1470; cs:C1710.HttpServer)) | (OB Instance of:C1731(This:C1470; cs:C1710.VirtualHost)) | (OB Instance of:C1731(This:C1470; cs:C1710.Router))
			
			// CallerObj.METHOD(method; path; callback)
			$path_t:=$2
			$this_o:=This:C1470
			$start_l:=3
			
		: (OB Instance of:C1731(This:C1470; cs:C1710.SingleRoute))
			
			// CallerObj.METHOD(method; callback)
			$path_t:=This:C1470.path
			$this_o:=This:C1470.host  // Parent object (HttpServer, VirtualHost or Router)
			$start_l:=2
			
	End case 
	
	//#####
	// callback to collection
	//#####
	$callbacks_c:=New collection:C1472()
	
	For ($i; $start_l; Count parameters:C259)
		
		$type_l:=Value type:C1509(${$i})
		
		Case of 
			: ($type_l=Is object:K8:27)
				
				$callbacks_c.push(${$i})
				
			: ($type_l=Is collection:K8:32)
				
				For each ($callback_o; ${$i})
					
					$callbacks_c.push($callback_o)
					
				End for each 
				
		End case 
		
	End for 
	
	$param_o:=New object:C1471()
	$param_o.method:=$method_t
	$param_o.path:=$path_t
	$param_o.callbacks:=$callbacks_c
	
	$formula_o:=Formula:C1597(HS_addRoute)
	$formula_o.call($this_o; $param_o)
	
	If (OB Instance of:C1731(This:C1470; cs:C1710.SingleRoute))
		
		$0:=This:C1470
		
	End if 
	
Function use
	
/**
* This function is used to add middleware to the CallerObj.
*
* <h3>CallerObj.use({path;} middleware)</h3>
*
* - path parameter
* Path parameter can be passed when the middleware is Function or Router object.
* In this case, if it is ommited, it defaults to "/".
* When the middleware is VirtualHost, path parameter is ignored even
* it is present.
*
* - middleware
* "middleware" can be Function, VirtualHost, Router or Class object.
* It can be single middleware, multiple arguments, collection or combination of them.
*
* -- Class
*
* When the middleware is a Class object (other than VirtualHost, Router or Function),
* it must contains 'callback' attributes.
*
* When it is installed, the callback is executed allowing to modify route configuration.
*
* -- VirtualHost
* When the middleware is VirtulaHost object, the path parameter is ignored
* and the CallerObj must be of type HttpServer. In this case, this funcion
* is used to register and activate VirtualHost.
*
* -- Router
* When the middleware is Router object, this function connects it to
* CallerObj under the path. The path of CallerObj and the path of Router
* are concatenated. Full match is used when searching routes
*
* When the path parameter is omitted, it defaults to "/" which means
* the Router's paths are connected to CallerObj's root.
*
* The CallObj could be HttpServer or VirtualHost.
*
* -- Function
*
* When the middleware is Function, it is connected to CallerObj under the path.
*
* Unlike in the case of other route functions like method, get and post,
* the forward path match is used when searching routes.
*
* In this form, CallerObj can be HttpServer, VirtualHost, Router or SingleRoute object.
*
* When the CallerObj is of type SingleRoute, path parmeter should be omitted
* since path information is already stored in the object. If path paramter is present
* it is ignored.
*
* When the CallerObj is either HttpServer, VirtualHost or Router object,
* and the path parameter is omitted, the path defaults to "/".
*
* The callback parameter can be an object (single formula),
* collection (list of formula object) or combination of them.
*
* @author: HARADA Koichi
*/
	
	C_VARIANT:C1683(${1})
	C_OBJECT:C1216($0)
	
	C_LONGINT:C283($numParam_l; $startPos_l; $i; $typeFirstParam_l; $typeMiddleware_l)
	C_TEXT:C284($path_t)
	C_COLLECTION:C1488($middlewares_c)
	C_OBJECT:C1216($middleware_o)
	
	$numParam_l:=Count parameters:C259
	ASSERT:C1129($numParam_l>0; Current method name:C684+" : Lack of parameters")
	
	$typeFirstParam_l:=Value type:C1509($1)
	
	// If the first parameter is path, middleware starts from 2, else 1
	If ($typeFirstParam_l=Is text:K8:3)
		
		$path_t:=$1
		$startPos_l:=2
		
	Else 
		
		$path_t:="/"
		$startPos_l:=1
		
	End if 
	
	// If callerobj is SingleRoute, use This.path
	If (OB Instance of:C1731(This:C1470; cs:C1710.SingleRoute))
		
		$path_t:=This:C1470.path
		
	End if 
	
	For ($i; $startPos_l; $numParam_l)
		
		// Loop through middleware parameters
		// It can be single middle ware (Function or object) or colloction of middlewares.
		// Make them form one collection.
		
		$typeMiddleware_l:=Value type:C1509(${$i})
		
		Case of 
			: ($typeMiddleware_l=Is collection:K8:32)
				
				// the parameter is a collection of middlewares
				$middlewares_c:=${$i}
				
			: ($typeMiddleware_l=Is object:K8:27)
				
				// the parameter is single middleware that is Function object, vhost, or router
				$middlewares_c:=New collection:C1472(${$i})
				
			Else 
				
				$middlewares_c:=Null:C1517
				
		End case 
		
		If ($middlewares_c#Null:C1517)
			
			For each ($middleware_o; $middlewares_c)
				
				// Loop through middleware collection
				Case of 
					: (OB Instance of:C1731(This:C1470; cs:C1710.HttpServer)) & (OB Instance of:C1731($middleware_o; cs:C1710.VirtualHost))
						
						HS_addRouteVhost(This:C1470; $middleware_o)
						
					: ((OB Instance of:C1731(This:C1470; cs:C1710.HttpServer)) | (OB Instance of:C1731(This:C1470; cs:C1710.VirtualHost))) & (OB Instance of:C1731($middleware_o; cs:C1710.Router))
						
						HS_addRouteRouter(This:C1470; $path_t; $middleware_o)
						
					: (OB Instance of:C1731($middleware_o; 4D:C1709.Function))
						
						HS_addRouteFunction(This:C1470; $path_t; $middleware_o)
						
					Else   // middleware is a class instance
						
						Case of 
							: ($middleware_o.callback#Null:C1517)
							: (Value type:C1509($middleware_o.callback)#Is object:K8:27)
							: (OB Instance of:C1731($middleware_o.callback; 4D:C1709.Function)=False:C215)
							Else 
								
								$middleware_o.callback(This:C1470; $path_t)
								
						End case 
						
				End case 
				
			End for each 
			
		End if 
		
	End for 
	
	If (OB Instance of:C1731(This:C1470; cs:C1710.SingleRoute))
		
		$0:=This:C1470
		
	End if 
	