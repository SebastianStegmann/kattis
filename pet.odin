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


	to_int :: proc(s: string) -> (n: int) {
		n, _ = strconv.parse_int(s)
		return
	}
	best_index, best_value: int
	for n in 1..=5 {
		current, _ := strings.split_lines_iterator(&input)

		line := strings.fields(current)

		ratings := slice.mapper(line, to_int)
		defer delete(ratings)

		combined_rating := math.sum(ratings)

		if combined_rating > best_value {
			best_value = combined_rating
			best_index = n
		}

	}
	fmt.println(best_index, best_value)
}
