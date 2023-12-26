//%attributes = {"invisible":true,"preemptive":"capable"}
/** 
* This method is used to find first candidate that matches Accept header.
* 
*/

C_OBJECT:C1216($1)
C_TEXT:C284($2;$pattern_t)

C_TEXT:C284($candidate_t)

$candidate_t:=$1.value
$pattern_t:=$2

$1.result:=($candidate_t=$pattern_t)
