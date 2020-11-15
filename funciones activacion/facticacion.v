// REDES NURONALES
// Definicion de funcion de activacion: La funcion de activacion se encarga de devolver un salida a partir de un valor de entrada,
// normalmente el conjunto de valores de salida esta en un rango determinado como (0, 1) o (-1, 1).
// Se buscan funciones que las derivadas sean simples, para minimizar con ello el coste computacional.

import math

// SIGMOIDE
// La función sigmoide transforma los valores introducidos a una escala (0,1), donde los valores altos tienen de manera asintótica a 1
// y los valores muy bajos tienden de manera asintótica a 0.
// Caracteristicas:
// - Satura y mata el gradiente
// - Lenta convergencia
// - No esta centrada en el cero
// - Esta acotada entre 0 y 1
// - Buen rendimiento en la ultima capa.
fn sigmoide(x f64) f64 {
	return 1 / (1 + math.exp(-x))
}

fn derivada_sigmoide(x f64) f64 {
	mut s := sigmoide(x)
	return s * (1 - s)
}

// TANH - TANGENTE HIPERBOLICA
// La funcion Tangente Hiperbolica transforma los valores introducidos a una escala (-1, 1), donde los valores altos tienen de manera 
// asintotica a 1 y los valores bajos tienen de manera asintotica a -1.
// Caracteristicas:
// - Muy similar a la Sigmoide
// - Satura y mata el gradiente
// - Lenta convergencia
// - Centrada en 0
// - Esta acotada entre -1 y 1
// - Se utuliza para decidir entre una opcion y la contraria
// - Buen desempeño en redes recurrentes.
fn tanh(x f64) f64 {
	return math.tanh(x)
}

// ReLU - Rectified Lineal Unit (Unidad lineal rectificada)
// La función ReLU transforma los valores introducidos anulando los valores negativos y dejando los positivos tal y como entran.
// Caracteristicas:
// - Activación Sparse – solo se activa si son positivos.
// - No está acotada.
// - Se pueden morir demasiadas neuronas.
// - Se comporta bien con imágenes.
// - Buen desempeño en redes convolucionales.
fn relu(x f64) f64 {
	return math.max(0, x)
}


fn main() {
	for i := -3.0; i<3.0; i+=0.25 {
		println('${i} \t ${sigmoide(i)} \t ${derivada_sigmoide(i)} \t ${tanh(i)} \t ${relu(i)}')
	}
}