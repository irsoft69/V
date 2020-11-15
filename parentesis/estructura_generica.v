struct DB {
    driver string
}

struct User {
    db DB
mut:
    name string
}

struct Repo<T> {
    db DB
mut:
    model  T
}

fn new_repo<U>(db DB) Repo<U> {
    return Repo<U>{db: db}
}

fn main() {
    mut a :=  new_repo<User>(DB{})
    a.model.name = 'joe'
    mut b := Repo<User>{db: DB{}}
    b.model.name = 'joe'
	assert a.model.name == 'joe'
    assert b.model.name == 'joe'
    // println(a.model.name)
    // println(b.model.name)
}