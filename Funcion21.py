def ew(filas,columnas):
	cont=filas-1
	for ele in range(1,filas):
		for tel in range(1,columnas):
			print ele,tel
	print "For Realizado\n"
	while cont <= filas and cont > 0:
		cont2=columnas-1
		while cont2 <= columnas and cont2 > 0:
			print cont, cont2
			cont2-=1
		cont-=1
	return "\n"

print ew(5,5)
