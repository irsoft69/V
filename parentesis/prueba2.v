import vnum.num

fn main() {
	// println(num.seq(30))
	opts := num.get_cl_default_options()

	a := num.ones([3, 3, 2]).opencl(opts)
	b := num.ones([3, 3, 2]).opencl(opts)

	add := num.cl_map2('+', opts)
	c := add.run(a, b)
	println(c.cpu())
}