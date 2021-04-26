package rulebox

default allow = false

allow {
	input.foo == "bar"
}

allow {
	input.bar == "foo"
}

allow {
    input.car == "bar"
}