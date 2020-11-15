// prefijo.v
/*
n := [1,2,3,4,5]
println(n)
println(n[..2])  // [1, 2]
println(n[2..])  // [3, 4, 5]
println(n[2..4]) // [3, 4]
*/

import os

fn find_prefix_in_word(texto []string, prefijo string) []string {
	mut palabras := []string{}
	mut con_prefijo := []string{}
	for content in texto {
		palabras << content.split(' ').map(it.to_lower())
	}
	for palabra in palabras {
		if palabra.starts_with(prefijo) {
			if palabra !in con_prefijo{
				con_prefijo << palabra
			}
		}
	}
	return con_prefijo
}

fn main() {
	f := 'texto.txt'
	texto := os.read_lines(f) or {
		panic('Error: Abriendo archivo $f')
	}
	p := find_prefix_in_word(texto, 'ac')
	println(p)
}
