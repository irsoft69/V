// p251020.v
fn foo() (int, int) {
	return 2, 3
}

a, b := foo()
println(a)
println(b)
c, _ := foo()
println(c)
