
// Funciones puras por defecto:

// Las funciones V son puras por defecto, lo que significa que sus valores de retorno solo están determinados por sus argumentos, 
// y su evaluación no tiene efectos secundarios.

// Esto se logra por la falta de variables globales y todos los argumentos de la función son inmutables de forma predeterminada, 
// incluso cuando se pasan las referencias.

// Sin embargo, V no es un lenguaje funcional puro. Es posible modificar los argumentos de la función usando la misma palabra clave mut: 


struct User {
    mut:
    is_registered bool
}

fn (u mut User) register() {
    u.is_registered = true
}


fn main() {
    mut user := User{}
    println(user.is_registered)     // ==> false

    user.register()
    println(user.is_registered)     // ==> true
}
