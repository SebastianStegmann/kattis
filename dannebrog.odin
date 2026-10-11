package main

import "core:fmt"
import "core:os"
import "core:strconv"

main :: proc() {
	buf: [8]byte
	n, err := os.read(os.stdin, buf[:])
	str := string(buf[:])

	input, _ := strconv.parse_int(str, 10)

	flagsize := (input * 3/7) * (input * 3/7) * 5

	fmt.println(flagsize)
}
