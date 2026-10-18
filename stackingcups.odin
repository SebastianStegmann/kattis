package main

import "core:fmt"
import "core:os"
import "core:strconv"
import "core:slice"
import "core:strings"


Cup :: struct {
	num: int,
	color: string,
}

main :: proc() {
	buf: [4096]byte
	n, err := os.read(os.stdin, buf[:])
	str := string(buf[:])

	parts := strings.fields(str)

	count, _ := strconv.parse_int(parts[0])

	cups := make([]Cup, count)

	for i in 0..<count {
		a := parts[1 + i*2]
		b := parts[2 + i*2]

		if v, ok := strconv.parse_int(a, 10); ok {
			cups[i] = Cup{v, b}
		} else {
			v, _ := strconv.parse_int(b, 10)
			cups[i] = Cup{v * 2, a}
		}

	}

	slice.sort_by(cups, proc(x, y: Cup) -> bool {
		return x.num < y.num
	})

	for c in cups {
		fmt.println(c.color)
	}
}
