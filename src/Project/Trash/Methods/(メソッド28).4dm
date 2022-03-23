//%attributes = {}
C_OBJECT:C1216($session_o; $options_o; $f)

$options_o:=New object:C1471("secret"; "keyboard cat")
$session_o:=cs:C1710.Session.new($options_o)

$f:=$session_o.initialize()
//$f:=New object("ss"; Formula($session_o.sessionStart))

//$session_o.sessionStart()

$f.call($session_o)
