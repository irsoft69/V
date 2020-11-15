struct Foo { 
mut:
	x int 
}

fn main() {
	mut f := &Foo{ 10 }
	f = &Foo{ x: 20 }

	mut g := Foo { 10 }
	g = { x: 20 }

	println(f)
	println(g)
}