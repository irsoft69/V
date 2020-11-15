//module main.v
module main

import time
import mymodule

fn main() {
	sw := time.new_stopwatch()
	mymodule.say_hi()
	println('Ejecutar esto tomo: ${sw.elapsed().nanoseconds()}ns')
}