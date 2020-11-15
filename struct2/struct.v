struct User {
    id      int
    name    string
}

struct Repo {
    users   []User
}

fn new_repo() Repo {
    return Repo {
        users: [User{1, 'Andrew'}, User{2, 'Bob'}, User{10, 'Charles'}]
    }
}

fn (r Repo) find_user_by_id(id int) ?User {
    for user in r.users {
        if user.id == id {
            // V automáticamente envuelve esto en un tipo de opción
            return user
        }
    }
    return error('User $id no encontrado...')
}

fn main() {
    repo := new_repo()
    user := repo.find_user_by_id(3) or { // Los tipos de opciones deben ser manejados por bloques `or`
        println(err)
        return  // el bloque `or` puede terminar con return, break o continue
    }

    println(user.id)    // 10
    println(user.name)  // Charles
}