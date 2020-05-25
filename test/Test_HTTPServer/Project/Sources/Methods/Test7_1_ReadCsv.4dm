//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($pc_o;$folder_o)
C_COLLECTION:C1488($result_c)

$folder_o:=Folder:C1567(fk resources folder:K87:11)

$pc_o:=PostalCode 
$result_c:=$pc_o.update($folder_o)
