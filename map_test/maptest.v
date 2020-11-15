struct Anio {
	mes map[string]Mes
}

struct Mes {
	n1 int
	n2 int
	n3 int
	n4 int
	n5 int
	n6 int
}

fn main() {
	mut fanio := map[string]Anio
	mut fmes := map[string]Mes

	fmes['8'] = Mes {n1: 1, n2: 2, n3: 3, n4: 4, n5: 5, n6: 6}
	fanio['2019'] = Anio {mes: fmes}

	anio := if '2019' in fanio.keys() {
		fanio.key()
	}

	println(anio)
	// println(fanio.keys())
}