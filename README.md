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
| `cgi-keep-alive [-b] <pid> [<message>]`       | Keep the CGI script alive while a process is running.                                            |
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

# examples

## the basics
A very simple example of the shcgi tools in action.
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
<p>Value of cookie session: $(cgi-cookie session)</p>
</body>
</html>
EOF

cgi-free
```

## templates
This example demonstrates a method for creating template pages with variables that are filled in by the script.

### template.html
```html
<!DOCTYPE html>
<html>
    <head>
        <title>Template example</title>
    </head>
    <body>
        <p>The current date is: $current_date</p>
    </body>
</html>
```

### example.cgi
```sh
#!/bin/sh

. cgi

export current_date=$(date -I)

cgi-file -e template.html

cgi-free
```

## cgi-keep-alive
This example uses `cgi-keep-alive` to keep the CGI script alive while a very long process runs in the background.
```sh
#!/bin/sh

long_running_process() {
    sleep 120
}

. cgi

long_running_process &

# cgi-keep-alive will output dummy headers to keep the CGI script alive until long_running_process completes
cgi-keep-alive $!

cgi-header 'Content-type: text/html'

cat <<EOF
<html>
<head>
<title>CGI example</title>
</head>
<body>
<p>Sorry for the wait!</p>
</body>
</html>
EOF

cgi-free
```
