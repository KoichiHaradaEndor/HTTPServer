# Response class

DO NOT USE THIS CLASS DIRECTLY.
THIS CLASS WILL BE INSTANTIATED INTERNALLY.

## Constructor

There is no constructor for the `Response` object. The object is created by `HttpServer` application when the app receives a request, and is passed to route handler method.

## Properties

### locals

**Response.locals**

Object that is used to store any value whose scope is response. It can be accessed in any callback methods passed to route definition. Default is empty object.

Developer should use this object instead of using directly Response object to prevent overwrite built-in attribute.

---

## Methods

Most member functions returns `This` object of `Response` type. So you can call multiple functions in a call chain.

```4D
$res_o.type("text/plain").set(New object("X-CUSTOM";"value")).send("This is response text.")
```

### append()

**Response.append** (fieldName; fieldValue) -> Response

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|fieldName|text|&#x2192;|Response field name||
|fieldValue|text or collection|&#x2192;|Response field value||
|return|object|&#x2190;|Response object||

This function is used to append the specified `fieldValue` to the HTTP response header specified in `fieldName`.

If the header field is not already set, the one will be created. If it is already present, the value will be appended to the existing value separated by comma ', '.

Exception to the above is "Set-Cookie". In this case, another entry will be created. However, to set cookies, using `Response.cookie` is preferable.

#### Example

```4D
$res_o.append("X-CUSTOM-RESPONSE-HEADER";"Some value")

C_COLLECTION($links_c)
$links_c:=New collection("<https://one.example.com>; rel=\"preconnect\"";"<https://two.example.com>; rel=\"preconnect\"")
$res_o.append("Link";$links_c)
```

---

### attachment()

**Response.attachment** (fileName) -> Response

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|fileName|text|&#x2192;|Name of the attachment file|optional|
|return|object|&#x2190;|Response object||

This function sets HTTP response "Content-Disposition" header field to "attachment".

If optional `filename` parameter is given, it adds Content-Disposition "filename" parameter and sets "Content-Type" header field using `Response.type()`.

Note it accepts POSIX path for filename parameter when you pass a path to a file, not system path. Also it does not check the validity of the filename.

Note it does not send file as response. Using `Response.download()` function does both setting headers and sending the file.

---

### clearCookie()

**Response.clearCookie** (cookieName; options) -> Response

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|cookieName|text|&#x2192;|Name of the cookie to be cleared||
|options|object|&#x2192;|Options of the cookie|optional|
|return|object|&#x2190;|Response object||

This function is used to tell browser to clear browser cookie specified by `cookieName`. This is done by setting maxAge property value to 0.

Note that `options` must identical to the existing cookie except expires and maxAge, otherwise the cookie will not be cleared.

---

### cookie()

**Response.cookie** (cookieName; cookieValue; options) -> Response

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|cookieName|text|&#x2192;|Name of the cookie||
|cookieValue|text or object|&#x2192;|Cookie value||
|options|object|&#x2192;|Options of the cookie|optional|
|return|object|&#x2190;|Response object||

This function is used to set cookie name and value.

When Object is passed to `cookieValue`, it will be converted to JSON.

For `options`, following properties can be specified.

`domain` {Text} : 
Domain name for the cookie. Default is not set.
Note that setting this option does not improve security. When it is not set, cookie is sent to origin domain only. If it is set, cookie will be sent to origin and its sub domains. So set this property when cookie should act like that.

`encode` {Formula} :
Formula object used to encode cookie value.
The formula must takes text parameter which is cookie value, then returns encoded value.
When it is not specified, the default encoding `encodeURIComponent` is used.

`expires` {Object} :
Expiration date and time of the cookie.
The object consists of two properties which are "date" and "time" whose types are date and time respectively.
Note: 4D object stores date type value in two ways, one is 4D's native date type and the other is ISO date format string. This method assumes the object stores native 4D date type.

`httpOnly` {Boolean} :
Flag that indicates the cookie is not accessible from browser script. When it is not specified, default to true.

`maxAge` {Longint} :
Convenient option for setting expire date time relative to the current date time in seconds.
When given less than or equal to 0 value, the cookie should expire immediately.
When both Expires and maxAge are present, maxAge will have priority.

`path` {Text} :
Path for the cookie. Defaults to "/".

`secure` {Boolean} :
Marks the cookie to be used with HTTPS connection only.
Warning: When this option is set, the connection should be established under HTTPS. Otherwise, the cookie will be sent via unsecured way which can be intercepted. Modern browsers refuse to set such cookies.

`sameSite` {Text} :
Value of the "SameSite" cookie attribute.
The value can be one of "None", "Lax" or "Strict".
If the value is NOT one of the above, it is not set.

---

### download()

