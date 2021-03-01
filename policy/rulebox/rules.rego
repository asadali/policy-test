package rulebox

foo := "bar"

default allow = false

allow {
	input.foo == "bar"
}

allow {
	input.bar == "foo"
}

allow {
	input.foo == "baz"
}
