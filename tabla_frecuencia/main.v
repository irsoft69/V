// Tabla de Frecuencias
// module main


import math

// Limites Estructura para los Limites de Clases
struct Limites {
pub mut:
	i f64 = 0.0
	f f64 = 0.0
}

// Tabla Estructura para la Tabla de Frecuencias
struct Tabla {
pub mut:
	max                f64 = 0.0
	min                f64 = 0.0
	amplitud_variacion f64 = 0.0
	numero_clases      int = 0
	tamanio_clases     f64 = 0.0
	limites_clases     []Limites
	frecuencia_abs     []int
	total_frec_abs     int
	frecuencia_rel     []f64
	frec_abs_acumu     []int
	frec_rel_acumu     []f64
}

const (
	// data = [1.75, 1.50, 1.68, 1.70, 1.61, 1.65, 1.69, 1.79, 1.78, 1.45,
	// 	1.41, 1.43, 1.55, 1.63, 1.60, 1.66, 1.52, 1.66, 1.57, 1.50,
	// 	1.56, 1.76, 1.56, 1.58, 1.68, 1.40, 1.56, 1.69, 1.52, 1.63,
	// 	1.46, 1.65, 1.48, 1.67, 1.67, 1.78, 1.77, 1.68, 1.74, 1.45,
	// 	1.47, 1.57, 1.58, 1.54, 1.76, 1.44, 1.52, 1.61, 1.56, 1.56]
	data = [1.03, 1.41, 1.49, 1.19, 1.43, 1.1, 1.78, 1.81, 1.16, 1.48, 
	1.07, 1.87, 1.2, 1.74, 1, 1.17, 1.84, 1.68, 1.3, 1.1, 
	1.35, 1.67, 1.06, 1.27, 1.68, 1.98, 1.53, 1.29, 1.05, 
	1.63, 1.29, 1.13, 1.25, 1.01, 1.38, 1.63, 1.33, 1.36, 
	1.3, 1.05, 1.04, 1.72, 1.05, 1.93, 1.15, 1.32, 1.03, 1.27, 1.33, 1.12]
)

// myFormat Formatea 
fn my_format(f f64) f64 {
	mut ft := f.strlong()
	i := ft.index_old('.')
	if ft.len < 5 {
		return f
	}
	return (ft.substr(0, i + 3)).f64()
}

// minimo_valor Contiene el minimo valor de la data
fn (mut t Tabla) minimo_valor() &Tabla {
	t.min = data[0]
	for i in data {
		if i < t.min {
			t.min = i
		}
	}
	return t
}

// maximo_valor Contiene el maximo valor de la data
fn (mut t Tabla) maximo_valor() &Tabla {
	mut m := data[0]
	for i in data {
		if i > m {
			m = i
		}
	}
	t.max = m
	return t
}

// amplitud_de_variacion Calcula la Amplitud de Variacion
fn (mut t Tabla) amplitud_de_variacion() &Tabla {
	t.amplitud_variacion = my_format(t.max - t.min)
	return t
}

// numero_de_clases Calcula el Numero de Clases
fn (mut t Tabla) numero_de_clases() &Tabla {
	t.numero_clases = int(math.sqrt(data.len))
	return t
}

// tamanio_de_clases Calcula el Tamaño de la Clase
fn (mut t Tabla) tamanio_de_clases() &Tabla {
	t.tamanio_clases = my_format(t.amplitud_variacion / t.numero_clases)
	return t
}

// limite_de_clases Calcula el Limite de cada Clase
fn (mut t Tabla) limite_de_clases() &Tabla {
	mut v := 0
	mut limite := Limites{}
	for {
		if limite.f > t.max {
			break
		}
		if v == 0 {
			limite.i = t.min
			limite.f = my_format(t.min + t.tamanio_clases)
			t.limites_clases << limite
		} else {
			limite.i = limite.f
			limite.f = my_format(limite.i + t.tamanio_clases)
			t.limites_clases << limite
		}
		v++
	}
	return t
}

