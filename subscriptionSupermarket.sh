curl -v http://127.0.0.1:1026/v2/subscriptions -s -S -H 'Content-Type: application/json' -d @- <<EOF
{
  "description": "A subscription to get info about the supermarket",
  "subject": {
	"entities": [
  	{
    	"id": "ticket",
    	"type": "ticket"
  	}
	],
	"condition": {
  	"attrs": [
      "_id",
      "mall",
      "date",
      "client",
      "items"
  	]
	}
  },
  "notification": {
	"http": {
  	"url": "http://172.18.1.14:5051/v2/notify"
	},
	"attrs": [
      "_id",
      "mall",
      "date",
      "client",
      "items"
	]
  },
  "expires": "2040-01-01T14:00:00.00Z",
  "throttling": 5
}
EOF
