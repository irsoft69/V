struct Color {
	r int
	g int
	b int
}

fn (c Color) str() string { return '{$c.r, $c.g, $c.b}'}

fn rgb(r, g, b int) Color { return Color{r: r, g: g, b: b}}

const (
	numbers = [1, 2, 3]

	red = Color{r: 255, g:0, b:0}
	blue = rgb(0, 0, 255)
)

println(numbers)
println(red)
println(blue)

// v -o file.c file.v
