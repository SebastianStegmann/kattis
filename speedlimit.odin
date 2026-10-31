package main

import "core:fmt"
import "core:os"
import "core:strconv"
import "core:strings"
import "core:slice"

main :: proc() {
	data, _ := os.read_entire_file(os.stdin, context.allocator)
	defer delete(data)

	input := string(data)

	size: int
	read: string
	for read != "-1" {
		read, _ = strings.split_lines_iterator(&input)
		size, _ = strconv.parse_int(read)
		if read == "-1" do break
		
		sum: int
		miles_driven: int
		for _ in 0..<size {
			read, _ = strings.split_lines_iterator(&input)

			line := slice.mapper(strings.fields(read), proc(s: string) -> (n: int) {
				n, _ = strconv.parse_int(s)
				return
			})
			defer delete(line)

			mph := line[0]
			h   := line[1]

			sum += mph * (h - miles_driven)
			miles_driven = h
		}

		fmt.printfln("%d miles", sum)

		sum = 0
		miles_driven = 0
	}
}
