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

`cgi-session [-h | -s | -x | [<param> [<value>]]`
Create and manage sessions.

`cgi-set-cookie <name> <value>`
Set a cookie in the response.

# environment variables

`SHCGI`
The CGI directory created by `cgi-init`.

`SHCGI_SESSION`
The current session directory.

`SHCGI_SESSION_LIFETIME`
The lifetime in minutes of a session. Default is 30.

`SHCGI_SESSION_DIR`
The directory used to store sessions. Default is `cgi-sessions` in the current directory.

`SHCGI_SESSION_COOKIE`
The name of the cookie used for the session ID. Default is `session`.

# example
```sh
#!/bin/sh

export SHCGI=$(cgi-init)

export SHCGI_SESSION=$(cgi-session)
cgi-session -s

cgi-header 'Content-type: text/html'

cat <<EOF
<html>
<head>
<title>CGI example</title>
</head>
<body>
<p>Value of parameter foo: $(cgi-param foo)</p>
<p>Value of session parameter bar: $(cgi-session bar)</p>
</body>
</html>
EOF

cgi-free
```
