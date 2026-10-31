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

	cases, _ := strconv.parse_int(first)
	for n in 0..<cases {
		// fmt.println(n)
		line, _ := strings.split_lines_iterator(&input)
		number, _ := strconv.parse_int(line)

		buf: [32]byte
		num_as_string := strconv.write_int(buf[:], i64(math.factorial(number)), 10)
		split := strings.split(num_as_string, "")
		fmt.println(split[len(split) - 1])
	}
}

