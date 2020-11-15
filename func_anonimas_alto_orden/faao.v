// Funciones Anonimas de Alto Orden
fn sqr(n int) int {
	return n * n
}

fn run(value int, op fn(int) int) int {
	return op(value)
}

fn main() {
	println(run(5, sqr)) // 25
	// Las funciones anónimas se pueden declarar dentro de otras funciones:
	double_fn := fn (n int) int {
		return n + n
	}
	println(run(5, double_fn)) // 10
	// Las funciones se pueden pasar sin asignarlas a las variables:
	res := run(5, fn (n int) int { // 10
		return n + n
	})
	println(res)
}
