// module option_result.v
module main

// struct User
struct User {
    id int
    name string
}

// struct Repo
struct Repo {
    users []User
}

// function new_repo()
fn new_repo() Repo {
    return Repo {
        users: [User{1, 'Andrew'}, User {2, 'Bob'}, User {10, 'Charles'}]
    }
}

// function find_user_by_id(id int) ?User
fn (r Repo) find_user_by_id(id int) ?User {
    for user in r.users {
        if user.id == id {
            // V automatically wraps this into an option type
            return user
        }
    }
    return error('User $id not found')
}

// function main()
fn main() {
    repo := new_repo()
    // Option types must be handled by `or` blocks
    // `or` block must end with `return`, `break`, or `continue`
    user := repo.find_user_by_id(10) or { 
        return
    }
    println(user.id) // "10"
    println(user.name) // "Charles"
}
