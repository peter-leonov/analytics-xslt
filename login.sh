#!/bin/bash

mkdir -p data
# based on http://gdatatips.blogspot.com/2008/08/perform-clientlogin-using-curl.html
AUTH_URI="https://www.google.com/accounts/ClientLogin"
curl $AUTH_URI -s -d "accountType=GOOGLE" -d "Email=$ANALYTICS_EMAIL" -d "Passwd=$ANALYTICS_PASSWORD" -d "service=analytics" -d "source=inshaker" | grep ^Auth= | cut -c 6- > data/auth_token.txt
