module main

import os

struct DeadFishState {
mut:
	accumulator int
	output      string
	print_ascii bool
}

// Interpret a line of Deadfish code
fn (mut f DeadFishState) interpret_line(input string) {
	for c in input {
		// Support the weird overflow behavior that Deadfish expect,
		// u8 breaks programs
		if f.accumulator == 256 || f.accumulator == -1 {
			f.accumulator = 0
		}
		match c {
			`i` {
				f.accumulator++
			}
			`d` {
				f.accumulator--
			}
			`o` {
				if f.print_ascii {
					f.output += u8(f.accumulator).ascii_str()
				} else {
					f.output += f.accumulator.str()
				}
			}
			`s` {
				f.accumulator *= f.accumulator
			}
			else {
				f.output += '\n'
			}
		}
	}
}

// Parse commands that are not Deadfish code
// Returns true if the command was parsed, false otherwise
fn parse_commands(input string, mut f DeadFishState) bool {
	// Exit on q
	if input in ['q', 'quit', 'exit'] {
		exit(0)
	} else if input in ['a', 'ascii', 'asc'] {
		// Change printing mode
		f.print_ascii = !f.print_ascii
		println('ascii mode: ${f.print_ascii}')
		return true
	} else if input in ['r', 'reset'] {
		// Reset accumulator
		f.accumulator = 0
		f.output = ''
		println('accumulator reset')
		return true
	}
	return false
}

fn main() {
	mut f := DeadFishState{
		accumulator: 0
		output: ''
		print_ascii: false
	}
	mut exit_program := false

	for !exit_program {
		print('>> ')
		input := os.get_line()
		if !parse_commands(input, mut f) {
			f.interpret_line(input)
			if f.output.len > 0 {
				println(f.output)
			}
		}
	}
}
