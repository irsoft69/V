module main

fn main() {
	eprintln( 'file: ' + @FILE + ' | line: ' + @LINE + ' | fn: ' + @MOD + '.' + @FN)
	eprintln('struct: ' + @STRUCT)
}