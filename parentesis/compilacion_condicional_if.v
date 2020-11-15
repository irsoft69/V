fn plataformax32x64() {
	mut x := 0
    $if x32 {
        println('system is 32 bit')
        x = 1
    }
    $if x64 {
        println('system is 64 bit')
        x = 2
    }
}

fn endian() {
	mut x := 0
    $if little_endian { //小字节序
        println('system is little endian')
        x = 1
    }
    $if big_endian { //大字节序
        println('system is big endian')
        x = 2
    }
}

fn main() {
	endian()
	plataformax32x64()
	$if debug {
    	println('from debug')
	}
	// llevado a cabo :
	//v run main.v -cg

    $if windows {
        println('windows')
        $if msvc { // 可以在windows平台中,进一步判断是msvc还是mingw
        }
        $if mingw { // 可以在windows平台中,进一步判断是msvc还是mingw
        }
    }
    $if linux {
        println('linux')
    }
    $if macos { // 或者mac
        println('mac')
    }
    $if windows {
    } $else $if macos { // else if分支
        println('macos')
    } $else $if linux { // else if分支
        println('linux')
    } $else { // else分支
        println('others')
    }
    $if !windows { // 使用非运算
    }
    $if linux || macos { // 使用或运算符
    }
    $if linux && x64 { // 使用且运算符
    }
    // 其他条件编译的选项有:
    // freebsd,openbsd,netbsd,bsd,dragonfly,android,solaris
    // js,tinyc,clang,msvc,mingw
}