fn binary_search_recursive(arr []int, left int, right int, obj int) int {

	if right >= left {
		mid := left + (right-left) / 2

		if arr[mid] == obj {
			return mid
		}

		if arr[mid] > obj {
			return binary_search_recursive(arr, left, mid-1, obj)
		}

		return binary_search_recursive(arr, mid+1, right, obj)
	}

	return -1
}

fn binary_search_iterative(arr []int, left int, right int, obj int) int {
	mut le := left
	mut ri := right

	for le <= ri {
		mid := le + (ri-le) / 2

		if arr[mid] == obj {
			return mid
		}

		if arr[mid] < obj {
			le = mid + 1
		} else {
			ri = mid - 1
		}
	}

	return - 1
}

fn main() {
	arr := [1, 5, 10, 43, 101, 202]
	obj := 202

	result_recursive := binary_search_recursive(arr, 0, arr.len, obj)
	result_iterative := binary_search_iterative(arr, 0, arr.len, obj)

	if result_recursive == -1 || result_iterative == -1{
		println('El elemento no se ha encontrado')
	} else {
		println('Elemento encontrado en la posicion ${result_recursive}')
		println('Elemento encontrado en la posicion ${result_iterative}')
	}
}