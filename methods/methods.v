module main

// User, estructura User
struct User {
	name string
	email string
mut:
	age int
}

// can_register, metodo para conocer
// en vase a su edad si puede ser registrado
fn (u User) can_register() bool {
	return u.age > 15
}

// has_birthday, incrementa la edad
fn (u mut User) has_birthday() {
	u.age += 1
}

//main, funcion principal
fn main() {
	mut bob := User {name: 'Bob', email: 'bob@bob.com', age: 15}
	mut ali := User {name: 'Alice', email: 'alice@alice-mail.com', age: 17}

	println(bob.can_register())
	println('Bob nesecita tener 16 años para estar registrado, pero solo tiene $bob.age')
	println(ali.can_register())
	bob.has_birthday()
	println(bob.age)
}