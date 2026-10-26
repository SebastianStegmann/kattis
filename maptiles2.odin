package main

import "core:fmt"
import "core:os"
import "core:strings"
import "core:math"

main :: proc() {
	buf: [64]byte
	n, _ := os.read(os.stdin, buf[:])
	str := strings.trim_space(string(buf[:n]))

	x, y: int


	zoom_level := len(str)


	multiplier : int = int(math.pow(2, f64(len(str) - 1)))
		for n in 1..=len(str) {
			if str[n-1:n] == "0" { x += 0; y += 0 }
			if str[n-1:n] == "1" { x += multiplier; y += 0 }
			if str[n-1:n] == "2" { x += 0; y += multiplier }
			if str[n-1:n] == "3" { x += multiplier; y += multiplier }

			multiplier = multiplier / 2
		}

	fmt.println(zoom_level, x, y)
}

