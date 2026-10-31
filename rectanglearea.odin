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

	first, _ := strings.split_lines_iterator(&input)

	fields := strings.fields(first)

	x1, _ := strconv.parse_f64(fields[0])
	y1, _ := strconv.parse_f64(fields[1])
	x2, _ := strconv.parse_f64(fields[2])
	y2, _ := strconv.parse_f64(fields[3])

	numbers := slice.mapper(fields, proc(s: string) -> (n: f64) {
		n, _ = strconv.parse_f64(s)
		return
	})

	fmt.println(math.abs(x1 - x2) * math.abs(y1 - y2))
}
