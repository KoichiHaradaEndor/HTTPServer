# Route class

DO NOT USE THIS CLASS DIRECTLY.
THIS CLASS WILL BE INSTANTIATED INTERNALLY.

This is basic `Route` class.
It contains common routing functions.
Any other routing class inherit this class.

## Extends

None

## Constructor

Do not instantiate this class but use `HttpServer`, `VirtualHost` or `Router` classes and/or route object created with `route` function of those classes.

This document is intended to describe following functions.

## Methods

### `void` **CallerObj.all** (path; callback)

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|path|text|&#x2192;|The path for which the callback function is invoked||
|callback|formula or collection|&#x2192;|Callback function||

### `SingleRoute` **CallerObj.all** (callback)

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|callback|formula or collection|&#x2192;|Callback function||
|return|object|&#x2190;|CallerObj||

This method routes HTTP requests for the caller host to the specified path with the specified callbacks.

It will match all HTTP verbs.

This function has two forms:

In the first form, `CallerObj` can be `HttpServer`, `VirtualHost`  or `Router` object.

The `path` parameter is for which the `callback` function is invoked. Case-sensitive, full match comparison is used.

The `callback` parameter is `Formula` object which is generated with 4D's `Formula()` command. It can be object (single formula), collection (list of formula object) or combination of them.

In the second form, `CallerObj` can only be `SingleRoute` object. In this case, the path parameter is stored in the `CallerObj` object, so only `callback` parameter is needed.

Then it returns `This` object.

#### Example

To respond when a request is made to "/foo" request path:

Registering one formula:

```4D
C_OBJECT($cs_o;$app_o)
$cs_o:=importHttpServer
$app_o:=$cs_o.HttpServer.new(Web Server)
$app_o.all("/foo";Formula(MethodName))
```

In this case, when "/foo" is requested, MethodName method is called.

Registering three formulas:

```4D
$app_o.all("/foo";Formula(MethodName1);Formula(MethodName2);Formula(MethodName3))
```

In this case, when "/foo" is requested, MethodName1, MethodName2 and MethodName3 methods are called in order.

Registering three formulas using collection:

```4D
C_COLLECTION($formulas_c)
$formulas_c:=New collection(Formula(MethodName1);Formula(MethodName2);Formula(MethodName3))
$app_o.all("/foo";$formulas_c)
```

This causes the same result with the above.

Or you can mix them:

```4D
C_COLLECTION($formulas_c)
$formulas_c:=New collection(Formula(MethodName1);Formula(MethodName2))
$app_o.all("/foo";$formulas_c;Formula(MethodName3))
```

Again this causes the same result with the above.

---

### `void` **CallerObj.delete** (path; callback)

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|path|text|&#x2192;|The path for which the callback function is invoked||
|callback|formula or collection|&#x2192;|Callback function||

### `SingleRoute` **CallerObj.delete** (callback)

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|callback|formula or collection|&#x2192;|Callback function||
|return|object|&#x2190;|CallerObj||

This method routes HTTP requests for the caller host to the specified path with the specified callbacks.

It will match `DELETE` HTTP verb.

For the description of the parameters, returned value and examples, please refer to `CallerObj.all()`.

---

### `void` **CallerObj.get** (path; callback)

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|path|text|&#x2192;|The path for which the callback function is invoked||
|callback|formula or collection|&#x2192;|Callback function||

### `SingleRoute` **CallerObj.get** (callback)

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|callback|formula or collection|&#x2192;|Callback function||
|return|object|&#x2190;|CallerObj||

This method routes HTTP requests for the caller host to the specified path with the specified callbacks.

It will match `GET` HTTP verb.

For the description of the parameters, returned value and examples, please refer to `CallerObj.all()`.

---

### `void` **CallerObj.method** (verb; path; callback)

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|verb|text|&#x2192;|HTTP verb or "all" or "use"||
|path|text|&#x2192;|The path for which the callback function is invoked||
|callback|formula or collection|&#x2192;|Callback function||

