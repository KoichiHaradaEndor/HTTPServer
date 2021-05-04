![Github](https://img.shields.io/badge/4D-v19-blue?style=flat-square)
[![GitHub](https://img.shields.io/github/license/KoichiHaradaEndor/HTTPServer?style=flat-square)](LICENSE)

# HTTPServer

## Overview

4D Component which includes methods to help your web developing.

## Description

By Installing this component into your 4D project, several methods are added to your 4D project, in order for making web developing easier.

## Requirement

4D v18R3 or above

Note: This component uses new "Class" function introduced in 4D v18R3. Please do not open it with 4D v18R2 and under.

## Install

This is a 4D component, so you should build this source as 4D component and place it in the "Components" folder of your project root.

## Documents

Please refer to the [doc](https://koichiharadaendor.github.io/HTTPServer/).

### Contents

- General
    - [About HTTPServer component](https://koichiharadaendor.github.io/HTTPServer/src/Documentation/Home.html)
- Shared Methods
    - [import HttpServer](https://koichiharadaendor.github.io/HTTPServer/src/Documentation/Methods/import%20HttpServer.html)
    - [OnWebConnection](https://koichiharadaendor.github.io/HTTPServer/src/Documentation/Methods/OnWebConnection.html)
    - [decodeURIComponent](https://koichiharadaendor.github.io/HTTPServer/src/Documentation/Methods/decodeURIComponent.html)
    - [encodeURIComponent](https://koichiharadaendor.github.io/HTTPServer/src/Documentation/Methods/encodeURIComponent.html)
- Classes
    - [HttpServer](https://koichiharadaendor.github.io/HTTPServer/src/Documentation/Classes/HttpServer.html)
    - [Request](https://koichiharadaendor.github.io/HTTPServer/src/Documentation/Classes/Request.html)
    - [Response](https://koichiharadaendor.github.io/HTTPServer/src/Documentation/Classes/Response.html)
    - [Route](https://koichiharadaendor.github.io/HTTPServer/src/Documentation/Classes/Route.html)
    - [Router](https://koichiharadaendor.github.io/HTTPServer/src/Documentation/Classes/Router.html)
    - [SingleRoute](https://koichiharadaendor.github.io/HTTPServer/src/Documentation/Classes/SingleRoute.html)
    - [VirtualHost](https://koichiharadaendor.github.io/HTTPServer/src/Documentation/Classes/VirtualHost.html)

## Example

Small sample demo is in the "test" folder. Just launch it with 4D v18 Standalone and connect to it with your favorite web browser via http://localhost/.

## License

HTTPServer component is released under MIT license.

## Release Note

- Added Request.baseUrl attribute support  (2021-05-02)
- Fixed bug : Request.params does not return params when multiple route matches the path  (2021-05-02)  
- Fixed bug : Response.cookie, httpOnly was not default, path param was not root when option is omitted  (2021-04-02)
- Fixed bug : Response.redirect did not work (2021-04-02)
- Added component HTTP server support (2020-05-24)
- Modified compareCaseSensitive command (2020-05-09)
- Rewritten using 4D v18R3 using Class function (2020-05-06)
- Added new Router (2020-04-26)
- Moved HttpServer.vhost to new Virtualhost (2020-04-23)
