
import rand
import strconv.ftoa
// import strconv.utilities

fn my_format(f f64) f64 {
	// mut ft := f.strlong() 
	mut ft := ftoa.f64_to_str_l(f)
	i := ft.index_old('.')
	if ft.len < 5 {
		return f
	}
	return (ft.substr(0, i + 3)).f64()
}

fn genera_altura(n int) []f64 {
	mut d := []f64 {}
	for i:=0; i<n; i++ {
		r := rand.f32_in_range(1.0, 2.0)
		d << my_format(r)
		// println(my_format(r))
	}
	return d
}

fn main() {
	// println(rand.u32n(50)+1)
	// println(rand.u32_in_range(1, 50))

	println(genera_altura(50))
}