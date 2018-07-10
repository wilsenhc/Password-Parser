

all: PasswordParser.y PasswordParser.lex
	bison -d PasswordParser.y
	flex -o PasswordParser.l.c PasswordParser.lex
	gcc -o PasswordParser PasswordParser.l.c PasswordParser.tab.c -lfl -ll -lm -g

clean:
	rm *.l.c 
	rm *.tab.*
	rm PasswordParser
