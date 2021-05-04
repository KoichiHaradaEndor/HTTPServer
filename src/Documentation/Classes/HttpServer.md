<!-- This is the main application class that contains functions for starting/stopping HTTP server, and routing functions that inherit from Route class. -->
# HttpServer class

This is the main application class that contains functions for starting/stopping HTTP server, and routing functions that inherit from `Route` class.

#### Extends

Route

## Constructor

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|webServer|object|&#x2192;|Web Server object returned from `Web Server` command||
|options|object|&#x2192;|Web Server options|optional|

In the first parameter, you pass `Web Server` object returned from 4D's `Web Server` command. Starting from 4D v18 R3, 4D supports hosting multiple web servers, one is main database, and the others are one per component. So this parameter is used to tell the component which web server is talking to the component.

In the optional second parameter, you can pass an object that consists of the options of the web server. It calls `This.setOption()` internally. Please refer to it for more detail.

#### Example

```4D
C_OBJECT($cs_o;$app_o)
$cs_o:=import HttpServer // Get class store of the component
$app_o:=$cs_o.HttpServer.new(Web Server)
```

## Methods

### Starts or stops HTTP server

### start()

**HttpServer.start** () -> object

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|return|object|&#x2190;|Result message||

This function is called to start 4D HTTP server.

If HTTP server is already up and running, it does nothing.

It returns object that contains result message returned from 4D's Web Server.start() method.

#### Example

```4D
C_OBJECT($cs_o;$app_o;$result_o)
$cs_o:=import HttpServer
$app_o:=$cs_o.HttpServer.new(Web Server)
$result_o:=$app_o.start()
```

---

### stop()

**HttpServer.stop** () -> text

|Name|Type||Description||
|-----|-----|-----|-----|-----|

This function is called to stop 4D HTTP server.

#### Example

```4D
C_OBJECT($cs_o;$app_o)
$cs_o:=import HttpServer
$app_o:=$cs_o.HttpServer.new(Web Server)
$app_o.stop()
```

---

### restart()

**HttpServer.restart** () -> object

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|return|object|&#x2190;|Result message||

This method is called to restart 4D HTTP server.

It returns object that contains result message returned from 4D's Web Server.start() method.

#### Example

```4D
C_OBJECT($cs_o;$app_o;$result_o)
$cs_o:=import HttpServer
$app_o:=$cs_o.HttpServer.new(Web Server)
$result_o:=$app_o.restart()
```

---

### Options

### setOption()

**HttpServer.setOption** (options)

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|options|object|&#x2192;|Web Server options||

**HttpServer.setOption** (key; value)

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|key|text|&#x2192;|Key of the Web Server option||
|value|variant|&#x2192;|Value to be set as Web Server option||

This function is used to set HTTP server option(s).

For available key names list, please refer to the 4D's Web Server command reference.

The key "dynamicFolder" is an addition to the available keys.The value of the key is used by this component, not by the Web server. It defines the folder where the component look for files to make response.

When `options` object is passed, it must contain Web Server options key-value pair, and "dynamicFolder" entry if you let the component loads files from disk to make response.

This will overwrite the values of the each option. Even when passing `options` object, it will not replace options previously set with the one passed, but overwrite the values that has the same key.

#### Example

```4D
C_OBJECT($cs_o;$app_o;$options_o)
$cs_o:=import HttpServer
$app_o:=$cs_o.HttpServer.new(Web Server)
$options_o:=New object("HTTPPort";8080)
$app_o.setOption($options_o)
```

```4D
C_OBJECT($cs_o;$app_o)
$cs_o:=import HttpServer
$app_o:=$cs_o.HttpServer.new(Web Server)
$app_o.setOption("HTTPPort";8080)
```

---

### getOption()

**HttpServer.getOption** () -> object

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|return|object|&#x2190;|Web Server options||

**HttpServer.getOption** (key) -> variant

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|key|text|&#x2192;|Key of the Web Server option||
|return|variant|&#x2190;|Value of the Web Server option||

This function returns web server option previously set in this class.

If no parameter was passed, it returns `options` object that contains all the Web Server options. If `key` parameter is passed, it will return the value that corresponds to the key.

#### Example

```4D
C_OBJECT($cs_o;$app_o;$options_o)
$cs_o:=import HttpServer
$app_o:=$cs_o.HttpServer.new(Web Server)
$options_o:=$app_o.getOption()
// then $options_o["HTTPPort"] will return
// the HTTP port.
```

```4D
C_OBJECT($cs_o;$app_o)
C_LONGINT($httpPort_l)
$cs_o:=import HttpServer
$app_o:=$cs_o.HttpServer.new(Web Server)
$httpPort_l:=$app_o.getOption("HTTPPort")
```

---

### setDynamicFolder()

**HttpServer.setDynamicFolder** (dynamicFolder)

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|dynamicFolder|object|&#x2192;|Folder object of the dynamic folder||

This function is used to set dynamic contents folder.

Dynamic contents folder is the place where you put files that will be loaded and sent by this component as response.

When this component is used in the host database, the path can be either filesystem path, POSIX path or platform path. On the other hand, when this component is used in the other component, the path must not be filesystem path but POSIX path or platform path since other component cannot pass its folder object in the filesystem path format.

This setting is the same with the one when you pass `dynamicFolder` key to the `HttpServer.setOption()` function.

#### Example

```4D
C_OBJECT($cs_o;$app_o;$folder_o)
$folder_o:=Folder(fk database folder).folder("WebFolderDynamic")
$cs_o:=import HttpServer
$app_o:=$cs_o.HttpServer.new(Web Server)
$app_o.setDynamicFolder($folder_o)
// is the same as
$app_o.setOption("dynamicFolder";$folder_o)
```

---

### getDynamicFolder()

**HttpServer.getDynamicFolder** () -> object

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|return|object|&#x2190;|Folder object||

This function is used to retrieve current `dynamicFolder` object setting.

Unlike `HttpServer.setOption()`, `HttpServer.getOption()` does not return the value of the `dynamicFolder`  entry. To get the value, you must use this function.

#### Example

```4D
C_OBJECT($cs_o;$app_o;$folder_o)
$cs_o:=import HttpServer
$app_o:=$cs_o.HttpServer.new(Web Server)
$folder_o:=$app_o.getDynamicFolder()
```

---

### Route configuration

This class inherit routing function from `Route` class. Please also refer to the reference for details.

### route()

**HttpServer.route** (path) -> SingleRoute

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|path|text|&#x2192;|The path for which the callback function is invoked||
|return|object|&#x2190;|SingleRoute object||

This method creates and returns a SingleRoute object, which you can then add handlers subsequently.

It can be used to add multiple route handler methods to the same path in one line of code.

#### Example

```4D
C_OBJECT($cs_o;$app_o)
$cs_o:=import HttpServer
$app_o:=$cs_o.HttpServer.new(Web Server)
$app_o.route("/foo")\
    .all(Formula(RespondAllMethod))\
    .get(Formula(RespondGetMethod))\
    .post(Formula(RespondPostMethod))
```

In the above case, when "/foo" is requested, according to the HTTP verb, the following methods are invoked in order:

* GET : RespondAllMethod > RespondGetMethod
* POST : RespondAllMethod > RespondPostMethod
* others : RespondAllMethod

---

