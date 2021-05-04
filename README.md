![4Dv18R3 and above](https://camo.githubusercontent.com/cd1ecae487425bf0978c07ac556c360334d2ffccde4b82765dcf18735ed24187/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f34442d76313852332d626c75653f7374796c653d666c61742d737175617265)
[![MIT license](https://camo.githubusercontent.com/af78e35329b2dfe61ea32ff2e56715ae16bf6fa23bc8e5b82755c8c7fbddb3ba/68747470733a2f2f696d672e736869656c64732e696f2f6769746875622f6c6963656e73652f4b6f69636869486172616461456e646f722f485454505365727665723f7374796c653d666c61742d737175617265)](LICENSE)

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
