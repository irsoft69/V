// funciones
import os

fn add(x int, y int) int {
	return x + y
}

fn sub(x, y int) int {
	return x -y
}

fn main() {
	println("Hola Mundo")

	println(add(77, 33))
	println(sub(100,50))
	println('')

	/*
		Las variables se declaran e inicializan con :=. Esta es la única forma de declarar variables en V. 
		Esto significa que las variables siempre tienen un valor inicial.
		
		El tipo de la variable se infiere del valor en el lado derecho. Para forzar un tipo diferente, 
		use la conversión de tipo: la expresión T(v) convierte el valor v al tipo T.

		A diferencia de la mayoría de los otros lenguajes, V solo permite definir variables en las funciones. 
		No se permiten variables globales (nivel de módulo). No hay estado global en V.
	*/

	name := 'Bob'
	age := 20
	large_number := i64(9999999999)
	println(name)
	println(age)
	println(large_number)
	println('')

	/*
		Para cambiar el valor de la variable use =. En V, las variables son inmutables por defecto. 
		Para poder cambiar el valor de la variable, debe declararla con mut.

		Intente compilar el programa anterior después de eliminar mut de la primera línea.

T		enga en cuenta que la diferencia entre := y =, := se usa para declarar e inicializar, = se usa para asignar.
	*/

	mut edad := 20
	println(edad)
	edad = 21
	println(edad)
	println('')

	/*
	a := 10
	if true {
		a := 20
	}

		En el modo de desarrollo, este código dará como resultado una advertencia de "variable no utilizada". 
		En el modo de producción (v -prod foo.v) no se compilará en absoluto, como en Go.
	*/

	/*
		Tipos Basicos:

		bool
		string

		i8, i16, int, i64, i128(pronto)
		byte, u16, u32, u64, u128(pronto)

		rune

		f32, f64

		byteptr
		voidptr

		Tenga en cuenta que, a diferencia de C y Go, int siempre es un entero de 32 bits.
	*/

	// Strings

	nombre := 'Bob'
	println('Helo, $nombre!')	// $ es usado para interpolar strings
	println('$nombre tiene $nombre.len caracteres')

	bobby := nombre + 'by'		// + es usado para concatenar strings
	println(bobby)
	println(bobby[1..3])		// 'ob'
	println('')

	mut s := 'hello '
	s += 'world'				// += se usa para agregar a una cadena
	println(s)

	/*
		En V, una cadena es una matriz de bytes de solo lectura. Los datos de cadena se codifican con UTF-8.

		Las cadenas son inmutables.

		Las comillas simples y dobles se pueden usar para denotar cadenas. Por coherencia, vfmt convierte las 
		comillas dobles en comillas simples a menos que la cadena contenga un carácter de comilla simple.

		La sintaxis de interpolación es bastante simple. También funciona con campos: 'age = $user.age'. 
		Si necesita expresiones más complejas, use ${}: 'puede registrarse = $ {user.age> 13}'.

		Todos los operadores en V deben tener valores del mismo tipo en ambos lados. 
		Este código no se compilará si age es un int:	println('age = ' + age)
	*/

	println('age = ' + age.str())	// Tenemos que convertir la edad en una cadena:
	println('age = $age')			// o usar interpolacion de cadena (preferiblemente)
	println('')

	a := `a`
	k := 'aloha!'
	jsfgaassert k[0] == a

	/*
		Para cadenas sin procesar, anteponer r. Las cadenas sin procesar no se escapan:
	*/

	sa := r'hello\nworld'
	println(sa)
	println('')

	/*
		Import

		Los módulos se pueden importar utilizando la importación de palabras clave. 
		Cuando se utilizan tipos, funciones y constantes de otros módulos, se debe especificar la ruta completa. 
		En el ejemplo anterior, nombre := get_line() no funcionaría. 
		Eso significa que siempre está claro desde qué módulo se llama una función
	*/

	print('Escriba su nombre: ')
	nom := os.get_line()
	println('Hola $nom')
}