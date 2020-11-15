struct App {
    a string
    b string
mut:
    c int
    d f32
pub:
    e f32
    f u64
pub mut:
    g string
    h byte
}

['foo/bar/three']
fn (mut app App) run() {
}

['attr2']
fn (mut app App) method2() {
}

fn (mut app App) int_method1() int {
    return 0
}

fn (mut app App) int_method2() int {
    return 1
}

fn (mut app App) string_arg(x string) {
}

fn no_lines(s string) string { return s.replace('\n', ' ') }

fn f1() {
    println(@FN)
    methods := ['run', 'method2', 'int_method1', 'int_method2', 'string_arg']
    $for method in App.methods { //Atraviesa todos los métodos de la estructura.
        println('  method: $method.name \t| ' + no_lines('$method'))
        assert method.name in methods
    }
}

fn f2() {
    println(@FN)
    $for method in App.methods { //Atraviesa todos los métodos de la estructura.
        println('  method: ' + no_lines('$method'))
        $if method.Type is fn() {
            assert method.name in ['run', 'method2']
        }
        $if method.ReturnType is int {
            assert method.name in ['int_method1', 'int_method2']
        }
        $if method.args[0].Type is string {
            assert method.name == 'string_arg'
        }
    }
}

fn main() {
    println(@FN)
    $for field in App.fields { //Atraviesa todos los campos de la estructura
        println('  field: $field.name | ' + no_lines('$field'))
        $if field.Type is string {
            assert field.name in ['a', 'b', 'g']
        }
        $if field.Type is f32 {
            assert field.name in ['d', 'e']
        }
        if field.is_mut {
            assert field.name in ['c', 'd', 'g', 'h']
        }
        if field.is_pub {
            assert field.name in ['e', 'f', 'g', 'h']
        }
        if field.is_pub && field.is_mut {
            assert field.name in ['g', 'h']
        }
    }
    f1()
    f2()
}