struct MyConf {
	z int
}

fn my_func(x, y int, c MyConf) {
	println('$x $y $c.z')
}

fn main() {
	my_func(2, 3, z: 4)
}