#include <unistd.h>

void	ft_putchar(char ch);
void	ft_putstr(char *str);
size_t	ft_strlen(char *str);
ssize_t	ft_write(int fd, void *buf, size_t nbyte);
ssize_t	ft_read(int fd, void *buf, size_t nbyte);
int		ft_strcmp(const char *s1, const char *s2);
int		strcmp(const char *s1, const char *s2);
char 	*ft_strcpy(char *dst, const char *src);
char	*ft_strdup(const char *s1);

#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

int	main(void)
{
	char *src = "abc";
	char dest[10];
	char dest2[10];
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
	int fd = open("test.txt", O_RDONLY);
	printf("ft_read = %zd\n", ft_read(fd, buffer, 1));
	perror("error ft_read");
	printf("read = %zd\n", read(fd, buffer, 1));
	perror("error read");
	close(fd);
	puts("- - - - - -- - - - - - - -- - - - - - - -- - - - - - -- - - ");
	printf("ft_strcmp = %d\n", ft_strcmp("abcd ", "abcd"));
	puts("- - - - - -- - - - - - - -- - - - - - - -- - - - - - -- - - ");
	printf("strcpy = %s\n", strcpy(dest, src));
	printf("ft_strcpy = %s\n", ft_strcpy(dest2, src));
	puts("- - - - - -- - - - - - - -- - - - - - - -- - - - - - -- - - ");
	char *str_for_malloc = NULL;
	str_for_malloc = ft_strdup(NULL);
	printf("malloc NULL = %s \n", str_for_malloc);
	str_for_malloc = ft_strdup("ok str alloced");
	printf("malloc ok = %s \n", str_for_malloc);
	return (0);
}
