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

The `prefix` make variable controls where the tools are installed.
Default value is `/usr/local`.

# tools

| usage                                         | description                                                                                      |
| --------------------------------------------- | ------------------------------------------------------------------------------------------------ |
| `. cgi`                                       | Shortcut to setup the CGI directory and a session.                                               |
| `cgi-cookie (-a \| <name> [<value>])`         | Get a cookie from the request, or set a cookie in the response.                                  |
| `cgi-file [-e] <file>`                        | Send the contents of a file in the response, automatically determining the Content-Type header.  |
| `cgi-free`                                    | Clean up the CGI files directory.                                                                |
| `cgi-header [-n] <header>`                    | Build the HTTP headers for the response.                                                         |
| `cgi-init`                                    | Initiate the CGI files directory. Should be cleaned up at the end of the script with `cgi-free`. |
| `cgi-keep-alive [-b] <pid> [<message>]`       | Keep the CGI script alive with messages while a process is running.                              |
| `cgi-param (-a \| <name>)`                    | Read parameters from the request.                                                                |
| `cgi-session [-s \| -x \| <param> [<value>]]` | Create and manage sessions.                                                                      |

# environment variables

| name                       | description                                                                                 |
| -------------------------- | ------------------------------------------------------------------------------------------- |
| `SHCGI`                    | The CGI directory created by `cgi-init`.                                                    |
| `SHCGI_COOKIE_DOMAIN`      | The domain used for cookies.                                                                |
| `SHCGI_COOKIE_PATH`        | The path used for cookies.                                                                  |
| `SHCGI_KEEPALIVE_INTERVAL` | How often in ticks to send a keep-alive message. Default is 30.                             |
| `SHCGI_KEEPALIVE_TICK`     | How long in seconds the program waits between checking the status of the PID. Default is 1. |
| `SHCGI_SESSION`            | The current session directory.                                                              |
| `SHCGI_SESSION_LIFETIME`   | The lifetime in minutes of a session. Default is 30.                                        |
| `SHCGI_SESSION_DIR`        | The directory used to store sessions. Default is `cgi-sessions` in the current directory.   |
| `SHCGI_SESSION_COOKIE`     | The name of the cookie used for the session ID. Default is `session`.                       |

# example
```sh
#!/bin/sh

. cgi

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
