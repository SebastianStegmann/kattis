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
	fields := strings.fields(first)

	L, _ := strconv.parse_int(fields[0])
	R, _ := strconv.parse_int(fields[1])

	half_L := f64(L) / 2

	C2    := math.pow_f64(f64(half_L), 2) * 2
	C     := math.sqrt(C2)

	if C >= f64(R) {
		fmt.println("nope")
	} else {
		fmt.println("fits")
	}
}

