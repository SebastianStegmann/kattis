package main

import "core:fmt"
import "core:os"
import "core:strings"
import "core:strconv"

main :: proc() {
	data, _ := os.read_entire_file(os.stdin, context.allocator)

	input := string(data)

	first, _ := strings.split_lines_iterator(&input)

	nk := strings.fields(first)
	n, _ := strconv.parse_int(nk[0]) // overall number of judges
	k, _ := strconv.parse_int(nk[1]) // judges who have voted

	sum_of_current_votes :: proc(k: int, input: ^string) -> (sum: int) {
		for _ in 0..<k {
			line, _ := strings.split_lines_iterator(input)
			num, _ := strconv.parse_int(line)
			sum += num 
		}

		return
	}

	sum := sum_of_current_votes(k, &input)


	result :: proc(sum: int, n: int, k: int) -> (max: f64, min: f64) {
		rest := n - k
		possible_vote := rest * 3

		max = (f64(possible_vote) + f64(sum)) / f64(n) 
		min = (f64(possible_vote * -1) + f64(sum)) / f64(n)


		return min, max
	}

	fmt.println(result(sum, n, k))


}

