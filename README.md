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
`cgi-cookie [-a] <dir> [<name>]`
Get a cookie from the request.

`cgi-free <dir>`
Clean up the CGI files directory.

`cgi-header [-n] <header>`
Build the HTTP headers for the response.

`cgi-init`
Initiate the CGI files directory. Should be cleaned up at the end of the script with `cgi-free`.

`cgi-param [-a] <dir> [<name>]`
Read URL-encoded POST parameters.

`cgi-set-cookie <name> <value>`
Set a cookie in the response.

# example
```sh
#!/bin/sh

cgi=$(cgi-init)

cgi-header 'Content-type: text/html'

cat <<EOF
<html>
<head>
<title>CGI example</title>
</head>
<body>
<div>Value of parameter foo: $(cgi-param "$cgi" foo)</div>
</body>
</html>
EOF

cgi-free "$cgi"
```
