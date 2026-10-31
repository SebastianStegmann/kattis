package main

import "core:fmt"
import "core:os"
import "core:strconv"
import "core:strings"
import "core:slice"

main :: proc() {
	data, _ := os.read_entire_file(os.stdin, context.allocator)

	input := string(data)


	line, _ := strings.split_lines_iterator(&input)

	fields := strings.fields(line)

	a, _ := strconv.parse_int(fields[0])
	b, _ := strconv.parse_int(fields[1])
	c, _ := strconv.parse_int(fields[2])
	n, _ := strconv.parse_int(fields[3])

	if a + b + c >= n && a > 0 && b > 0 && c > 0 && n > 2 {
		fmt.println("YES")
	} else {
		fmt.println("NO")
	}
}

