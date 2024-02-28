#!/bin/sh

# Common shcgi setup

export SHCGI=$(cgi-init)
export SHCGI_SESSION=$(cgi-session)
cgi-session -s
