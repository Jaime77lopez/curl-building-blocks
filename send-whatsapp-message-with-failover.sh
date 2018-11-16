#!/usr/bin/env bash

source "../config.sh"
source "../jwt.sh"

curl -X POST https://api.nexmo.com/v0.1/dispatch \
  -H 'Authorization: Bearer '$JWT\
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -d $'{
    "template":"failover",
    "workflow": [
      {
        "from": { "type": "whatsapp", "number": '$525552881220' },
        "to": { "type": "whatsapp", "number": '$525555036526' },
        "message": {
          "content": {
            "type": "text",
            "text": "This is a WhatsApp Message sent via the Dispatch API"
          }
        },
        "failover":{
          "expiry_time": 600,
          "condition_status": "read"
        }
      },
      {
        "from": {"type": "sms", "number": '$525552881220'},
        "to": { "type": "sms", "number": '$525555036526'},
        "message": {
          "content": {
            "type": "text",
            "text": "This is an SMS sent via the Dispatch API"
          }
        }
      }
    ]send-whatsapp-message-with-failover.sh
  }'
