# Guide to secure web application built with 4D

## Against typical attack method

### SQL Injection

#### Provision

Use placeholder every time.

#### Discussion

If you use only "classic" 4D query commands, you don't need to worry about this vulnerability.

On the other hand, if you use SQL or ORDA when querying 4D database, you should use placeholder when building query sentence.

```4D
// Do not do this
$sel:=ds.Table.query("field = "+$value)

// but do this
$sel:=ds.Table.query("field = :1"; $value)
```

<cite><a src="https://www.ipa.go.jp/security/vuln/websecurity.html">How to Secure Your Web Site</a></cite> by IPA

