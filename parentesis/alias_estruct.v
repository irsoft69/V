module main

struct Human {
    name string
}

pub fn (h Human) str() string {
    return 'Human: $h.name'
}

type Person = Human

pub fn (h Person) str() string {
    return 'Person: $h.name'
}

fn main() {
    p := Person{'Bilbo'}
    p2 := Human{'jack'}
    println(p)
    println(p2)
}