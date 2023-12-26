//%attributes = {"invisible":true,"preemptive":"capable"}
/**
* This method converts character set name to MIBEnum.
*
* @param {Text} $1 Character set name
* @return {Longint} $0 MIBEnum of the character set
* @author HARADA Koichi
*/

C_TEXT:C284($1;$chaset_t)
C_LONGINT:C283($0;$mibenum_l)

$chaset_t:=$1
$mibenum_l:=0

Case of 
	: ($chaset_t="UTF-32")
		$mibenum_l:=1017
		
	: ($chaset_t="UTF-32BE")
		$mibenum_l:=1018
		
	: ($chaset_t="UTF-32LE")
		$mibenum_l:=1019
		
	: ($chaset_t="UTF-16")
		$mibenum_l:=1015
		
	: ($chaset_t="UTF-16BE")
		$mibenum_l:=1013
		
	: ($chaset_t="UTF-16LE")
		$mibenum_l:=1014
		
	: ($chaset_t="UTF-8")
		$mibenum_l:=106
		
	: ($chaset_t="UTF-7")
		$mibenum_l:=1012
		
	: ($chaset_t="US-ASCII") | ($chaset_t="ANSI_X3.4-1968") | ($chaset_t="ANSI_X3.4-1986") | ($chaset_t="ASCII")
		$mibenum_l:=3
		
	: ($chaset_t="cp367") | ($chaset_t="csASCII") | ($chaset_t="IBM367") | ($chaset_t="iso-ir-6")
		$mibenum_l:=3
		
	: ($chaset_t="ISO_646.irv:1991") | ($chaset_t="ISO646-US") | ($chaset_t="us")
		$mibenum_l:=3
		
	: ($chaset_t="IBM437") | ($chaset_t="cp437") | ($chaset_t="437") | ($chaset_t="csPC8CodePage437")
		$mibenum_l:=2011
		
	: ($chaset_t="ebcdic-cp-us") | ($chaset_t="cp037") | ($chaset_t="csIBM037") | ($chaset_t="ebcdic-cp-ca")
		$mibenum_l:=2028
		
	: ($chaset_t="ebcdic-cp-n") | ($chaset_t="ebcdic-cp-wt") | ($chaset_t="IBM037")
		$mibenum_l:=2028
		
	: ($chaset_t="MacRoman") | ($chaset_t="x-mac-roman") | ($chaset_t="mac") | ($chaset_t="macintosh") | ($chaset_t="csMacintosh")
		$mibenum_l:=2027
		
	: ($chaset_t="windows-1252")
		$mibenum_l:=2252
		
	: ($chaset_t="MacCE") | ($chaset_t="x-mac-ce")
		$mibenum_l:=1250
		
	: ($chaset_t="windows-1250")
		$mibenum_l:=2250
		
	: ($chaset_t="windows-1251")
		$mibenum_l:=2251
		
	: ($chaset_t="windows-1253")
		$mibenum_l:=2253
		
	: ($chaset_t="windows-1254")
		$mibenum_l:=2254
		
	: ($chaset_t="windows-1256")
		$mibenum_l:=2256
		
	: ($chaset_t="windows-1255")
		$mibenum_l:=2255
		
	: ($chaset_t="windows-1257")
		$mibenum_l:=2257
		
	: ($chaset_t="x-mac-cyrillic")
		$mibenum_l:=1251
		
	: ($chaset_t="x-mac-greek")
		$mibenum_l:=1253
		
	: ($chaset_t="x-mac-turkish")
		$mibenum_l:=1254
		
	: ($chaset_t="x-mac-arabic")
		$mibenum_l:=1256
		
	: ($chaset_t="x-mac-hebrew")
		$mibenum_l:=1255
		
	: ($chaset_t="x-mac-ce")
		$mibenum_l:=1257
		
	: ($chaset_t="Shift_JIS") | ($chaset_t="csShiftJIS") | ($chaset_t="MS_Kanji") | ($chaset_t="Shift-JIS")
		$mibenum_l:=17
		
	: ($chaset_t="ISO-2022-JP") | ($chaset_t="csISO2022JP")
		$mibenum_l:=39
		
	: ($chaset_t="Windows-31J")
		$mibenum_l:=2024
		
	: ($chaset_t="Big5") | ($chaset_t="csBig5")
		$mibenum_l:=2026
		
	: ($chaset_t="EUC-KR") | ($chaset_t="csEUCKR")
		$mibenum_l:=38
		
	: ($chaset_t="KOI8-R") | ($chaset_t="csKOI8R")
		$mibenum_l:=2084
		
	: ($chaset_t="ISO-8859-1") | ($chaset_t="CP819") | ($chaset_t="csISOLatin1") | ($chaset_t="IBM819") | ($chaset_t="iso-ir-100")
		$mibenum_l:=4
		
	: ($chaset_t="ISO_8859-1") | ($chaset_t="ISO_8859-1:1987") | ($chaset_t="l1") | ($chaset_t="latin1")
		$mibenum_l:=4
		
	: ($chaset_t="ISO-8859-2") | ($chaset_t="csISOLatin2") | ($chaset_t="iso-ir-101") | ($chaset_t="ISO_8859-2")
		$mibenum_l:=5
		
	: ($chaset_t="ISO_8859-2:1987") | ($chaset_t="l2") | ($chaset_t="latin2")
		$mibenum_l:=5
		
	: ($chaset_t="ISO-8859-3") | ($chaset_t="csISOLatin3") | ($chaset_t="ISO-8859-3:1988") | ($chaset_t="iso-ir-109")
		$mibenum_l:=6
		
	: ($chaset_t="ISO_8859-3") | ($chaset_t="l3") | ($chaset_t="latin3")
		$mibenum_l:=6
		
	: ($chaset_t="ISO-8859-4") | ($chaset_t="csISOLatin4") | ($chaset_t="ISO-8859-4:1988") | ($chaset_t="iso-ir-110")
		$mibenum_l:=7
		
	: ($chaset_t="ISO_8859-4") | ($chaset_t="l4") | ($chaset_t="latin4")
		$mibenum_l:=7
		
	: ($chaset_t="ISO-8859-5") | ($chaset_t="csISOLatinCyrillic") | ($chaset_t="cyrillic")
		$mibenum_l:=8
		
	: ($chaset_t="ISO-8859-5:1988") | ($chaset_t="iso-ir-144") | ($chaset_t="ISO_8859-5")
		$mibenum_l:=8
		
	: ($chaset_t="ISO-8859-6") | ($chaset_t="arabic") | ($chaset_t="ASMO-708") | ($chaset_t="csISOLatinArabic")
		$mibenum_l:=9
		
	: ($chaset_t="ECMA-114") | ($chaset_t="ISO-8859-6:1987") | ($chaset_t="iso-ir-127") | ($chaset_t="ISO_8859-6")
		$mibenum_l:=9
		
	: ($chaset_t="ISO-8859-7") | ($chaset_t="csISOLatinGreek") | ($chaset_t="ECMA-118") | ($chaset_t="ELOT_928") | ($chaset_t="greek")
		$mibenum_l:=10
		
	: ($chaset_t="greek8") | ($chaset_t="iso-ir-126") | ($chaset_t="ISO_8859-7") | ($chaset_t="ISO_8859-7:1987")
		$mibenum_l:=10
		
	: ($chaset_t="ISO-8859-8") | ($chaset_t="csISOLatinHebrew") | ($chaset_t="hebrew")
		$mibenum_l:=11
		
	: ($chaset_t="iso-ir-138") | ($chaset_t="ISO_8859-8") | ($chaset_t="ISO_8859-8:1988")
		$mibenum_l:=11
		
	: ($chaset_t="ISO-8859-9") | ($chaset_t="csISOLatin5") | ($chaset_t="iso-ir-148") | ($chaset_t="ISO_8859-9")
		$mibenum_l:=12
		
	: ($chaset_t="ISO_8859-9:1989") | ($chaset_t="l5") | ($chaset_t="latin5")
		$mibenum_l:=12
		
	: ($chaset_t="ISO-8859-10") | ($chaset_t="csISOLatin6") | ($chaset_t="iso-ir-157") | ($chaset_t="ISO_8859-10")
		$mibenum_l:=13
		
	: ($chaset_t="ISO_8859-10:1992") | ($chaset_t="l6") | ($chaset_t="latin6")
		$mibenum_l:=13
		
	: ($chaset_t="ISO-8859-13")
		$mibenum_l:=109
		
	: ($chaset_t="ISO-8859-15") | ($chaset_t="Latin-9")
		$mibenum_l:=111
		
	: ($chaset_t="GBK")
		$mibenum_l:=113
		
	: ($chaset_t="GB2312") | ($chaset_t="csGB2312") | ($chaset_t="x-mac-chinesesimp")
		$mibenum_l:=2025
		
	: ($chaset_t="GB_2312-80") | ($chaset_t="csISO58GB231280")
		$mibenum_l:=57
		
	: ($chaset_t="x-mac-japanese")
		$mibenum_l:=1258
		
End case 

$0:=$mibenum_l
