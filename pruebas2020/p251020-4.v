// p251020-4.v

fn average(numbers []f64) f64 {
	mut sum := 0.0
	for n in numbers {
		sum += n
	}
	return sum / numbers.len
}

fn main() {
	ave1 := average([1.0,2.0,3.0,4.0])
	println('ave1 = $ave1')

	ave2 := average([7.0,9.0,6.0,-37.0])
	println('ave2 = $ave2')
}