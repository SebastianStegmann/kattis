package main

import "core:fmt"
import "core:os"
import "core:strconv"

main :: proc() {
	buf: [8]byte
	n, err := os.read(os.stdin, buf[:])
	str := string(buf[:])

	input, _ := strconv.parse_int(str, 10)

	if input == 1984 {
		fmt.println("Literally 1984")
	} else {
		fmt.printf("Not 1984... yet")
	}
}
