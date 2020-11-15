
fn func<T>(n int) {
	if n == 0 { return }
	println('Called ${n}')
	func<T>(n - 1)
}

fn main() {
	func<int>(5)

	mut a := 10
	b := (a++)

	println('$a - $b')
}