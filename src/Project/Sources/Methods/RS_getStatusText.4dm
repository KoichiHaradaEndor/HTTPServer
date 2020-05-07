//%attributes = {"invisible":true,"preemptive":"capable"}
/**
* This method returns HTTP status text
* corresponds to status code specified.
* If the status code is out of range,
* it will return text representation of
* the status code.
* 
* @param {Longint} $1 Status code
* @retun {Text} $0 Status text
* @author HARADA Koichi
*/

C_LONGINT:C283($1;$statusCode_l)
C_TEXT:C284($0;$statusText_t)

$statusCode_l:=$1
$statusText_t:=""

Case of 
		  // 1xx Informational
	: ($statusCode_l=100)
		$statusText_t:="Continue"
	: ($statusCode_l=101)
		$statusText_t:="Switching Protocols"
	: ($statusCode_l=102)
		$statusText_t:="Processing"
	: ($statusCode_l=103)
		$statusText_t:="Early Hints"
		
		  // 2xx Success
	: ($statusCode_l=200)
		$statusText_t:="OK"
	: ($statusCode_l=201)
		$statusText_t:="Created"
	: ($statusCode_l=202)
		$statusText_t:="Accepted"
	: ($statusCode_l=203)
		$statusText_t:="Non-Authoritative Information"
	: ($statusCode_l=204)
		$statusText_t:="No Content"
	: ($statusCode_l=205)
		$statusText_t:="Reset Content"
	: ($statusCode_l=206)
		$statusText_t:="Partial Content"
	: ($statusCode_l=207)
		$statusText_t:="Multi-Status"
	: ($statusCode_l=208)
		$statusText_t:="Already Reported"
	: ($statusCode_l=226)
		$statusText_t:="IM Used"
		
		  // 3xx Redirection
	: ($statusCode_l=300)
		$statusText_t:="Multiple Choices"
	: ($statusCode_l=301)
		$statusText_t:="Moved Permanently"
	: ($statusCode_l=302)
		$statusText_t:="Found"
	: ($statusCode_l=303)
		$statusText_t:="See Other"
	: ($statusCode_l=304)
		$statusText_t:="Not Modified"
	: ($statusCode_l=305)
		$statusText_t:="Use Proxy"
	: ($statusCode_l=307)
		$statusText_t:="Temporary Redirect"
	: ($statusCode_l=308)
		$statusText_t:="Permanent Redirect"
		
		  // 4xx Client Error
	: ($statusCode_l=400)
		$statusText_t:="Bad Request"
	: ($statusCode_l=401)
		$statusText_t:="Unauthorized"
	: ($statusCode_l=402)
		$statusText_t:="Payment Required"
	: ($statusCode_l=403)
		$statusText_t:="Forbidden"
	: ($statusCode_l=404)
		$statusText_t:="Not Found"
	: ($statusCode_l=405)
		$statusText_t:="Method Not Allowed"
	: ($statusCode_l=406)
		$statusText_t:="Not Acceptable"
	: ($statusCode_l=407)
		$statusText_t:="Proxy Authentication Required"
	: ($statusCode_l=408)
		$statusText_t:="Request Timeout"
	: ($statusCode_l=409)
		$statusText_t:="Conflict"
	: ($statusCode_l=410)
		$statusText_t:="Gone"
	: ($statusCode_l=411)
		$statusText_t:="Length Required"
	: ($statusCode_l=412)
		$statusText_t:="Precondition Failed"
	: ($statusCode_l=413)
		$statusText_t:="Payload Too Large"
	: ($statusCode_l=414)
		$statusText_t:="URI Too Long"
	: ($statusCode_l=415)
		$statusText_t:="Unsupported Media Type"
	: ($statusCode_l=416)
		$statusText_t:="Range Not Satisfiable"
	: ($statusCode_l=417)
		$statusText_t:="Expectation Failed"
	: ($statusCode_l=418)
		$statusText_t:="I'm a teapot"
	: ($statusCode_l=421)
		$statusText_t:="Misdirected Request"
	: ($statusCode_l=422)
		$statusText_t:="Unprocessable Entity"
	: ($statusCode_l=423)
		$statusText_t:="Locked"
	: ($statusCode_l=424)
		$statusText_t:="Failed Dependency"
	: ($statusCode_l=425)
		$statusText_t:="Too Early"
	: ($statusCode_l=426)
		$statusText_t:="Upgrade Required"
	: ($statusCode_l=428)
		$statusText_t:="Precondition Required"
	: ($statusCode_l=429)
		$statusText_t:="Too Many Requests"
	: ($statusCode_l=431)
		$statusText_t:="Request Header Fields Too Large"
	: ($statusCode_l=451)
		$statusText_t:="Unavailable For Legal Reasons"
		
		  // 5xx Server Error
	: ($statusCode_l=500)
		$statusText_t:="Internal Server Error"
	: ($statusCode_l=501)
		$statusText_t:="Not Implemented"
	: ($statusCode_l=502)
		$statusText_t:="Bad Gateway"
	: ($statusCode_l=503)
		$statusText_t:="Service Unavailable"
	: ($statusCode_l=504)
		$statusText_t:="Gateway Timeout"
	: ($statusCode_l=505)
		$statusText_t:="HTTP Version Not Supported"
	: ($statusCode_l=506)
		$statusText_t:="Variant Also Negotiates"
	: ($statusCode_l=507)
		$statusText_t:="Insufficient Storage"
	: ($statusCode_l=508)
		$statusText_t:="Loop Detected"
	: ($statusCode_l=509)
		$statusText_t:="Bandwidth Limit Exceeded"
	: ($statusCode_l=510)
		$statusText_t:="Not Extended"
	: ($statusCode_l=511)
		$statusText_t:="Network Authentication Required"
		
	Else 
		$statusText_t:=String:C10($statusCode_l)
End case 

$0:=$statusText_t
