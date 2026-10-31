
package main

import "core:fmt"
import "core:os"
import "core:strings"
import "core:strconv"
import "core:slice"

main :: proc() {
	data, _ := os.read_entire_file(os.stdin, context.allocator)
	defer delete(data)
	input := string(data)

	first, _ := strings.split_lines_iterator(&input)

	n, _ := strconv.parse_int(first)

	line, _ := strings.split_lines_iterator(&input)

	to_int :: proc(s: string) -> (n: int) {
		n, _ = strconv.parse_int(s)
		return
	}	

	numbers := slice.mapper(strings.fields(line), to_int)

	dividend, divisor := 0, n
	for x in numbers {
		if x >= 0 do dividend += x
		if x < 0 do divisor += x
	}
	fmt.println(f64(dividend) / f64(divisor))

}
