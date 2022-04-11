# Improper Session Management

## Attack scenario

I have not tried this scenario and do not confirm if it's realizable. However it seems to work in theory.

1. An attacker provides fake wi-fi access point and a machine that hosts fake web server.
1. The wi-fi AP DHCP server is configured as the "default gateway" to the fake web server machine. Thus all packets go to the computer. This machine works as proxy.
1. Configure route table of this machine as to reroute request packets for the target site port `80` to the local fake web server.
1. The attacker provides trap page that contains image tag whose src value is `http://target-site/beacon.gif`.
1. When a victim opens the trap page, an HTTP request for the beacon.gif is made to `http://target-site` but it will be handled by the fake web server.
1. The fake web server makes a request to the real target site and fetch session ID, then respond to the victim's request with the fetched session ID.
1. Finally the session ID for the target site that the attacker provides is set to the victime's web client.
1. Then the victim makes the request to the target site over `HTTPS`, the web client will send the session ID that is set by the attacker.
1. The victim login to the target site. Since the attacker knows the session ID, attacker also can browse the site under the victim's access privilege.

## Provision

- Generate another session ID after login and use it for managing anthentication
- Use SSL/TLS connection and gives "secure" option to the session ID cookie.

## Discussion

This issue occurs because the bad session ID is tied to the authenticated user session. To prevent this, generate another session ID after login is established and use it for tracking user authentication.

Of course the newly generated session ID must be sent to the user's web client under SSL/TLS connection, and also set the secure flag to prevent from peeking.

```4D
// after a user is autheticated
$sessionId_t:=Generate UUID
WEB SET HTTP HEADER("Set-Cookie: CookeiName="+$sessionId_t+"; Secure; HttpOnly; SaveSite=Lax")

$auth_o:=New object
$auth_o.sessionId:=$sessionId_t
$auth_o.user:=$userEntity_o // authenticated user entity
Use(Session.storage.auth) // assumes Session.storage.auth shared object exists
    Session.storage.auth:=OB Copy($auth_o; ck shared; Session.storage.auth)
End use
```

when the next request comes, extract the cookie value whose name is CookeiName, then compare it with the value of `Session.storage.auth.sessionId` using exact match.

```4D
$authenticated_b:=Compare strings(Session.storage.auth.sessionId; $cookieValue_t; sk char codes)
```

- [Return to index](index.html)