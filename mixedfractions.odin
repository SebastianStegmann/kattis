package main

import "core:fmt"
import "core:os"
import "core:strconv"
import "core:strings"
import "core:slice"

main :: proc() {
	data, _ := os.read_entire_file(os.stdin, context.allocator)

	input := string(data)


	for true {
		line, _ := strings.split_lines_iterator(&input)

		if len(line) == 0 {
			break
		}

		fields := strings.fields(line)

		numerator, _ := strconv.parse_int(fields[0])
		denominator, _ := strconv.parse_int(fields[1])

		if denominator != 0 {
			a := numerator / denominator
			b := numerator % denominator
			fmt.println(a, b, "/", denominator)
		}
	}
}

