# shcgi
CGI utilities for POSIX shell.

# requirements
- coreutils
- urlencode
- ripmime

# installation
```
make install
```

The `PREFIX` make variable controls where the tools are installed.
Default value is `/usr/local`.

# tools
`cookie name [value]`
Get a cookie from a request or set a cookie in a response.

`extractformdata [ripmime options]`
Extract files and values from a multipart/form-data encoded POST
request.

`param name`
Read URL-encoded POST parameters.

`header [-n] <header>`
Build the HTTP headers for the response.

`urlparam name`
Read URL-encoded GET parameters.
