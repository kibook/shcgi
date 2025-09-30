#!/bin/sh

# Common shcgi setup

export SHCGI=$(cgi-init)
export SHCGI_REQUEST_BODY=$SHCGI/request-body
export SHCGI_PARAMS=$SHCGI/params
export SHCGI_COOKIES=$SHCGI/cookies
export SHCGI_SESSION=$(cgi-session)
cgi-session -s
