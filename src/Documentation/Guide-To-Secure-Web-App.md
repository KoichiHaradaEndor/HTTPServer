# Guide to secure web application built with 4D

You should read [4D SECURITY GUIDE](https://blog.4d.com/4d-security-guide/) first.

Only ORDA is taken into account in this read.

## Against typical attack method

### SQL Injection

#### Provision

- Use `exact match` comparison operator and `placeholder` when building query sentense.
- Use `Verify password hash` command to verify password.

#### Discussion

I consider this attack as "query cheating" under 4D.

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
- using placeholder `:1`. You can also use `querySettings` parameter
- using exact match comparison operator (`===` or `IS`) to invalidate wild card character "@"
- using `Verify password hash`
  - to take out password check clause from querying a user sentence
  - to not store plain password text in the database (this is to avoid leaking passwords)

### Directory Traversal

#### Provision

- Avoid directly specifying the file name to open, specified by the user input.
- Reject file name which contains `/`, `\` and `:`.

#### Discussion

When the apllication accepts file name input by the user and returns it as the response, the code may look like:

```4D
// bad example
$file_o:=Folder("/PACKAGE/WebFolder").file($filename_t)
$filePath_t:=$file_o.platformPath
WEB SEND FILE($filePath_t)
```

where the `$filename_t` is user input, specifying the file name to fetch in the `Downloads` folder.

When the `$filename_t` is "dog.jpg" for instance, the picture file whose path is "/PACKAGE/Downloads/dog.jpg" will be returned as the response.

Then imagine cracker inputs "`../Data/data.4DD`" as the file name. In this case, the file path becomes `/PACKAGE/Data/data.4DD` and `WEB SEND FILE` command will send the 4D's data file (if the data file exists in that location wjth the name).

To avoid this, first consider not to allow file name input.

Or check if the `$filename_t` contains path special characters like `/`, `\` or `:`. If so, consider it as an attack and stop processing the request.

### Vulnerabilitoes not discussed in this article

because I cannot find GOOD (or BAD) example to show how dangerous they are under 4D environment.

- OS Command Injection

## References

- [How to Secure Your Web Site](https://www.ipa.go.jp/security/vuln/websecurity.html) by IPA
