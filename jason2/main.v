module main

import x.json2

struct Test {
	name string
}

fn (t Test) to_json() string {
	return 'test'
}

fn main() {
	t := Test{}
	json2.encode(t)
}