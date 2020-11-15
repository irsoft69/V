module main

fn exec(stmt string) ? {
    if stmt == '' {
        return error_with_code('stmt is null', 123) //需要带错误码
    }
    println(stmt)
}

fn main() {
    exec('') or {
    //约定的变量名err和errcode
        panic('error text is :$err;error code is $errcode') 
    }
}
