all:
	nasm -f macho64 ft_putchar.s
	nasm -f macho64 ft_putstr.s
	clang main.c ft_putchar.o ft_putstr.o
	./a.out
clean:
	rm a.out
	rm *.o