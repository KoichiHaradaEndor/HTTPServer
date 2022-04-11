# Directory Traversal

## Provision

- Avoid directly specifying the file name to open, by using user input.
- Reject file name that contains `/`, `\` and `:`.

## Discussion

When the apllication accepts file name input by the user and returns it as the response, the code may look like:

```4D
// bad example
$file_o:=Folder("/PACKAGE/Downloads").file($filename_t)
$filePath_t:=$file_o.platformPath
WEB SEND FILE($filePath_t)
```

where the content of the `$filename_t` come from user input, specifying the file name to fetch in the `Downloads` folder.

When the `$filename_t` is "dog.jpg" for instance, the picture file whose path is "/PACKAGE/Downloads/dog.jpg" will be returned as the response.

Then imagine cracker inputs `../Folder/File.XXX` as the file name. In this case, the file path becomes `/PACKAGE/Folder/File.XXX` and `WEB SEND FILE` command will send the file named File.XXX in the folder /PACKAGE/Folder/, that may include 4D's project files or data file.

To avoid this, first consider not to allow file name input.

Or check if the `$filename_t` contains path special characters like `/`, `\` or `:`. If so, consider it as an attack and stop processing the request.

- [Return to index](index.html)
