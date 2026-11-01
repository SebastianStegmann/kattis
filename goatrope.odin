package main

import "core:fmt"
import "core:os"
import "core:strconv"
import "core:strings"
import "core:slice"
import "core:math"

main :: proc() {
	data, _ := os.read_entire_file(os.stdin, context.allocator)

	input := string(data)

	line, _ := strings.split_lines_iterator(&input)

	fields := strings.fields(line)

	numbers := slice.mapper(fields, proc(s: string) -> (n: int) {
		n, _ = strconv.parse_int(s)
		return
	})


	x, y := numbers[0], numbers[1]
	x1, y1 := numbers[2], numbers[3]
	x2, y2 := numbers[4], numbers[5]

	// find if y is hihger or lower y1 and y2
	// find if x is hihger or lower x1 and x2
	// fmt.println("goatpole: ", "x: ", x, "y: ", y)

	ycoords : []int = {y1, y2}
	
	// closest :: proc(n: int, n1: int, n2:int) -> (c: int) {
	// 	if n1 < n  && n < n2 {
	// 		fmt.println("closest: ", n)
	// 		return n
	// 	}
	// 	if n < n1 {
	// 		fmt.println("closest: ", n1)
	// 		return n1
	// 	}
	// 	if n2 < n {
	// 		fmt.println("closest: ", n2)
	// 		return n2
	// 	}
	// 	return 100000
	// }

	// closest_y := closest(y, y1, y2)
	// closest_x := closest(x, x1, x2)

	closest_y := math.clamp(y, y1, y2)
	closest_x := math.clamp(x, x1, x2)

	// fmt.println("closest x: " ,closest_x)
	// fmt.println("closest y: " ,closest_y)

	// fmt.println(math.abs(closest_x - x))
	// fmt.println(math.abs(closest_y - y))

	sqrx := math.abs(closest_x - x) * math.abs(closest_x - x)
	sqry := math.abs(closest_y - y) * math.abs(closest_y - y)

	// fmt.println(sqrx, sqry)

	fmt.println(math.sqrt_f64(f64(sqrx) + f64(sqry)))
}

