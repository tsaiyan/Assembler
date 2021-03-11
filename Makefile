all:
	nasm -f macho64 test.s
	ld -lSystem -o program test.o
	./program
clean:
	rf test.o
	rf program