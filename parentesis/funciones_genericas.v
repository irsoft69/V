//vlib/builtin/array.v
fn array_eq<T>(a1 []T, a2 []T) bool {
   if a1.len != a2.len {
      return false
   }
   for i := 0; i < a1.len; i++ {
      if a1[i] != a2[i] {
         return false
      }
   }
   return true
}

fn main() {
	a:=[1,2,3,4,5]
	b:=[1.0,2.0,3.0,4.0,5.0]
	c:=[1,2,3,4,5]

	println(array_eq(a,b))
	println(array_eq(a,c))
}