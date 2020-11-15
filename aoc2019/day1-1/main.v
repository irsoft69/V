/*
Fuel required to launch a given module is based on its mass. Specifically, to find the fuel required for a module, 
take its mass, divide by three, round down, and subtract 2

For example:

For a mass of 12, divide by 3 and round down to get 4, then subtract 2 to get 2. 					( 12 / 3 = 4 y 4 - 2 = 2 )
For a mass of 14, dividing by 3 and rounding down still yields 4, so the fuel required is also 2.	( 14 / 3 = 4.666666 y 4 - 2 = 2 )
For a mass of 1969, the fuel required is 654.		( 1969 / 3 = 656.333333 y 656 - 2 = 654 )
For a mass of 100756, the fuel required is 33583.	( 100756 / 3 = 33585 y 33585 - 2 = 33583 )
*/
import os

const (
	input_file = './input.txt'
)

fn sum(prev, curr int) int {
	return prev + curr
}

fn read_file(file_path string) []string {
	lines := os.read_lines(file_path) or {
		panic('$file_path file not found')
	}
	return lines
}

fn main() {
	masses := read_file(input_file)
	fuel := masses.map((it.int() / 3) - 2)
	total_fuel := fuel.reduce(sum, 0)
	println(total_fuel)
}
