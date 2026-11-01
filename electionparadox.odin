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
	line, _ := strings.split_lines_iterator(&input)

	fields := strings.fields(line)

	numbers := slice.mapper(fields, proc(s: string) -> (n:int) {
		n, _ = strconv.parse_int(s)
		return
	})

	slice.sort(numbers)



	goal := (len(numbers) / 2) + 1

	votes: int
	for n, index in numbers {
		if index == goal do break
		votes = votes + ((n / 2) + 1)
	}


	sum := math.sum(numbers)
	result := sum - votes
	fmt.println(result)
}
