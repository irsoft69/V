module main

import x.json2

struct Zest {
	name string
	b    int
}

pub fn (t Zest) to_json() string {
	return 'test'
}

fn main() {
	t := Zest{'abc', 123}
	println(json2.encode<Zest>(t))
}
