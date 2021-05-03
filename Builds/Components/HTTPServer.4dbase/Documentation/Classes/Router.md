# Router class

This class is used to create a group of route definition. Then it will be attached to the HttpServer or the VirtualHost object.

## Extends

Route

## Constructor

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|return|object|&#x2190;|Router object||

The constructor just creates a `Router` object on memory. So you must register it to the main application using `HttpServer.use(Router)` or `VirtualHost.use(Router)` function after you've finished to add routes to the `Router`.

#### Example

```4D
C_OBJECT($cs_o;$app_o;$router_o)
$cs_o:=import HttpServer
$app_o:=$cs_o.HttpServer.new(Web Server)

$router_o:=$cs_o.Router.new()
$router_o.get("/bar";Formula(ApiMethodName))

$app_o.use("/foo";$router_o)
```

In the above case, the get request path "/foo/bar" will invoke ApiMethodName method.

## Properties

## Methods

### Route configuration

This class inherit routing function from `Route` class. Please refer to the reference for details.