**Response.download** (filePath; fileName; options; callback) -> Response

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|filePath|text|&#x2192;|Location of the file to be sent||
|fileName|text or object|&#x2192;|Name of the downloaded file|optional|
|options|object|&#x2192;|Options to be passed to Response.sendFile()|optional|
|callback|formula|&#x2192;|Post process handler|optional|
|return|object|&#x2190;|Response object||

This function sets "Content-Disposition" header value to "attachment" with filename in the `filePath` and "Content-Type" header value according to the file extension specified, then send the file.

This function internally calls `Response.sendFile()` function, by passing path, options and callback parameters. For detail of those parameters, please refer to the description of that function.

Addition to the above, please note the following:
The file name that appears on browser side is set in "filename" parameter of "Content-Disposition" header. By default actual file name is set. However if its unfavorable (ex. when actual filename is "temp-012345.pdf" but "meaningful-filename.pdf" should appear on client side), it can be overwritten by specifying `fileName` parameter.

If it's empty or omitted, then original name is used.

It is equivalent to following calls:

```4D
Response.attachment() // set headers
Response.sendFile() // send file
```

---

### end()

**Response.end** () -> Response

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|return|object|&#x2190;|Response object||

This function is used to end the response process.

Use this method when no data is sent as response body but only headers are sent.

---

### format()

**Response.format** (mimeTypes) -> Response

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|mimeTypes|object|&#x2190;|Object that contains list of acceptable mimetype as key and correspond formula||
|return|object|&#x2190;|Response object||

This function performs content negotiation on the Accept HTTP request header if its present.

The first object parameter takes an object:
MIME-TYPE : FORMULA
For instance:

```JavaScript
{
    "text/html" : Formula(MethodReturnsText),
    "application/json" : Formula(MethodReturnsJson),
    "default" : Formula(MethodReturns406Status)
}
```

Then this function look for the mime type that matches Accept HTTP request header value. If one matches, Content-Type header is set to the one found, then the corresponding formula is called with passing Request object to the method called as the first parameter.

If none matches, "default" formula is called if any. If default formula does not specified, it returns 406 Not Acceptable status.

#### Example

```4D
$formats_o:=New object(\
    "application/json";Formula(MethodHandleJson );\
    "text/plain";Formula(MethodHandlePlain );\
    "default";Formula(MethodDefault )\
)

$res_o.format($formats_o)
```

In the above case, if the "Accept" request header indicates JSON file is the first priority, `MethodHandleJson` method will be called by passing `This` (which is Response) object as first parameter. 

---

### get()

**Response.get** (fieldName) -> text or collection

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|fieldName|text|&#x2192;|Response header field name||
|return|text or collection|&#x2190;|Response header field value||

This function returns HTTP response header value specified by response header field name.

It returns text type value except when the header field name is "Set-Cookie". In this case it returns collection, even though only one "Set-Cookie" header resides.

If specified header is not found, it returns empty string or empty collection.

---

### json()

**Response.json** (content) -> Response

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|content|variant|&#x2192;|Response content||
|return|object|&#x2190;|Response object||

This function sends JSON response.

The content will be converted JSON string by using 4D's `JSON Stringify` command. So this function accepts the same type with the command as the `content` parameter.

The Content-Type header is set to "application/json" with `Response.type("json")` function.

---

### links()

**Response.links** (object) -> Response

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|links|object|&#x2192;|Links header content||
|return|object|&#x2190;|Response object||

This function is used to populate `Link` HTTP header.

When multiple element is given, they are joined with comma. When it is called multiple times, the latter will be appended to the former.

The first parameter is object type which consists of

```JavaScript
{
    "rel-value":"uri"
}
```

For instance, the following code:

```4D
$res_o.links({
    "prev":"https://example.com/page/1",
    "next":"https://example.com/page/3",
})
```

will populate following header:

`Link: <https://example.com/page/1>; rel="prev", <https://example.com/page/3>; rel="next"`

---

### location()

**Response.location** (path) -> Response

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|path|text|&#x2192;|Path value for the Location header||
|return|object|&#x2190;|Response object||

This function is used to set `Location` response header.

It does not modify given `path`. So it is developer's responsibility to check validity and encoding of the url.

When the `path` parameter is "back", the value of `Location` header will be taken from `Referer` request header. If `Referer` is not present, "/" is used.

---

### redirect()

**Response.redirect** (status; path) -> Response

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|status|longint|&#x2192;|Status code|optional|
|path|text|&#x2192;|Redirect destination path||
|return|object|&#x2190;|Response object||

This function is used to tell user agent to redirect to the specified `path` with the specified `status` code.

If `status` code is omitted, it defaults to 302 ("Found").

---

### render()

