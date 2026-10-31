package main

import "core:fmt"
import "core:os"
import "core:strconv"
import "core:strings"
import "core:slice"

main :: proc() {
	data, _ := os.read_entire_file(os.stdin, context.allocator)

	input := string(data)

	first, _ := strings.split_lines_iterator(&input)

	n, _ := strconv.parse_int(first)

	for _ in 0..<n {
		line, _ := strings.split_lines_iterator(&input)
		fields := strings.fields(line)
		numbers := slice.mapper(fields, proc(s:string) -> (n: f64) {
			n, _ = strconv.parse_f64(s)
			return
		})



		ABPM := (60 * numbers[0]) / numbers[1]
		min := (60 * (numbers[0] - 1)) / numbers[1]
		max := (60 * (numbers[0] + 1)) / numbers[1]

		fmt.println(min, ABPM, max)
	}
}

