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
	count, _ := strconv.parse_int(first)

	running: bool

	sum: int
	previous: int
	for n in 0..<count {
		line, _ := strings.split_lines_iterator(&input)
		current, _ := strconv.parse_int(line)

		running = !running

		if !running {
			sum += current - previous
		}

		previous = current

	}

	if running {
		fmt.println("still running")
	} else {
		fmt.println(sum)
	}


}
