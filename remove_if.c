#include <libc.h>

typedef struct s_list
{
	void			*data;
	struct	s_list	*next;
}				t_list;

int	fun(void *s1, void *s2)
{
	if ((int)s1 == (int)s2)
	{
		return (0);
	}
	return (1);
}

void remove_if(t_list **begin_list, void *data_ref, int (*cmp)())
{
	t_list *prev;
	t_list *tmp;
	t_list *curr;

	if (begin_list == NULL || *begin_list == NULL)
		return;
	while((*cmp)((*begin_list)->data, data_ref) == 0 )
	{
		tmp = *begin_list;
		*begin_list = (*begin_list)->next;
		free(tmp);
	}
	curr = (*begin_list)->next;
	prev = *begin_list;
	while (curr)
	{
		if ((*cmp)(curr->data, data_ref) == 0)
		{
			tmp = curr;
			curr = curr->next;
			prev->next = curr;
			free(tmp);
			continue;
		}
		curr = curr->next;
		prev = prev->next;
	}
}

int main(void)
{
	t_list *lst;
	int i = 1;
	int j = 2;

	lst = (t_list*)malloc(sizeof(t_list));
	lst->data = &i;
	lst->next = (t_list*)malloc(sizeof(t_list));
	lst->next->data = &j;
	lst->next->next = (t_list*)malloc(sizeof(t_list));
	lst->next->next->data = &i;
	lst->next->next->next = (t_list*)malloc(sizeof(t_list));
	lst->next->next->next->data = &i;
	lst->next->next->next->next = (t_list*)malloc(sizeof(t_list));
	lst->next->next->next->next->data = &j;
	lst->next->next->next->next->next =  NULL;
	t_list *save;
	save = lst;
	while (save != NULL)
	{
		printf("%d\n", *(int*)save->data);
		save = save->next;
	}
		printf("%s\n", "-------");
	remove_if(&lst, &j, fun);

	save = lst;
	while (save != NULL)
	{
		printf("%d\n", *(int*)save->data);
		save = save->next;
	}

	return (0);
}
