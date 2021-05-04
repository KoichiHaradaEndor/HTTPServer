<!--encodeURIComponent(text) -> text
This method encodes a URI component by replacing each characters with escape sequence representing the UTF-8 encoding of the character.-->
### encodeURIComponent()

**encodeURIComponent** (textToEncode) -> text

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|textToEncode|text|&#x2192;|Text to encode||
|return|text|&#x2190;|Encoded text||

This method encodes a URI component by replacing each characters with escape sequence representing the UTF-8 encoding of the character.

In `textToEncode` parameter, pass a text that you want to encode.

This method escapes all characters except: A-Z a-z 0-9 - _ . ! ~ * ' ( )

#### Example

```4d
C_TEXT($original_t;$encoded_t;$decoded_t)
$original_t:="ABC123あいう"
$encoded_t:=encodeURIComponent($original_t) // returns ABC123%E3%81%82%E3%81%84%E3%81%86
$decoded_t:=decodeURIComponent($encoded_t) // returns ABC123あいう
```

---
