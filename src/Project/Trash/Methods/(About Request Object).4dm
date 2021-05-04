//%attributes = {"invisible":true}
/**
* Request object may contain:
*
* <h2>Properties</h2>
*
* <h3>Request.body</h3>
* Contains object type key-value pairs or collection that was
* submitted in request body. By default, it is undefined,
* and is populated when the request's Content-Type header
* value is either application/x-www-form-urlencoded or
* application/json.
* How variables are parsed when the Content-Type is 
* application/x-www-form-urlencoded, please refer to
* {@link Request.About Request Object#Request.query}.
* 
* <h3>Request.cookies</h3>
* This property is an object that contains cookies sent in the
* request header. The structure of the object is:
*     {
*         "cookieName1" : "cookieValue1",
*         "cookieName2" : "cookieValue2"
*     }
* If no cookies are sent, it defaults to {}.
*
* <h3>Request.hostname</h3>
* Contains hostname derived from the Host HTTP header.
*
* <h3>Request.ip</h3>
* Contains the remote IP address of the request.
*
* <h3>Request.method</h3>
* Contains HTTP method of the request.
*
* <h3>Request.path</h3>
* Contains the path part of the request URI.
*
* <h3>Request.protocol</h3>
* Contains the request protocol, either "http" or "https".
*
* <h3>Request.query</h3>
* This property is an object that contains query string parameter
* in the URL. If query string is not included, the default is empty object.
* {@code
* // GET /path?param=value
* $req.query["param"]="value"
*  
* // GET /path?param[]=value1&param[]=value2
* $req.query["param"]=["value1", "value2"]
*  
* // GET /path?param[sub1]=value1&param[sub2]=value2
* $req.query["param"]["sub1"]="value1"
* $req.query["param"]["sub2"]="value2"
*
* // Note:
* // If duplicate param name present and bracket pair
* // is not given, the value is overwritten by the latter
* // which has the same param name.
* // GET /path?param=value1&param=value2
* $req.query["param"]="value2"
* }
*
* <h3>Request.secure</h3>
* Boolean property that indicates if the request is sent
* over TLS connection. In this case , it's set to true.
*
* <h3>Request.xhr</h3>
* Boolean property which is true if the X-Requested-With 
* request header is "XMLHttpRequest".
*
*/
