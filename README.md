# V Deadfish interpreter

This is a simple interpreter for the [Deadfish](https://esolangs.org/wiki/Deadfish)
esoteric programming language. See the link for more information about the
"language". It is a compliant interpreter and passes the examples given in the
Esolang wiki.

Please note that this was made as a joke, under one hour and is not meant to be
used for "anything serious".

## Usage

To run the REPL interpreter, just run the `v run .` command in the root of the
project:
```bash
$ v run .
>> iissso
0
>>
```

The interpreter is a REPL, so you can type in commands and see the output. The
interpreter will exit when you type `exit`, `quit` or `q`.

You can reset the state of the interpreter by typing `reset` or `r`.

If you want to switch to a Ascii printer, type `ascii`, `asc` or `a`.

## License
Licensed under the MIT License. See the `LICENSE` file for more information.
