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

	hours_traveled: int
	miles_traveled: int
	highest_speed: int
	for n in 0..<count {
		line, _ := strings.split_lines_iterator(&input)
		fields := strings.fields(line)
		hours, _ := strconv.parse_int(fields[0])
		miles, _ := strconv.parse_int(fields[1])

		if hours != 0 && miles != 0 {
			speed := (miles - miles_traveled) / (hours - hours_traveled)
			if speed > highest_speed {
				highest_speed = speed
			}
		}
		hours_traveled = hours
		miles_traveled = miles

	}
	fmt.println(highest_speed)
}
