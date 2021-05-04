<details>
<summary>About</summary>

* [Installation](https://github.com/KoichiHaradaEndor/HTTPServer/wiki#installation)
* [Hello World](https://github.com/KoichiHaradaEndor/HTTPServer/wiki#hello-world)
</details>

<details>
<summary>Shared Component Method</summary>

* [import HttpServer()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki#cs-import-httpserver-)
* [OnWebConnection()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki#void-onwebconnection-webserver-remoteip-hostip)
</details>

<details>
<summary>HttpServer</summary>

_**Constructor**_
* [HttpServer.new()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/HttpServer-Class#constructor)

_**Methods**_
* [HttpServer.start()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/HttpServer-Class#object-httpserverstart-)
* [HttpServer.stop()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/HttpServer-Class#text-httpserverstop-)
* [HttpServer.restart()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/HttpServer-Class#object-httpserverrestart-)
* [HttpServer.setOption()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/HttpServer-Class#void-httpserversetoption-options)
* [HttpServer.getOption()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/HttpServer-Class#object-httpservergetoption-)
* [HttpServer.setDynamicFolder()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/HttpServer-Class#void-httpserversetdynamicfolder-dynamicfolder)
* [HttpServer.getDynamicFolder()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/HttpServer-Class#object-httpservergetdynamicfolder-)
* [HttpServer.route()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/HttpServer-Class#singleroute-httpserverroute-path)

</details>

<details>
<summary>Request</summary>

_**Properties**_
* [Request.baseUrl](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Request-Class#requestbaseurl)
* [Request.body](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Request-Class#requestbody)
* [Request.cookies](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Request-Class#requestcookies)
* [Request.hostname](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Request-Class#requesthostname)
* [Request.ip](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Request-Class#requestip)
* [Request.method](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Request-Class#requestmethod)
* [Request.path](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Request-Class#requestpath)
* [Request.protocol](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Request-Class#requestprotocol)
* [Request.query](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Request-Class#requestquery)
* [Request.secure](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Request-Class#requestsecure)
* [Request.xhr](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Request-Class#requestxhr)

_**Methods**_
* [Request.accepts()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Request-Class#text-requestaccepts-candidates)
* [Request.get()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Request-Class#text-requestget-fieldname)

</details>

<details>
<summary>Response</summary>

_**Properties**_
* [Response.locals](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Response-Class#responselocals)

_**Methods**_
* [Response.append()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Response-Class#response-responseappend-fieldname-fieldvalue)
* [Response.attachment()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Response-Class#response-responseattachment-filename)
* [Response.clearCookie()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Response-Class#response-responseclearcookie-cookiename-options)
* [Response.cookie()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Response-Class#response-responsecookie-cookiename-cookievalue-options)
* [Response.download()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Response-Class#response-responsedownload-filepath-filename-options-callback)
* [Response.end()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Response-Class#response-responseend-)
* [Response.format()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Response-Class#response-responseformat-mimetypes)
* [Response.get()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Response-Class#text-or-collection-responseget-fieldname)
* [Response.json()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Response-Class#response-responsejson-content)
* [Response.links()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Response-Class#response-responselinks-object)
* [Response.location()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Response-Class#response-responselocation-path)
* [Response.redirect()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Response-Class#response-responseredirect-status-path)
* [Response.render()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Response-Class#response-responserender-path-locals-callback)
* [Response.send()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Response-Class#response-responsesend-body)
* [Response.sendFile()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Response-Class#response-responsesendfile-path-options-callback)
* [Response.sendStatus()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Response-Class#response-responsesendstatus-status)
* [Response.set()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Response-Class#response-responseset-headername-headervalue)
* [Response.status()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Response-Class#response-responsestatus-status)
* [Response.type()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Response-Class#response-responsetype-type)
* [Response.vary()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Response-Class#response-responsevary-value)

</details>

<details>
<summary>Route</summary>

_**Methods**_
* [Route.all()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Route-Class#void-callerobjall-path-callback)
* [Route.delete()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Route-Class#void-callerobjdelete-path-callback)
* [Route.get()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Route-Class#void-callerobjget-path-callback)
* [Route.method()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Route-Class#void-callerobjmethod-verb-path-callback)
* [Route.post()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Route-Class#void-callerobjpost-path-callback)
* [Route.put()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Route-Class#void-callerobjput-path-callback)
* [Route.use()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Route-Class#void-callerobjuse-path-callback)

</details>

<details>
<summary>Router</summary>

_**Constructor**_
* [Router.new()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/Router-Class#constructor)

</details>

<details>
<summary>SingleRoute</summary>

</details>

<details>
<summary>VirtualHost</summary>

_**Constructor**_
* [VirtualHost.new()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/VirtualHost-Class#constructor)

_**Methods**_
* [VirtualHost.route()](https://github.com/KoichiHaradaEndor/HTTPServer/wiki/VirtualHost-Class#singleroute-virtualhostroute-path)

</details>
