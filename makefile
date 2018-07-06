all: PasswordParser.lex PasswordParser.y
	bison -o PasswordParser.y.h PasswordParser.y
	flex -o PasswordParser.lex.c PasswordParser.lex
	gcc PasswordParser.lex.c -ll -lfl -lm -o PasswordParser
