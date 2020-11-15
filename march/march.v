const (
	c_w = 25
	c_h = 11
	c_e = 0.001
	c_f = 100.0
	c_c = ['-', '.', ' ']
)

fn q(n f64) f64 {
	mut x := n
	mut y := 1.0
	for x - y > c_e {
		x = (x + y) / 2
		y = n / x
	}
	return x
}

struct Record {
mut:
	x f64
	y f64
	z f64
}

fn (v Record) a(o Record) Record {
	return Record{
		x: v.x + o.x
		y: v.y + o.y
		z: v.z + o.z
	}
}

fn (v Record) m(s f64) Record {
	return Record{
		x: v.x * s
		y: v.y * s
		z: v.z * s
	}
}

fn (v Record) g() f64 {
	return q(v.x * v.x + v.y * v.y +
		v.z * v.z)
}

fn (v Record) n() Record {
	m := v.g()
	if m < c_e {
		return v
	}
	return Record{
		x: v.x / m
		y: v.y / m
		z: v.z / m
	}
}

fn s(p Record) f64 {
	d := p.g() - 0.1
	if d < -p.y + 0.2 {
		return d
	}
	return -p.y + 0.2
}

fn h(e, r Record) f64 {
	mut t := 0.0
	for i := 0; i < 99; i++
	 {
		d := s(e.a(r.m(t)))
		if d < c_e {
			return t
		}
		t += d
		if t >= c_f {
			break
		}
	}
	return -1
}

fn f(u, v f64) string {
	e := Record{
		x: 0
		y: 0
		z: -1
	}
	r := Record{
		x: u
		y: v
		z: 1
	}
	d := h(e, r.n())
	if d < 0 {
		return '\x23'
	}
	p := e.a(r.n().m(d))
	mut a := p
	a.x += c_e
	mut b := p
	b.y += c_e
	mut c := p
	c.z += c_e
	j := s(p)
	k := Record{
		x: s(a) - j
		y: s(b) - j
		z: s(c) - j
	}
	l := k.n()
	mut y := Record{
		x: 3
		y: -7
		z: -3
	}
	y = y.n()
	t := (l.x * y.x + l.y * y.y +
		l.z * y.z) * 6000
	if t > 2 {
		return ' '
	}
	if t < 0 {
		return '-'
	}
	return c_c[int(t)]
}

fn main() {
	for v := 0; v < c_h; v++
	 {
		for u := 0; u < c_w; u++
		 {
			p := f(f64(u) / c_w - 0.5, f64(v) / c_h - 0.5)
			print('$p')
		}
		println('')
	}
}
