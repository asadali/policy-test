package rulebox

foo := "bar"

default allow = false

allow {
	input.foo == "bar"
}
