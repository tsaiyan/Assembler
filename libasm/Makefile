SRCS = ft_read.s ft_strcmp.s ft_strcpy.s ft_strdup.s ft_strlen.s ft_write.s 

BNS = ft_putstr.s ft_putchar.s

HEADER = libasm.h

OBJS = $(SRCS:.s=.o)

BNSOBJS =  $(BNS:.s=.o)

NAME = libasm.a

RM = rm -f

CC = nasm -f macho64

.PHONY:		all clean fclean re

all: $(NAME) libasm.h

$(NAME): $(OBJS)
	ar rc $(NAME) $?
	ranlib $(NAME)
.s.o:
	$(CC) $< -o $@

clean:
	${RM} $(OBJS)
	${RM} $(BNSOBJS)

fclean: clean
	${RM} $(NAME)

run: $(NAME)
	clang main.c $(NAME) $(HEADER)
	./a.out
re: fclean $(NAME)