# Cross Site Request Forgery

## Provision

- Generate secure token and use it for tracking user transition.

## Discussion

When your web application provides "Bulletin Board" function, it may look like:

HTML code

```HTML
<form method="POST" action="https://targetSite/addBB">
    <textarea name="content"></textarea>
    <input type="submit">
</form>
```

4D code

```4D
Case of 
    : ($url_t="/addBB")
        // generic method to extract form value by name
        $content_t:=getRequestVariableText("content")

        $bulletinBoardEntity_o:=ds.BulletinBoard.new()
        $bulletinBoardEntity_o.content:=$content_t
        // authenticated user ID
        $bulletinBoardEntity_o.userId:=$userId_t
        $bulletinBoardEntity_o.save()
End case
```

Then an attacker provides trap page that contains following HTML code:

```HTML
<body onload="document.forms[0].submit()">
<form method="POST" action="https://targetSite/addBB">
    <input type="hidden" name="content" value="You have been hacked">
</form>
</body>
```

When a victim opens this trap page, the post request will be made to the target site, along with victim's valid session cookie value. If the victim has logged in to the site, the malicious post will be saved under victim's privilege.

To avoid this attack, generate an unpredictable token and use it to track user transition.

```HTML
<form method="POST" action="https://targetSite/addBB">
    <textarea name="content"></textarea>
    <input type="hidden" name="token" value="$4DTEXT($1.token)">
    <input type="submit">
</form>
```

The 4D code that serves this page looks like:

```4D
Case of
  :($httpMethod_t="GET")
    // It is important to check if this is called via GET method
    // since the token should be generated when this page is requested via GET method
    // You can extract HTTP method via WEB GET HTTP HEADER command

    $token_t:=Generate UUID
    $var_o:=New object("token"; $token_t; "action"; "adding bulletin board")
    PROCESS 4D TAGS($htmlTemPlate_t; $html_t; $var_o)
    WEB SEND TEXT($html_t)

    Use(Session.storage.tokens)
      // assumes Session.storage.tokens shared collection exists
      Session.storage.tokens.push(OB Copy($var_o; ck shared; Session.storage.tokens))
    End use

  Else

End case
```

Note that the token is registered to the appropriate user session. Even though the attacker requested this page and got the token too, it is registered to the attacker's session. So even attacker provides trap page with the token value, it will not match with the one registered for the user session.

4D code for handling "/addBB" request would be

```4D
// $url_t is "/addBB"
Case of
  :($httpMethod_t="POST")

    // note using exact match not to allow wildcard character
    Use (Session.storage.token)
      $indices_c:=Session.storage.tokens.indices("token === :1"; $token_t)
      If($indices_c.length=1)
        // process the request

        // then removes the token from the session storage
        Session.storage.tokens.remove($indices_c[0])
      End if
    End use
End case
```

[Return to index](index.html)
