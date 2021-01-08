#!/bin/bash
TENANT=$(jq -r .tenant config.json)
CLID=$(jq -r .clientID config.json)
KEY=$(jq -r .clientSecret config.json)
SCOPE=$(jq -r .scope config.json)

OAUTH_URL_Notcomplete=$(jq -r .endpoints.oauth config.json)
GRAPH_URL=$(jq -r .endpoints.graph config.json)
OAUTH_URL=$OAUTH_URL_Notcomplete"/"$TENANT"/oauth2/v2.0/token"

 ## authenticate and get bearer token
 echo Getting Token
 #TOKEN=$(curl -s $OAUTH_URL -X POST -H "Content-Type: application/x-www-form-urlencoded" --data-urlencode "client_id=$CLID" --data-urlencode "scope=$SCOPE" --data-urlencode "client_secret=$KEY"  --data-urlencode "grant_type=client_credentials" | jq -r .access_token)
 TOKEN=$(curl -s $OAUTH_URL -X POST -H "Content-Type: application/x-www-form-urlencoded" --data-urlencode "client_id=$CLID" --data-urlencode "scope=$SCOPE" --data-urlencode "client_secret=$KEY"  --data-urlencode "grant_type=client_credentials" | jq -r .access_token)

##write token to file
echo write token to file
echo $TOKEN > authtoken

##display JSON content in token
echo display JSON content in token
# PAYLOAD=$(echo $TOKEN | awk -F'.' '{print $2}' | base64 -d 2>/dev/null) # extract payload and base64 decode
# echo $PAYLOAD | jq .
