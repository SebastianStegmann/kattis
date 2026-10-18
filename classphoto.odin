package main

import "core:fmt"
import "core:os"
import "core:strconv"
import "core:strings"

main :: proc() {
	buf: [64]byte
	n, err := os.read(os.stdin, buf[:])
	str := string(buf[:])

	lines := strings.fields(str)

	a, _ := strconv.parse_int(lines[0], 10)
	b, _ := strconv.parse_int(lines[1], 10)


	result := a * b

	fmt.println(result)

	
}

