#!/usr/bin/env bash

source "../config.sh"

curl -X "POST" "https://api.nexmo.com/ni/basic/json" \
     -d "api_key=$NEXMO_API_KEY" \
     -d "api_secret=$NEXMO_API_SECRET" \
     -d "number=$INSIGHT_NUMBER"
