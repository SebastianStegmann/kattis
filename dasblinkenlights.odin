package main

import "core:fmt"
import "core:os"
import "core:strings"
import "core:slice"
import "core:strconv"
import "core:math"

main :: proc() {
	data, _ := os.read_entire_file(os.stdin, context.allocator)

	input := string(data)

	first, _ := strings.split_lines_iterator(&input)

	fields := strings.fields(first)

	to_int :: proc(s: string) -> (n: int) {
		n, _ = strconv.parse_int(s)	
		return 
	}

	numbers := slice.mapper(fields, to_int)

	if math.lcm(numbers[0],numbers[1]) <= numbers[2] {
		fmt.println("yes")
	} else {
		fmt.println("no")
	}
}

