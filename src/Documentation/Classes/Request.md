# Request class

DO NOT USE THIS CLASS DIRECTLY.
THIS CLASS WILL BE INSTANTIATED INTERNALLY.

## Constructor

There is no constructor for the `Request` object. The object is created by `HttpServer` application when the app receives a request, and is passed to route handler method.

## Properties

### **Request.baseUrl**

Contains a path on which a router instance was mounted.

When a router is mounted on a path like follow:

```4d
$router_o.get("/path2"; Formula(Method1))
$app_o.use("/path1";$router_o)
```

In `Method1`, `Request.baseUrl` returns "/path1". This is useful when building a path:

```4d
// following code will return /path1/path2.html file
$response_o.sendFile($request_o.baseUrl+"/path2.html")
```

---

### **Request.body**

Contains object type key-value pairs or collection that was submitted in request body. By default, it is undefined, and is populated when the request's Content-Type header value is either application/x-www-form-urlencoded or application/json.

How variables are parsed when the Content-Type is application/x-www-form-urlencoded, please refer to description of `Request.query`.

---

### **Request.cookies**

This property is an object that contains cookies sent in the request header. The structure of the object is:

```JSON
{
    "cookieName1" : "cookieValue1",
    "cookieName2" : "cookieValue2"
}
```

If no cookies are sent, it defaults to {}.

---

### **Request.hostname**

Contains hostname derived from the Host HTTP header.

---

### **Request.ip**

Contains the remote IP address of the request.

---

### **Request.method**

Contains HTTP method of the request.

---

### **Request.path**

Contains the path part of the request URI.

---

### **Request.protocol**

Contains the request protocol, either "http" or "https".

---

### **Request.query**

This property is an object that contains query string parameter in the URL. If query string is not included, the default is empty object.

The query string and also request body (please refer to the `Request.body`) are parsed as follows:

when the request contains `param=value`

```
$req.query["param"] returns "value"
```

when the request contains `param[]=value1&param[]=value2`

```
$req.query["param"] returns ["value1", "value2"]
```

when the request contains `param[sub1]=value1&param[sub2]=value2`

```
$req.query["param"]["sub1"] returns "value1"
$req.query["param"]["sub2"] returns "value2"
```

Note:
If duplicate param name present without bracket pair, the value will be overwritten by the latter which has the same param name.

when the request contains `param=value1&param=value2`

```
$req.query["param"] returns "value2"
```

---

### **Request.secure**

Boolean property that indicates if the request is sent over TLS connection. In this case, it's set to true.

---

### **Request.xhr**

Boolean property which is true if the X-Requested-With request header is "XMLHttpRequest".

---

## Methods

### `text` **Request.accepts** (candidates)

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|candidates|text or collection|&#x2192;|Acceptable content type||
|return|text|&#x2190;|Best match content type||

This function checks if the specified content type(s) passed in `candidates` parameter are acceptable, based on the request's Accept HTTP header field.

The method returns the best match, or none of the specified content types is acceptable, it returns empty string. In this case, the app should return 406 Not Acceptable.

#### Example

When the request contains
Accept: text/html;q=.5, application/json
header, it means the client requests "application/json" type response as the first candidate, then "text/html" as the second. In this case

```4D
C_TEXT($contentType_t)
$contentType_t:=$req_o.accept(New collection("text/html";"application/json"))
// $contentType_t will get "application/json".

$contentType_t:=$req_o.accept("text/html")
// $contentType_t will get "text/html".
```

---

### `text` **Request.get** (fieldName)

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|fieldName|text|&#x2192;|Header field name||
|return|text|&#x2190;|Header field value||

This function is used to retrieve specific request header value.

Especially, this function is provided to get the value of an HTTP header which is not contained in the `Request` object as an property.

#### Example

```4D
C_TEXT($value_t)
$value_t:=$req_o.get("X-CUSTOM-HEADER-NAME")
```

---
