/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: arraji <arraji@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/02/08 20:52:28 by amoussai          #+#    #+#             */
/*   Updated: 2020/11/13 09:55:54 by arraji           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "./inlcudes/header.h"

void	test1(void)
{
	char	*str;
	int		fd;

	printf("TEST ft_strlen\n");
	printf("%d\n", ft_strlen("hello"));
	printf("%d\n", ft_strlen(""));
	printf("\nTEST ft_strcpy\n");
	str = (char*)malloc(sizeof(char) * 10);
	ft_strcpy(str, "hello");
	printf("%s\n", str);
	ft_strcpy(str, "");
	printf("%s\n", str);
	printf("\nTEST ft_strcmp\n");
	printf("asm: %d\ndefault: %d\n", ft_strcmp("hii", "hi"), strcmp("hii", "hi"));
	printf("asm: %d\ndefault: %d\n", ft_strcmp("hola", "hello"), strcmp("hola", "hello"));
	printf("asm: %d\ndefault: %d\n", ft_strcmp("", "adcb"), strcmp("", "adcb"));
	printf("\nTEST ft_write\n");
	printf("asm: \t%d \ndefault: %zd\n", ft_write(1, "hello world", 11), write(1, "hello world", 11));
	printf("asm: \t%d \ndefault: %zd\n", ft_write(42, "hello world", 11), write(42, "hello world", 11));
	fd = open("ok", O_RDWR);
	printf("asm: \t%d \ndefault: %zd\n", ft_write(fd, "hello world", 11), write(fd, "hello world", 11));
	printf("asm: \t%d \ndefault: %zd\n", ft_write(1, "hello world", -11), write(1, "hello world", -11));
}

void	test2(void)
{
	char	*str;
	int		fd;

	printf("\n\n\nTEST ft_read\n\n\n");
	str = (char*)malloc(sizeof(char) * 10);
	printf("%d\n", ft_read(1, str, 10));
	printf("----str = %s\n", str);
	free(str);
	str = (char*)malloc(sizeof(char) * 10);
	printf("%d\n", ft_read(42, str, 10));
	printf("----str = %s\n", str);
	free(str);
	str = (char*)malloc(sizeof(char) * 10);
	fd = open("ok", O_RDONLY);
	printf("%d\n", ft_read(fd, str, 11));
	printf("----str = %s\n", str);
	free(str);
	str = (char*)malloc(sizeof(char) * 10);
	printf("%d\n", ft_read(-42, str, 11));
	perror("");
	printf("\n\n\nTEST ft_strdup\n\n\n");
	str = ft_strdup("hello world");
	printf("%s\n", str);
	free(str);
	str = ft_strdup("");
	printf("%s\n", str);
	free(str);
	close(fd);
}

void	test3()
{
	printf("\n\n\nTEST ft_atoi_base\n");
	printf("%d\n", ft_atoi_base("101001", "01"));
	printf("%d\n", ft_atoi_base("123456", "01234+56789"));
	printf("%d\n", ft_atoi_base("123456", "-01234+56789"));
	printf("%d\n", ft_atoi_base("-123456", "0123456789"));
	printf("%d\n", ft_atoi_base("-F", "0123456789ABCDEF"));
	
}

void print_list(t_list *list)
{
	while (list)
	{
		printf("%d ", (int)list->content);
		list = list->next;
	}
	printf("\n");
}
int	foo(int a, int b)
{
	if (a == b)
		return 0;
	return 1;
}

int	foo2(int a, int b)
{
	return (b - a);
}
void	test4()
{
	time_t t;
	srand((unsigned) time(&t));

	t_list	*lst = NULL;
	long j = 0;
	for (size_t i = 0; i < 10; i++)
	{
		ft_list_push_front(&lst, (void *)j);
		j++;
	}
	print_list(lst);
	printf("size :%d\n", ft_list_size(lst));
	ft_list_remove_if(&lst, (void*)1, foo);
	ft_list_remove_if(&lst, (void*)2, foo);
	ft_list_remove_if(&lst, (void*)3, foo);
	ft_list_remove_if(&lst, (void*)4, foo);
	ft_list_remove_if(&lst, (void*)5, foo);
	print_list(lst);
	ft_list_remove_if(&lst, (void*)6, foo);
	ft_list_remove_if(&lst, (void*)7, foo);
	ft_list_remove_if(&lst, (void*)8, foo);
	ft_list_remove_if(&lst, (void*)9, foo);
	ft_list_remove_if(&lst, (void*)0, foo);
	print_list(lst);
	for (size_t i = 0; i < 10; i++)
	{
		ft_list_push_front(&lst, (void *)(rand() % 10));
		j++;
	}
	print_list(lst);
	ft_list_sort(&lst, foo2);
	print_list(lst);
}
int		main(int n, char **argv)
{
	test1();
	test2();
	test3();
	test4();
	return (0);
}
