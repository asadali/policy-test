package test

mock_input := {
	"servers": [
		{"id": "app", "protocols": ["https", "ssh"], "ports": ["p1", "p2", "p3"]},
		{"id": "db", "protocols": ["mysql"], "ports": ["p3"]},
		{"id": "cache", "protocols": ["memcache"], "ports": ["p3"]},
		{"id": "ci", "protocols": ["http"], "ports": ["p1", "p2"]}, # violation
		{"id": "busybox", "protocols": ["telnet"], "ports": ["p1"]}, # violation
	],
	"networks": [
		{"id": "net1", "public": false},
		{"id": "net2", "public": false},
		{"id": "net3", "public": true},
		{"id": "net4", "public": true},
	],
	"ports": [
		{"id": "p1", "network": "net1"},
		{"id": "p2", "network": "net3"},
		{"id": "p3", "network": "net2"},
	],
}

test_violation {
	violations := data.backup.violation with input as mock_input
	count(violations) == 2
	not data.rules.allow with input as mock_input
}
