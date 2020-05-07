//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($1;$app_o)

C_OBJECT:C1216($cs_o;$vhost_o)

$app_o:=$1

$app_o.get("/test3-1";Formula:C1597(Test3_1_1_main ))

$cs_o:=import HttpServer 
$vhost_o:=$cs_o.VirtualHost.new("test.mycompany.com")
$vhost_o.get("/test3-1";Formula:C1597(Test3_1_1_vhost ))
$app_o.use($vhost_o)