// frecuencia_absoluta Calcula la Frecuencia Absoluta para cada Clase
fn (mut t Tabla) frecuencia_absoluta() &Tabla {
	mut c := 0
	for lim in t.limites_clases {
		c = 0
		for m in data {
			if m >= lim.i && m < lim.f {
				c++
			}
		}
		t.frecuencia_abs << c
		t.total_frec_abs += c
	}
	return t
}

// frecuencia_relativa Calcula la Frecuencia Relativa para cada Clase
fn (mut t Tabla) frecuencia_relativa() &Tabla {
	mut vt := 0.0
	for f in t.frecuencia_abs {
		vt = f64(f) / f64(t.total_frec_abs)
		t.frecuencia_rel << vt
	}
	return t
}

// frecuencia_abs_acumulada Calcula la Frecuencia Absoluta Acumulada
fn (mut t Tabla) frecuencia_abs_acumulada() &Tabla {
	for i := 0; i < t.frecuencia_abs.len; i++ {
		if i == 0 {
			t.frec_abs_acumu << t.frecuencia_abs[i]
		} else {
			t.frec_abs_acumu << (t.frec_abs_acumu[i - 1] + t.frecuencia_abs[i])
		}
	}
	return t
}

// frecuencia_rel_acumulada Calcula la Frecuencia Relativa Acumulada
fn (mut t Tabla) frecuencia_rel_acumulada() &Tabla {
	for i := 0; i < t.frecuencia_rel.len; i++ {
		if i == 0 {
			t.frec_rel_acumu << t.frecuencia_rel[i]
		} else {
			t.frec_rel_acumu << (t.frec_rel_acumu[i - 1] + t.frecuencia_rel[i])
		}
	}
	return t
}

// new Inicializa la Tabla
fn new() &Tabla {
	return &Tabla{}
}

// str(): Tabla
// fn (t Tabla) str() string {
// return 'Tabla[max: ${t.max:2.2f}, min: ${t.max:2.2f}, amplitud_variacion: ${t.amplitud_variacion:2.2f}, numero_clases: ${t.numero_clases}, tamanio_clases: ${t.tamanio_clases:2.2f}, limites_clases: ${t.limites_clases}, frecuencia_abs: ${t.frecuencia_abs}, total_frec_abs: ${t.total_frec_abs}, frecuencia_rel: ${t.frecuencia_rel}, frec_abs_acumu: ${t.frec_abs_acumu}, frec_rel_acumu: ${t.frec_rel_acumu}]'
// }
// str(): Limites
// fn (l Limites) str() string {
// return 'Limites[i: ${l.i:2.2f}, f: ${l.f:2.2f}]'
// }

// print_data Imprime los datos de la Tabla
fn print_data() {
	println('Data:')
	print('-----')
	for i:=0; i< 50; i++ {
		if i % 10 == 0 {
			println('')
		}
		print('${data[i]:2.2f}, ')
	}
	println('')
}

// print_all Imprime la Tabla con encabezado
fn (t Tabla) print_all() {
	println('')
	println('Clases			F.Abs	F.Rel	F.Abs.Acu     F.Rel.Acu')
	println('---------------------------------------------------------------')
	for i := 0; i < t.limites_clases.len; i++ {
		println('${t.limites_clases[i].i:2.2f} - ${t.limites_clases[i].f:2.2f}		${t.frecuencia_abs[i]:2}	${t.frecuencia_rel[i]:2.2f}	   ${t.frec_abs_acumu[i]:2} 	  	${t.frec_rel_acumu[i]:2.2f}')
	}
	println('')
}

// main Funcion Principal
fn main() {
	mut tf := new()
	tf.minimo_valor()
	tf.maximo_valor()
	tf.amplitud_de_variacion()
	tf.numero_de_clases()
	tf.tamanio_de_clases()
	tf.limite_de_clases()
	tf.frecuencia_absoluta()
	tf.frecuencia_relativa()
	tf.frecuencia_abs_acumulada()
	tf.frecuencia_rel_acumulada()
	print_data()
	tf.print_all()
	
	println(typeof(tf))
}
