// Sudoku.v
import time

struct Loc {
mut:
	x int
	y int
}

fn valid(bo [][]int, num, r, c int) bool {
	// check row
	for i in 0 .. bo[0].len {
		if bo[r][i] == num && c != i {
			return false
		}
	}
	// check col
	for i in 0 .. bo[0].len {
		if bo[i][c] == num && r != i {
			return false
		}
	}
	// check box
	box_x := c / 3
	box_y := r / 3
	for i in box_y * 3 .. box_y * 3 + 3 {
		for j in box_x * 3 .. box_x * 3 + 3 {
			if bo[i][j] == num && r != i && c != j {
				return false
			}
		}
	}
	return true
}

fn solve(mut bo [][]int) bool {
	find := find_empty(bo) or {
		return true
	}
	row := find.x
	col := find.y
	for i in 1 .. 10 {
		if valid(bo, i, row, col) {
			bo[row][col] = i
			if solve(mut bo) {
				return true
			}
			bo[row][col] = 0
		}
	}
	return false
}

fn find_empty(bo [][]int) ?Loc {
	for i in 0 .. bo.len {
		for j in 0 .. bo[0].len {
			if bo[i][j] == 0 {
				return Loc{
					x: i
					y: j
				}
			}
		}
	}
	return none
}

fn print_board(bo [][]int) {
	println('')
	for i in 0 .. bo.len {
		// 3 y 6
		if i != 0 && i % 3 == 0 {
			println('- - - - - - - - - - -')
		}
		for j in 0 .. bo[i].len {
			if j % 3 == 0 && j != 0 {
				print('| ')
			}
			if j == 8 {
				println(bo[i][j])
			} else {
				print(bo[i][j].str() + ' ')
			}
		}
	}
	println('')
}

fn main() {
	mut bo := [
		// [0, 0, 0, 0, 0, 1, 2, 0, 0],
		// [0, 0, 0, 0, 0, 0, 3, 4, 0],
		// [0, 0, 0, 0, 0, 0, 0, 5, 6],
		// [0, 0, 0, 0, 0, 0, 0, 0, 7],
		// [0, 0, 0, 0, 0, 0, 0, 0, 0],
		// [1, 0, 0, 0, 0, 0, 0, 0, 0],
		// [7, 2, 0, 0, 0, 0, 0, 0, 0],
		// [0, 4, 8, 0, 0, 0, 0, 0, 0],
		// [0, 0, 6, 3, 0, 0, 0, 0, 0],
		[1, 0, 0, 0, 0, 0, 0, 0, 0],
		[0, 0, 0, 6, 0, 0, 0, 0, 0],
		[0, 6, 0, 9, 3, 5, 0, 0, 0],
		[0, 0, 2, 3, 4, 0, 0, 6, 0],
		[3, 0, 0, 0, 0, 1, 0, 0, 2],
		[0, 0, 0, 0, 0, 0, 0, 8, 4],
		[0, 5, 0, 0, 6, 0, 0, 0, 0],
		[0, 0, 1, 0, 0, 2, 0, 9, 0],
		[8, 0, 0, 0, 0, 0, 0, 7, 1],
	]
	print_board(bo)
	println('---------------------')
	if solve(mut bo) {
		mut t := time.new_stopwatch({})
		print_board(bo)
		println('Sudoku resuelto en: ${t.elapsed().microseconds()} micro seg.')
	}
}
