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
	printf(" ft_write = %zd (bits written)\n", ft_write(1, "ok", 2));
	printf(" write = %zd (bits written) \n", write(1, "ok", 2));
	printf("bad ft_write = %zd\n", ft_write(-1, "ok", 2));
	perror("perror: ft_write");
	printf("bad write = %zd\n", write(-1, "ok", 2));
	perror("perror: write");
	puts("- - - - - -- - - - - - - -- - - - - - - -- - - - - - -- - - ");
	
	errno = 0;
	int fd = open("test.txt", O_RDONLY);
	printf("bad ft_read = %zd\n", ft_read(-1, buffer, 1));
	perror("perror ft_read");
	printf("bad read = %zd\n", read(-1, buffer, 1));
	perror("perror read");
	printf("ok ft_read = %zd (readed bytes)\n", ft_read(fd, buffer, 1));
	printf("ok read = %zd (readed bytes)\n", read(fd, buffer, 1));
	close(fd);
	puts("- - - - - -- - - - - - - -- - - - - - - -- - - - - - -- - - ");
	printf("ft_strcmp = %d (1 bigger 2 by space)\n", ft_strcmp("abcd ", "abcd"));
	printf("ft_strcmp = %d (the same strings)\n", ft_strcmp("abcd", "abcd"));
	puts("- - - - - -- - - - - - - -- - - - - - - -- - - - - - -- - - ");
	printf("dest =%s\n", dest);
	printf("ft_strcpy return :%s\n", ft_strcpy(dest, src));
	printf("dest now= %s\n", dest);
	puts("- - - - - -- - - - - - - -- - - - - - - -- - - - - - -- - - ");
	char *str_for_malloc = NULL;
	printf("str_for_malloc =%s\n", str_for_malloc);
	str_for_malloc = ft_strdup(NULL);
	printf("ft_strdup NULL = %s \n", str_for_malloc);
	str_for_malloc = ft_strdup("ok str alloced");
	printf("ft_strdup with ok string = %s \n", str_for_malloc);
	return (0);
}
