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
	size, _ := strconv.parse_int(first)

	pos :: proc (n: f64) -> (res: f64) {
		if n != 0 do res = n + pos(n - 1)
		return
	}

	for n in 0..<size {
		line, _ := strings.split_lines_iterator(&input)

		fields := strings.fields(line)
		numbers := slice.mapper(fields, proc(s: string) -> (n: f64) {
			n, _ = strconv.parse_f64(s)
			return
		})

		S1 := pos(numbers[1])
		S2 := math.pow_f64(numbers[1], 2)
		S3 := numbers[1] * (numbers[1] + 1)
		fmt.println(n + 1, int(S1), int(S2), int(S3))

	}
}

