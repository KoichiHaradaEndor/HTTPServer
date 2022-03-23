<!-- Session class is used to manage web session. -->

# Session class

Session class is used to manage web session.

It uses cookie to transfer session id between http server and client.

When the session storage is not specified, memory store is used. But it is only for development purpose and should not be used in production.

## Constructor

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|options|object|&#x2192;|Session options||

In the `options` parameter, you can pass an object that defines how the session works. It accepts following attributes:

**cookie**

Defines options of the session cookie. For details, please refer to [Set-Cookie](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Set-Cookie) (MDN) and [Using HTTP cookies](https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies) (MDN).

`options` parameter accepts object type. Please refer to [Response.cookie](https://koichiharadaendor.github.io/HTTPServer/src/Documentation/Classes/Response.html#cookie) for available attributes.

**name** {text}

The name of the cookie used to store session ID. The default value is `HttpServer.sid`.

**proxy** {boolean}

Trust the reverse proxy when setting `secure` option to true (via `"X-Forwarded-Proto"` header). The default is `false`.

- `true` : The `"X-Forwarded-Proto"` header is used.
- `false` : The connection is considered as secure only when the connection is made under SSL/TLS directly.

**saveUninitialized** {boolean}

When this option is set to `true`, uninitialize session (newly created but no values are added to the session variable) will be saved in data store. Otherwise uninitialized session will not be saved. The default is `false`.

**secret** {text | collection} *required*

This is the secret passphrase used to sign the session ID. It can be a single secret or a collection of multiple secrets. When a collection is provided, the first element is used to sign the session ID, while all elements are used when verifying the signature in requests.

**store** {4D:Formula}

The 4D formula object that contains storing session data into a data store. When it is not specified, memory store is used (should be used for development purpose only).

To implement the method, please refer to [Session Store Implementation](#session-store-implementation) chapter for detail.

## Properties

Upon this class is installed in the application, `session` property will be added to `request` object, which will be passed as the first parameter to route handler methods. To store or access the data, simply use `request.session.attributeName` or `request.session["attribute-name"]`. Also you can access to the following attributes through `request.session`.

### id

Session ID associated with the session. It should not be modified otherwise the session becomes invalid.

### cookie

The cookie settings for the session. You can, for example, alter `request.session.cookie.maxAge` for the client only. Then the altered settings will be used in the following response.

## Methods

Upon this class is installed in the application, `session` property will be added to `request` object. Then you can use the following methods through `request.session`.

### regenerateID()

**request.session.regenerateID()**

This method is used to regenerate session id and replace the current one with it. The other values, including session variable values are not altered.

Essentially this method is used when login is established. To avoid "Session Fixation Attack", session ID should be altered after login. And the newly generated session ID is used for he logged in session.

### destroy()

**request.session.destroy()**

This method is used to destroy the session and empty the request.session property.

### save()

**request.session.save()**

Saves the session back to the store. Please note, this method will be automatically called at the end of the response process. So basically you do not need to call this method.

## Session Store Implementation

When implementing session store method to be passed to `options.store` attribute, bellows are the list of methods to be implemented.

**Note** : If needed, you can implement cron process method that will periodically be called to look for the timed out sessions, and then delete them to free spaces used for the server session store. The [Cron](https://github.com/KoichiHaradaEndor/Cron) component may help you to implement such process.

### store.destroy()

**store.destroy**(sid) *Required*

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|sid|text|&#x2192;|Session ID||

When this method is called, it should delete a session specified by `sid` parameter from the store.

### store.get()

**store.get**(sid) -> session *Required*

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|sid|text|&#x2192;|Session ID||
|session|object|&#x2190;|Session Object||

When this method is called, it should return a session specified by `sid` parameter from the store.

If the session corresponds to the `sid` does not exist, return empty object.

### store.set()

**store.set**(sid; session) *Required*

|Name|Type||Description||
|-----|-----|-----|-----|-----|
|sid|text|&#x2192;|Session ID||
|session|object|&#x2192;|Session Object||

When this method is called, it should save the session object to the store specified by `sid` parameter.

