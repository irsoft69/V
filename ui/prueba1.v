import ui

const (
	win_width  = 700
	win_height = 385
)

struct App {
mut:
	cur_window  &ui.window
	code_area   &ui.window
	sprite_area &ui.window
	map_area    &ui.window
	music_area  &ui.window
	terminal    &ui.window
}

fn init_engine() {
	mut app := &App{}
	mut window := ui.window({
		width: win_width
		height: win_height
		state: app
		title: 'RetroV'
	}, [])
	app.cur_window = window
	ui.run(app.cur_window)
	println('Engine Started')
}
