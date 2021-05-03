# VirtualHost class

This is the class used to add a named host to the HttpServer application.

## Extends

Route

## Constructor

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|host|text|&#x2192;|Host name||
|return|object|&#x2190;|VirtualHost object||

Pass the name of the host to the `host` parameter.

The constructor just creates a `VirtualHost` object on memory. So you must register it to the main application using `HttpServer.use(VirtualHost)` function after you've finished to add routes to the `VirtualHost`.

When the same path is registered to a VirtualHost and the HttpServer, the route belongs to the VirtualHost has priority.

#### Example

```4D
C_OBJECT($cs_o;$app_o;$vhost_o)
$cs_o:=import HttpServer
$app_o:=$cs_o.HttpServer.new(Web Server)
$app_o.get("/bar";Formula(DefaultMethodName))

$vhost_o:=$cs_o.VirtualHost.new("api.foo.com")
$vhost_o.get("/bar";Formula(ApiMethodName))

$app_o.use($vhost_o)
```

In the above case, when the host name and the pass combination is:
* api.foo.com/bar : ApiMethodName will be invoked
* any other host name and the pass "/bar" : DefaultMethodName will be invoked

Nevertheless of the order of the route registration, routes that matches the virtual host name will be selected, if any.

## Properties

## Methods

### Route configuration

This class inherit routing function from `Route` class. Please also refer to the reference for details.

### `SingleRoute` **VirtualHost.route** (path)

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|path|text|&#x2192;|The path for which the callback function is invoked||
|return|object|&#x2190;|SingleRoute object||

This method creates and returns a SingleRoute object, which you can then add handlers subsequently.

It can be used to add multiple route handler methods to the same path in one line of code.

#### Example

```4D
C_OBJECT($cs_o;$app_o;$vhost_o)
$cs_o:=import HttpServer
$app_o:=$cs_o.HttpServer.new(Web Server)
$vhost_o:=$cs_o.VirtualHost.new("api.foo.com")
$vhost_o.route("/foo")\
    .all(Formula(RespondAllMethod))\
    .get(Formula(RespondGetMethod))\
    .post(Formula(RespondPostMethod))
$app_o.use($vhost_o)
```

In the above case, when "api.foo.com/foo" is requested, according to the HTTP verb, the following methods are invoked in order:

* GET : RespondAllMethod > RespondGetMethod
* POST : RespondAllMethod > RespondPostMethod
* others : RespondAllMethod

---
