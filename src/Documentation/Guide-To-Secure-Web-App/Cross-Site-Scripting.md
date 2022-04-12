# Cross Site Scripting

## Provision

- Avoid using `4DEVAL`, `4DHTML`, and `4DSCRIPT` tags but use `4DTEXT` tag to insert data into HTML content. 

## Discussion

`Cross Site Scripting` attack is take effect when user input data is inserted into HTML without escaping HTML special characters such as `<`, `>`, `&` and `"`.

When the 4D code looks like:

```4D
// prepare html template
...
$htmlTemplate_t:=$htmlTemplate_t+"<p>$4DEVAL($1)</p>"
...

// provide data to insert
ARRAY TEXT($names_at; 0)
ARRAY TEXT($values_at; 0)
WEB GET VARIABLES($names_at; $values_at)

$index_l:=Find in array($names_at; "userInput")
If ($index_l>0)
    $userInput_t:=$values_at{$index_l}
End if 

// make response
PROCESS 4D TAGS($htmlTemplate_t; $html_t; $userInput_t)
WEB SEND TEXT($html_t)
```

then the attacker can provide a link that calls this code:

https://targetSite/command?userInput=&#37;3Cscript&#37;3Edocument.querySelector(&#37;27body&#37;27).textContent=&#37;27XSS&#37;27&#37;3C/script&#37;3E

When a victim click on this link, the web server receives a request whose query string is "userInput=&lt;script&gt;document.querySelector('body').textContent='XSS'&lt;/script&gt;"

Since `4DEVAL` (as well as `4DHTML`) tag inserts the given data without escaping HTML special characters, the script block is inserted as is and will be executed on the victim's web client.

This is also true when using `4DSCRIPT` tag. When the user input data start with `Char(1)`, it works the same as `4DHTML` and `4DEVAL`.

```4D
// getRequestVariableText method
// Available through 4D tags property is checked
#DECLARE($varName_t : Text)->$varValue_t : Text

// removes the first '/'
$varName_t:=Substring($varName_t; 2)

// provide data to insert
ARRAY TEXT($names_at; 0)
ARRAY TEXT($values_at; 0)
WEB GET VARIABLES($names_at; $values_at)

$index_l:=Find in array($names_at; $varName_t)
If ($index_l>0)
    $varValue_t:=$values_at{$index_l}
End if 
```

```HTML
<p>InputData</p>
<p><!--#4DSCRIPT/getRequestVariableText/userInput--></p>
```

https://targetSite/command?userInput=&#37;01&#37;3Cscript&#37;3Edocument.querySelector(&#37;27body&#37;27).textContent=&#37;27XSS&#37;27&#37;3C/script&#37;3E

Note the `%01` just after "userInput=". By doing this, 4D tranlates the userInput data and treats it as starting with `Char(1)`.

So I recommend not to use `4DEVAL`, `4DHTML`, and `4DSCRIPT` tag to insert user input text into response HTML, but use `4DTEXT` only. (Note that "user input text" includes data come from database.)

To execute 4D code while parsing HTML, you can use `4DCODE` tag.

[Return to index](index.html)