### `SingleRoute` **CallerObj.method** (verb; callback)

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|verb|text|&#x2192;|HTTP verb or "all" or "use"||
|callback|formula or collection|&#x2192;|Callback function||
|return|object|&#x2190;|CallerObj||

Using this method, you can register routes that respond to any method like "mkcol", "purge", "unsubscribe" and so on, even though the correspond route register functions are not provided.

This method routes HTTP requests for the caller host to the specified path with the specified callbacks.

It will match the HTTP verb specified in the `verb` parameter.

The `verb` parameter accepts any HTTP verbs. Additionally it accepts `all` and `use`. For the description of them, please refer to `CallerObj.all()` and `CallerObj.use()` respectively.

For the description of other parameters, returned value and examples, please refer to `CallerObj.all()`.

---

### `void` **CallerObj.post** (path; callback)

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|path|text|&#x2192;|The path for which the callback function is invoked||
|callback|formula or collection|&#x2192;|Callback function||

### `SingleRoute` **CallerObj.post** (callback)

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|callback|formula or collection|&#x2192;|Callback function||
|return|object|&#x2190;|CallerObj||

This method routes HTTP requests for the caller host to the specified path with the specified callbacks.

It will match `POST` HTTP verb.

For the description of the parameters, returned value and examples, please refer to `CallerObj.all()`.

---

### `void` **CallerObj.put** (path; callback)

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|path|text|&#x2192;|The path for which the callback function is invoked||
|callback|formula or collection|&#x2192;|Callback function||

### `SingleRoute` **CallerObj.put** (callback)

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|callback|formula or collection|&#x2192;|Callback function||
|return|object|&#x2190;|CallerObj||

This method routes HTTP requests for the caller host to the specified path with the specified callbacks.

It will match `PUT` HTTP verb.

For the description of the parameters, returned value and examples, please refer to `CallerObj.all()`.

---

### `void` **CallerObj.use** (path; callback)

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|path|text|&#x2192;|The path for which the callback function is invoked|optional|
|callback|formula or collection|&#x2192;|Callback function||

### `SingleRoute` **CallerObj.use** (callback)

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|callback|formula or collection|&#x2192;|Callback function||
|return|object|&#x2190;|CallerObj||

### `void` **CallerObj.use** (vhost)

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|vhost|object|&#x2192;|VirtualHost object||

`CallerObj.use()` function has various uses.

#### When want to use forward match for the `path` comparison

The functions introduced in this section uses "full match" when the `path` comparison is executed. However there are cases "forward match" is appropriate. Typically, when authorization is needed to access your API server, you may want to protect it from access to `"/"` and its all sub directory. In this case, use this function since the route installed with this function uses "forward match" comparison when comparing the route path with requested path.

When `CallerObj` is either `HttpServer` or `VirtualHost` object, and the `path` parameter is omitted, it defaults to `"/"` that means it matches all request paths.

When `CallerObj` is `SingleRoute` parameter, the path stored in the object is used.

It will match all HTTP verbs.

For the description of the `callback` parameter and returned value, please refer to `CallerObj.all()`.

#### When installing VirtualHost

This function can also be used to register `VirtualHost` object, created with `HttpServer.vhost()`, to main `HttpServer` application.

In this case, just pass only `VirtualHost` object.

#### Example

When you want to limit access to all paths to only authenticated users, except "/login":

```4D
C_OBJECT($cs_o;$app_o)
$cs_o:=import HttpServer
$app_o:=$cs_o.HttpServer.new(Web Server)
$app_o.post("/login";Formula(LoginMethod))
$app_o.use(Formula(AuthenticationMethod)) // path parameter is omitted, so it defaults to "/"
// after the above, only authenticated requests can proceed
```

For example to install virtual host, please refer to the VirtualHost class reference.

---
