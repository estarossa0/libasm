NAME	= libasm.a

NASM	= ns -f macho64

SRCS	= srcs/ft_strlen.s \
			srcs/ft_write.s \
			srcs/ft_read.s \
			srcs/ft_strcpy.s \
			srcs/ft_strcmp.s \
			srcs/ft_strdup.s \

OBJS	= $(SRCS:.s=.o)

SRCS_BONUS	= bonus/ft_atoi_base.s \
				bonus/ft_list_push_front.s \
				bonus/ft_list_size.s \
				bonus/ft_strchr.s \

OBJS_BONUS	= $(SRCS_BONUS:.s=.o)

INCLUDE	= ./include/

%.o: %.s
		$(NASM) $<

all: $(NAME)

$(NAME) :	$(OBJS)
	ar -rc $@ $(OBJS)

bonus : $(OBJS_BONUS) $(OBJS)
	ar -rc $(NAME) $(OBJS) $(OBJS_BONUS)

clean:
	rm -f $(OBJS) $(OBJS_BONUS)
fclean:
	rm -f $(OBJS) $(OBJS_BONUS)
	rm -f $(NAME)

re: fclean all
