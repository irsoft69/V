module mainv

struct Test {
	pub mut:
		size int
}

pub fn new() Test {
	return Test{ size: 1 }
}