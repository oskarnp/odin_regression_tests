package p2

import "../p1"

my_cb :: proc() {
}

main :: proc() {
	p1.run({
		cb = my_cb
	});
}
