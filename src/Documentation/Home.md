# About HTTPServer component

HTTPServer is a 4D component, built with 4D v18R3, which includes methods to help your web developing.

Since it uses class function introduced starting from 4D v18 R3, it cannot be used with 4D v18 nor 4D v18 R2 and under.

## Installation

This is a 4D component, so you should build this source as 4D component and place it in the "Components" folder of your project root.

## Hello World

### On Web Connection database method

Write following code in On Web Connection database method. `OnWebConnection` is a shared component method.

```4D
C_TEXT($1;$2;$3;$4;$5;$6)
OnWebConnection(Web Server;$3;$4)
```

### On Startup database method

Then write following code in On (Server) Startup database method. `import HttpServer` is also a shared component method that returns `cs` (class store) of the component.

```4D
C_OBJECT($cs_o;$app_o)
$cs_o:=import HttpServer
$app_o:=$cs_o.HttpServer.new(Web Server)
$app_o.get("/hello"; Formula(HelloWorld))
$app_o.start()
```

`HelloWorld` method looks like

```4D
C_OBJECT($1;$req_o)
C_OBJECT($2;$res_o)
C_OBJECT($3;$next_o)
$req_o:=$1
$res_o:=$2
$next_o:=$3
$res_o.send("Hello World")
```

Then restart your project, make sure the HTTP server is up and running, connect to `http://localhost/hello` with your favorite web browser. You will get "Hello World" response.

## More How Do I's

Please refer to the demo is in the "test" folder. Just launch it with 4D v18R3 Standalone and connect to it with your favorite web browser via http://localhost/.