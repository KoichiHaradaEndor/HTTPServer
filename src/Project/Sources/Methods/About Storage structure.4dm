//%attributes = {"invisible":true}
/*
* ########################
* Structure of the Storage
* ########################
*
* Storage.__constants__ | Object | Constants used in this component
* Storage.__mimeTypes__ | Collection | Mime Type dictionary
* Storage.{ServerName} | Object | HTTP server config object
* Storage.{ServerName}.componentOptions | Object | Component option object
* Storage.{ServerName}.componentOptions.dynamicFolder | Object | Path object of the dynamic folder
* Storage.{ServerName}.options | Object | HTTP server option object
* Storage.{ServerName}.hosts | Collection | Collection of named hosts
* Storage.{ServerName}.hosts[].hostname | Text | Domain name of the host
* Storage.{ServerName}.hosts[].routes | Collection | Collection of routes
* Storage.{ServerName}.hosts[].routes[].method | Text | Used to search by HTTP method value
* Storage.{ServerName}.hosts[].routes[].baseUrl | Text | Regular expression pattern used to calculate baseUrl property
* Storage.{ServerName}.hosts[].routes[].path | Text | Regular expression pattern used to search by request path
* Storage.{ServerName}.hosts[].routes[].callback | Object | Formula reference which is called when above conditions are match
* Storage.{ServerName}.hosts[].routes[].params | Collection | Collection of keys used for path parameter
*/