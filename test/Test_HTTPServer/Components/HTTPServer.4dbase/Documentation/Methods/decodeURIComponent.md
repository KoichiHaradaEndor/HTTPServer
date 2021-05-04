<!--decodeURIComponent(text) -> text
This method is used to decode a text encoded with encodeURIComponent.-->
### decodeURIComponent()

**decodeURIComponent** (textToDecode) -> text

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|textToDecode|text|&#x2192;|Text to decode||
|return|text|&#x2190;|Decoded text||

This method is used to decode a URI component previously encoded with encodeURIComponent.

In `textToDecode` parameter, pass a text encoded with encodeURIComponent.

#### Example

```4d
C_TEXT($original_t;$encoded_t;$decoded_t)
$original_t:="ABC123あいう"
$encoded_t:=encodeURIComponent($original_t) // returns ABC123%E3%81%82%E3%81%84%E3%81%86
$decoded_t:=decodeURIComponent($encoded_t) // returns ABC123あいう
```

---
