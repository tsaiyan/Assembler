#include <unistd.h>

void	ft_putchar(char ch);
void	ft_putstr(char *str);
size_t	ft_strlen(char *str);
ssize_t	ft_write(int fildes, const void *buf, size_t nbyte);
ssize_t	ft_read(int fildes, void *buf, size_t nbyte);

#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

int	main(void)
{
	char buffer[10];
	printf("ft_strlen = %zu\n", ft_strlen("strlenfwefijewifeijwf"));
	printf("strlen = %zu\n", strlen("strlenfwefijewifeijwf"));
	puts("- - - - - -- - - - - - - -- - - - - - - -- - - - - - -- - - ");
	
	//ft_putstr("Hello, world!\n");
	printf("ft_write = %zd\n", ft_write(-1, "ok", 2));
	perror("error ft_write");
	printf("write = %zd\n", write(-1, "ok", 2));
	perror("error write");
	puts("- - - - - -- - - - - - - -- - - - - - - -- - - - - - -- - - ");
	
	errno = 0;
	int fd = open("/Users/tsaiyan/libasm/test.txt", O_RDONLY);
	printf("ft_read = %zd\n", ft_read(fd, buffer, 1));
	perror("error ft_read");
	printf("read = %zd\n", read(fd, buffer, 1));
	perror("error read");
	close(fd);
	puts("- - - - - -- - - - - - - -- - - - - - - -- - - - - - -- - - ");
	
	return (0);
}
