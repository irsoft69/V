module main

struct User {
    name string
    age  int
}

fn (m &User) str() string {
    return 'name:$m.name,age:$m.age'
}

// Declaración de tipo conjunto
type MySum = User | int | string

fn (ms MySum) str() string {
    if ms is int { // Utilice la palabra clave is para determinar qué tipo de unión es específico
        println('ms type is int')
    }
    match ms { 
		// Para el tipo de unión recibido, use la declaración de coincidencia para juzgar el tipo, 
		// y la variable ms de cada rama de coincidencia se configurará automáticamente en el tipo 
		// correspondiente en la rama
        int { return (*ms).str() }
        string { return *ms }
        User { return ms.str() }
    }
}

fn add(ms MySum) { // Tipo de unión como parámetro
    match ms { 
		// Puede usar la declaración de coincidencia para juzgar el tipo de unión recibida, y la 
		// variable ms de cada rama de coincidencia se configurará automáticamente en el tipo 
		// correspondiente en la rama
        int { println('ms is int,value is ${*ms}') }
        string { println('ms is string,value is $ms') }
        User { println('ms is User,value is $ms.str()') }
    }
}

fn add2(ms MySum) { // Tipo de unión como parámetro
    match ms as m { 
		// Puede usar la declaración de coincidencia para determinar el tipo de unión recibida.
		// Después de agregar como m, puede usar el nombre de la variable personalizada m como 
		// la variable modelada en la rama de coincidencia
        int { println('ms is int,value is ${*m}') }
        string { println('ms is string,value is $m') }
        User { println('ms is User,value is $m.str()') }
    }
}

fn sub(i int, s string, u User) MySum { // Tipo de unión como valor de retorno
    return i
    // return s // Esto también está bien
    // return User{name:'tom',age:3} // Esto también está bien
}

fn main() {
    i := 123
    s := 'abc'
    u := User{
        name: 'tom'
        age: 33
    }
    mut res := MySum{} // Declarar una variable de tipo de unión
    res = i
    println(res) // salida 123
    res = s
    println(res) // salida abc
    res = u
    println(res) // name:tom,age:33
    match res { // Determine el tipo específico
        int { println('res is:$res.str()') }
        string { println('res is:$res') }
        User { println('res is:$res.str()') }
    }
    user := res as User // También puede realizar el modelado de visualización a través de:
    println(user.name)
    add(i)
    add(s)
    add2(i)
    add2(s)
}