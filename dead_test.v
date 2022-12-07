module main

fn test_simple() {
	mut state := DeadFishState{}
	program := 'iissisdddddddddddddddddddddddddddddddddo'
	state.interpret_line(program)
	assert state.accumulator == 0
}

fn test_simple_2() {
	mut state := DeadFishState{}
	program := 'diissisdo'
	state.interpret_line(program)
	assert state.accumulator == 288
}

fn test_simple_3() {
	mut state := DeadFishState{}
	program := 'iissso'
	state.interpret_line(program)
	assert state.accumulator == 0
}

fn test_hello_world() {
	mut state := DeadFishState{
		print_ascii: true
	}
	program := ['iiisdsiiiiiiiioiiiiiiiiiiiiiiiiiiiiiiiiiiiiioiiiiiiiooiiio',
		'dddddddddddddddddddddddddddddddddddddd', 'dddddddddddddddddddddddddddddoddddddddddddo',
		'dddddddddddddddddddddsdd', 'oddddddddoiiioddddddoddddddddo',
		'ddddddddddddddddddddddddddddddd', 'ddddddddddddddddddddddddddddddddddddo']
	for l in program {
		state.interpret_line(l)
	}
	assert state.output == 'Hello, world!'
}
