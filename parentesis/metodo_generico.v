struct Point {
mut:
    x f64
    y f64
}

fn (mut p Point)translate<T>(x T, y T) {
    p.x += x
    p.y += y
}

fn main() {
    mut p := Point{}
    
	p.translate(2.0, 1.0)
    
	println(p.x == 2.0 && p.y == 1.0)
}