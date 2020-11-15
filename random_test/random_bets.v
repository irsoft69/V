import rand

fn rnd_bet() []int {
	// Distintos modos de crear un array e inicializarlo
	// mut rb[0].repeat(6)
	// mut rb := [int(0),0,0,0,0,0]
	// mut rb := []int{len: 6, init: 0}
	mut rb := []int{}
	mut tmp := 0
	mut i := 0

	for i < 6 {
		tmp = rand.int_in_range(1, 50)
		if tmp in rb {
			continue
		} else {
			rb << tmp
			i++
		}
	}
	// rb.sort_with_compare(compare_i64)
	rb.sort()

	return &rb
}

fn main() {
	for b:=0; b<1000; b++ {
		println(rnd_bet())
	}
}