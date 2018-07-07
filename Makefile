

clave: sintactico.y lexico.l

	bison -d sintactico.y
	flex -o lexico.l.c lexico.l
	gcc -o clave lexico.l.c sintactico.tab.c -lfl -lm -g
clean:
	rm *.l.c *.tab.* clave
	clear