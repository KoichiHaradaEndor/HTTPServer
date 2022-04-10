# Guide to secure web application built with 4D

You should read [4D SECURITY GUIDE](https://blog.4d.com/4d-security-guide/) first.

Only ORDA is taken into account in this read.

## Against typical attack method

### SQL Injection

#### Provision

- Use `exact match` comparison operator and placeholder when building query sentense.
- Use `Verify password hash` to verify password.

#### Discussion

I consider this attack as "cheating query" under 4D.

For example, when the querying a user code is like follow,
```4D
$userSelection_o:=ds.User.query("loginname = '"+$loginname_t+"' & password = "+$password_t)
$authenticated_b:=(userSelection_o.length=1)
```

attacker can give `victimName' | loginname = '` for login name and empty string for password parameter.

Then the query sentence becomes:

```4D
$userSelection_o:=ds.User.query("loginname = 'victimName' | loginname = '' & password = ")
```

The result is, a user whose login name is "victimName" will be loaded even though the password is not given.

To avoid this vulnerablity, the code should look like:

```4D
$userSelection_o:=ds.User.query("loginname === :1; $loginname_t)
Case of
  :($userSelection_o#Null)
  :($userSelection_o.length=0)
  Else
    $userEntity_o:=$userSelection_o.first()
    $authenticated_b:=Verify password hash($password_t; $userEntity_o.password)
End case
```

Note:
- using placeholder `:1`. You can also use querySettings parameter
- using exact match comparison operator `===` or `IS` to invalidate wild card character "@"
- using `Verify password hash`
  - to enforce password check
  - to not store plain password text (this is to avoid leaking passwords)


## References

- <cite><a src="https://www.ipa.go.jp/security/vuln/websecurity.html">How to Secure Your Web Site</a></cite> by IPA
