import os

fn main() {
	mut entries := os.ls('.') or {
		panic("Couldn't list current directory.")
	}
	files := entries.filter(os.is_file(it))
	println(files)
}