**Response.render** (path; locals; callback) -> Response

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|path|text|&#x2192;|Path to the template file|
|locals|object|&#x2192;|Object that will be passed to PROCESS 4D TAGS|optional|
|callback|object|&#x2192;|Reference to post process handler function|optional|
|return|object|&#x2190;|Response object||

This function renders response text using template and send it.

The `path` parameter is the file path to the template. It may contain 4D tags (4DTEXT, 4DIF and so on) that will be parsed by PROCESS 4D TAGS command.

The file path accepts POSIX format, relative from the path set in `DocumentRootDynamic`. It must not contain "../" to prevent path traversal, otherwise response won't be made.

The Content-Type header is set automatically when the template path ends with file extension. When the path does not contain extension, you should specify it by calling `Response.set("Content-Type";"content type")` or `Response.type("file extension or content type")`.

`locals` may contain any data that you want to pass to PROCESS 4D TAGS command. Then it is accessible in the template using $1 directive.

After this function is executed with or without error, post process handler function will be called if it is passed.

If an error had run out, the function receives an error collection whose structure is

```JavaScript
[{"message":"error message";"date":"date and time in ISO 8601 format"}].
```

---

### send()

**Response.send** (body) -> Response

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|body|text, blob, object or collection|&#x2192;|HTTP response body content||
|return|object|&#x2190;|Response object||

This function sends HTTP response.

The `body` parameter can be `Text`, `Blob`, `Object` or `Collection` type.

Content-type header defaults to:

* Text : text/html
* Blob : application/octet-stream
* Object : application/json
* Collection : application/json

unless previously defined.

When `body` is `Object` or `Collection`, the response will be converted to text with `JSON Stringify`.

---

### sendFile()

**Response.sendFile** (path; options; callback) -> Response

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|path|text|&#x2192;|Path to the file to be sent||
|options|object|&#x2192;|Options|optional|
|callback|Formula|&#x2192;|Reference to post process handler function|optional|
|return|object|&#x2190;|Response object||

This function reads a file at the given `path` and send it as response.

Content-Type header will be set based on the file extension if it is not previously set.

The file path accepts POSIX format, relative from the path set in `DocumentRootDynamic`. It must not contain "../" to prevent path traversal, otherwise response won't be made.

The optional `options` parameter can have following attributes:

`maxAge` {Longint} :
Sets the max-age property of the Cache-Control header in second.
Defaults to 0.

`lastModified` {Boolean} :
If true, sets the Last-Modified header to the last modified date and time on the OS. Defaults to true.

`headers` {Object} :
Object containing HTTP headers to serve with the file.

`immutable` {Boolean} :
Enables or disables immutable directive in Cache-Control header. When enabled by passing true, maxAge option should be specified. Defaults to false.

After this function is executed with or without error, post process handler function will be called if it is passed. If an error had run out, the function receives an error collection whose structure is:

```JavaScript
[{"message":"error message";"date":"date and time in ISO 8601 format"}]
```

---

### sendStatus()

**Response.sendStatus** (status) -> Response

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|status|longint|&#x2192;|Status code||
|return|object|&#x2190;|Response object||

This function sets response HTTP status code to `status` and send its text representation as the response body.

---

### set()

**Response.set** (headerName; headerValue) -> Response

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|headerName|text|&#x2192;|Response header field name||
|headerValue|text|&#x2192;|Response header field value||
|return|object|&#x2190;|Response object||

**Response.set** (header) -> Response

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|header|object|&#x2192;|Response header field||
|return|object|&#x2190;|Response object||

This function sets the specified value to the specified HTTP response header field.

If the header is not already set, it creates the field. If it is already present, it is overwritten.

This function has two forms:

In the first form, give response header field name and value to `headerName` and `headerValue` parameters respectively.

In the second form, give object type data whose structure is `headerName:headerValue`. For instance:

```JapaScript
{
    "X-HEADER-1":"header value1",
    "X-HEADER-2":"header value2",
}
```

---

### status()

**Response.status** (status) -> Response

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|status|longint|&#x2192;|Status code||
|return|object|&#x2190;|Response object||

This method sets the HTTP status code for the response to the given `status`.

It just set HTTP status in the HTTP response header and does not send response. If you want to send status code with simple message, you can use `Response.sendStatus()` function. 

---

### type()

**Response.type** (type) -> Response

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|type|text|&#x2192;|Type parameter that can be file extension or mime type||
|return|object|&#x2190;|Response object||

This function is used to set Content-Type header.

The `type` parameter accepts file extension or mime type text.

If the `type` contains "/" character, it is considered as mime type and used it as is. Otherwise, it looks up file extension - mime type conversion table to look for the corresponding mime type.

---

### vary()

**Response.vary** (value) -> Response

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|value|text|&#x2192;|Vary field value||
|return|object|&#x2190;|Response object||

This function is used to set Vary header to the `value` parameter, if it is not already specified.

---
