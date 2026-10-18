package main

import "core:fmt"
import "core:os"
import "core:strconv"

fib :: proc(n: int) -> int {
	a, b, c := 0, 0, 1
	for n in 0..<n {
		a, b, c = b, c, a + b + c
	}
	return c
}

main :: proc() {
	buf: [8]byte
	n, err := os.read(os.stdin, buf[:])
	str := string(buf[:])

	input, _ := strconv.parse_int(str, 10)

	fmt.println(fib(input))
}

