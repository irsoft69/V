fn main() {
	// diccionario o map
	// mut m := map[string]int
	// m['uno'] = 1
	// m['dos'] = 2
	// println(m.str())

	nbr_doors := 100

	// declara e inicializa un array 100 elementos a true
	mut closed_doors := [true].repeat(nbr_doors)
	// println(closed_doors)

	// declara e inicializa un array 100 elementos a 0
	// mut is_open := []int{len: nbr, default: 0}

	for pass:=0; pass < nbr_doors; pass++ {
		for door := 0; door < nbr_doors; door += pass + 1 {
			// is_open[door] << (is_open[door] + 1) % 2
			closed_doors[door] = !closed_doors[door]
		}
	}

	// for door := 0; door < nr; door++ {
	// 	C.printf('door #%i is %s.\n', door+1, if is_open[door] == 1 {'Open'} else {'Close'})
	// }

	for door := 0; door < nbr_doors; door++ {
		println('Door #$door: ' + if closed_doors[door] {'Closed'} else {'Open'})
	}

	////////////////////////////////////////////////////////////////////////////////////////

	mut arr := [1,2,3,4]

	println(arr)
	arr << arr
	println(arr)
}