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
`cgi-cookie (-a | <name>)`
Get a cookie from the request.

`cgi-free`
Clean up the CGI files directory.

`cgi-header [-n] <header>`
Build the HTTP headers for the response.

`cgi-init`
Initiate the CGI files directory. Should be cleaned up at the end of the script with `cgi-free`.

`cgi-param (-a | <name>)`
Read parameters from the request.

`cgi-set-cookie <name> <value>`
Set a cookie in the response.

# environment variables

`SHCGI`
The CGI directory created by `cgi-init`.

# example
```sh
#!/bin/sh

export SHCGI=$(cgi-init)

cgi-header 'Content-type: text/html'

cat <<EOF
<html>
<head>
<title>CGI example</title>
</head>
<body>
<div>Value of parameter foo: $(cgi-param foo)</div>
</body>
</html>
EOF

cgi-free
```
