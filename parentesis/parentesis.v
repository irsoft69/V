// parentesis.v
fn isopen(char string) bool {
	return char in ['(', '{', '[']
}

fn char_closes(charA string, charB string) bool {
	mut pairs := map[string]string{}
	pairs = {
		'(': ')'
		'{': '}'
		'[': ']'
	}
	return pairs[charA] == charB
}

fn validate(text string) bool {
	mut stack := []string{}
	for character in text.split('') {
		if isopen(character) {
			stack << character
		} else {
			topchar := stack.pop()
			if !char_closes(topchar, character) {
				return false
			}
		}
	}
	return stack.len == 0
}

fn main() {
	test1 := '(())'
	test2 := '({()()}[()])'
	test3 := '{[}()]'
	println(validate(test1))
	println(validate(test2))
	println(validate(test3))
}
