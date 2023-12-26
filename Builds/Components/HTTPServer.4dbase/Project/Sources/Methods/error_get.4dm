//%attributes = {"invisible":true,"preemptive":"capable"}
/**
* This method returns error_c collection which could be
* initialized when system error is generated with in
* versatile error hanldler is installed, or
* error_throw method is called.
*
* @return {Collection} $0 Error message collection
*/

C_COLLECTION:C1488($0;error_c)

$0:=error_c
