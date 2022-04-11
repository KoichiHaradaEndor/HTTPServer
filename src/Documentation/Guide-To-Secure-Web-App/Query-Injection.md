# Query Injection

## Provision

- Use `exact match` comparison operator and `placeholder` when building query sentense.
- Use `Verify password hash` command to verify password.

## Discussion

For example, when the querying a user code (for login) is like follow,
```4D
$userSelection_o:=ds.User.query("loginname = '"+$loginname_t+"' & password = '"+$password_t+"'")
$authenticated_b:=(userSelection_o.length=1)
```

attacker can give `victimName' | loginname = '` for login name and empty string for password parameter.

Then the query sentence becomes:

```4D
$userSelection_o:=ds.User.query("loginname = 'victimName' | loginname = '' & password = ''")
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
- using placeholder `:1`. You can also use `querySettings` parameter
- using exact match comparison operator (`===` or `IS`) to invalidate wild card character "@"
- using `Verify password hash`
  - to take out password check clause from querying a user sentence
  - to not store plain password text in the database (this is to avoid leaking passwords)

- [Return to index](index.html)
