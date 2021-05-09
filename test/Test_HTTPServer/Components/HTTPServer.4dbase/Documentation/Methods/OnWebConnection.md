<!--OnWebConnection(object; text; text)
This method returns the class store object of the component.-->
### OnWebConnection()

**OnWebConnection** (webServer; remoteIP; hostIP)

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|webServer|object|&#x2192;|Web Server object||
|remoteIP|text|&#x2192;|Remote IP address||
|hostIP|text|&#x2192;|Host IP address||

This method is used to handle web request.

Just call this method in your On Web Connection database method.

Pass Web Server object returned by 4D's `Web Server` command to the first parameter. It tells the component which web server configuration should be loaded.

Then pass `$3` (remoteIP) and `$4` (hostIP) parameter of the On Web Connection database method to the second and the third parameter.

#### Example

```4d
// On Web Connection database method
C_TEXT($1; $2; $3; $4; $5; $6)
OnWebConnection(Web Server; $3; $4)
```

---
