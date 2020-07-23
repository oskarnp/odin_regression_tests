package p1

Params :: struct {
	cb: proc(),
}

run :: proc(x: Params) {
	x.cb();
}
