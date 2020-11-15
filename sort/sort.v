// Fuente: https://forum.nim-lang.org/t/6518

import rand
import time

struct Data {
mut:
	r int
	i int
}

const (
	maxlen = 10000000
	maxran = 1000000
)

fn main() {
	println("generando...")
	mut t := time.new_stopwatch({})
	mut t3 := time.new_stopwatch({})
	mut a := []Data{ len: maxlen }
	for x in 0..maxlen {
		a[x].r = int(rand.int_in_range(0, maxran))
		a[x].i = int(x)
	}
	println("Ok ${t.elapsed().milliseconds()}ms")

	println("ordenando...")
	mut t2 := time.new_stopwatch({})
	a.sort_with_compare(fn (x, y &Data) int {
		// if x.r < y.r {
		// 	return -1
		// }
		// if x.r > y.r {
		// 	return 1
		// }
		// return 0
		return x.r - y.r
	})
	println("Ok ${t2.elapsed().milliseconds()}ms")
	println("Total ${t3.elapsed().seconds()}sec.")
	
	for i in 0..5 {
		println(a[i])
	}
}