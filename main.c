#include <libc.h>
#include <string.h>
typedef struct s_list
{
	void			*data;
	struct	s_list	*next;
}				t_list;
int		ft_strlen(char *);
char	*ft_strcpy(char *, const char *);
int		ft_strcmp(const char *str1, const char *str2);
unsigned long	ft_write(int fd, void *, unsigned long);
unsigned long	ft_read(int, void *, unsigned long);
void	*ft_strdup(unsigned long);
void	ft_list_push_front(t_list **list, void *content);

int		ft_list_size(t_list	*ptr);
void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)());

int main()
{
	char *str;

	str = "hello";
	printf("%d", ft_strlen(str));
}
/* int	fun(void *s1, void *s2)
{
	if ((int)s1 == (int)s2)
	{
		return (0);
	}
	return (1);
}

int main()
{
	t_list	*ptr;
	t_list	*save;
	t_list	**pass;
	char *str;
	void	**data;
	void	**next;

	ptr = NULL;
	ft_list_push_front(&ptr, (void *)0);
	ft_list_push_front(&ptr, (void *)2);
	ft_list_push_front(&ptr, (void *)1);
	ft_list_push_front(&ptr, (void *)4);
	save = ptr;
	while (save)
	{
		printf("%d\n", (int)save->data);
		save = save->next;
	}
	save = ptr;
	printf("size: %d\n", ft_list_size(ptr));
	pass = &ptr;
	ft_list_remove_if(pass, (void *)0, &fun);
	ft_list_remove_if(pass, (void *)1, &fun);
	printf("size: %d\n", ft_list_size(ptr));
	// ft_list_remove_if(pass, (void *)4, &fun);
	// ft_list_remove_if(pass, (void *)2, &fun);
	save = ptr;
	while (save)
	{
		printf("%d\n", (int)save->data);
		save = save->next;
	}
	printf("size: %d\n", ft_list_size(ptr));

}
/* 	printf("%p\n", ptr);
	str = strdup("hello");
	printf("%p\n", str);
	ft_list_push_front(&ptr, (void *)str);
	printf("%p\n", ptr);
	// ptr->data = (void *)str;
	data = &(ptr->data);
	next = (void **)&(ptr->next);
	printf("%p\n", ptr->data);
	printf("%p\n", ptr->next);
	ft_list_push_front(&ptr, (void *)str); */
