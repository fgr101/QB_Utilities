DECLARE SUB ListaMercado1 ()
DECLARE SUB Load ()
DECLARE SUB Save ()
DECLARE SUB WaitKey ()
DECLARE SUB Mercado1 ()

'COMPILANDO CON FREEBASIC

' Para evitar errores al compilar en FREEBASIC, declarar variables de la
' siguiente manera, no utilizar COMAS. Cada variable debe estar declarada
' de forma correcta sin sufijos $ al final de las variables. Por ejemplo
' no se puede colocar NombreMercado$, da error.

'ABSOLUTAMENTE TODAS las variables utilizadas en el programa, deberán ser
'declaradas al comienzo del codigo.

'NO USAR CALL - Para correr las subrutinas no debemos colocar CALL sino
'directamente utilizar el nombre de la subrutina.

'Ej: CALL WaitKey --> ERRADO // WaitKey --> CORRECTO

'La ventaja de compilar con FREE BASIC es que podemos disponibilizar
'nuestros programas escritos en QBASIC en WINDOWS 64, WINDOWS32,
'MSDOS y LINUX. Quienes usen MAC pueden correr una version de Win64 o
'Win32 usando WINE.

DIM SHARED ProdutoA(1000) AS STRING
DIM SHARED ProdutoB(1000) AS STRING
DIM SHARED nome AS STRING
DIM SHARED NomeMercado1 AS STRING
DIM SHARED NomeMercado2 AS STRING

DIM SHARED PrecoProdutoA(1000) AS single
DIM SHARED PrecoProdutoB(1000) AS single
DIM SHARED NumeroDeProduto(1000) AS INTEGER
DIM SHARED opcion AS INTEGER
DIM SHARED loopx AS INTEGER
DIM SHARED x AS INTEGER

Load

MenuPrincipal:
opcion = 0
CLS

color 10

if NomeMercado1	= "" then
PRINT "1- Lista de Produtos Mercado1"
else 
PRINT "1- Lista de Produtos "; NomeMercado1
end if

if NomeMercado2 = "" then
PRINT "2- Lista de Produtos Mercado2"
else
PRINT "2- Lista de Produtos "; NomeMercado2
end if


print

if NomeMercado1	= "" then
PRINT "3- Acrescentar Produtos do Mercado1"
else 
PRINT "3- Acrescentar Produtos do "; NomeMercado1
end if

if NomeMercado2 = "" then
PRINT "4- Acrescentar Produtos do Mercado2"
else
PRINT "4- Acrescentar Produtos do "; NomeMercado2
end if

print
print "5- Comparar só um produto"
print "6- Sair"

INPUT opcion

SELECT CASE opcion
        CASE 1
        call ListaMercado1
        case 2
        call ListaMercado2
        CASE 3
        Mercado1
        case 4
        call Mercado2
        case 5
        call CompararSoUm
        CASE 6
        call Save
        END
		CASE ELSE
		GOTO MenuPrincipal
END SELECT

GOTO  MenuPrincipal

'mercado2:
'INPUT "Nome do Produto:"; produtoB$(1)
'INPUT "Valor do Produto:"; produtoB(x)
'NomeMercado2$ = "Carrefour"

'mercado3:
'INPUT "Nome do Produto:"; produtoC$(1)
'INPUT "Valor do Produto:"; produtoC(x)
'NomeMercado3$ = "ASdds"

'IF ProdutoA(x) < produtoB(x) AND ProdutoA(x) < produtoB(x) THEN
'PRINT "O produto e mais barato em"; NomeMercado1$
'END IF

'IF produtoB(x) < ProdutoA(x) AND produtoB(x) < produtoC(x) THEN
'PRINT "O produto e mais barato em"; NomeMercado2$
'END IF

'IF produtoC(x) < ProdutoA(x) AND produtoC(x) < produtoB(x) THEN
'PRINT "O produto e mais barato em"; NomeMercado3$
'END IF

SUB ListaMercado1

loopx = 0
print

DO UNTIL loopx = 1000

IF NOT ProdutoA(loopx) = "" and NOT PrecoProdutoA(loopx) = 0 THEN
PRINT ProdutoA(loopx); " | $"; PrecoProdutoA(loopx); " | ID -"; NumeroDeProduto(loopx)
END IF

loopx = loopx + 1
LOOP

WaitKey

END SUB

SUB Load

'Checking FILES +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
'If FILES don't exist the program creates them. ++++++++++++++++++++++++++++

OPEN "data.dat" FOR BINARY AS #1
IF LOF(1) = 0 THEN
CLOSE #1

OPEN "data.dat" FOR OUTPUT AS #1

loopx = 0
DO UNTIL loopx = 3003
WRITE #1, ""
loopx = loopx + 1
LOOP

CLS
PRINT "data.dat file created..."

END IF
CLOSE #1


OPEN "data.dat" FOR INPUT AS #1

INPUT #1, NomeMercado1
input #1, NomeMercado2

loopx = 0

DO UNTIL loopx = 100

	INPUT #1, ProdutoA(loopx)
	INPUT #1, PrecoProdutoA(loopx)
	INPUT #1, ProdutoB(loopx)
	INPUT #1, PrecoProdutoB(loopx)
	input #1, NumeroDeProduto(loopx)
	loopx = loopx + 1

LOOP

CLOSE #1
END SUB

SUB Mercado1

Mercado1INI:

if NomeMercado1 = "" then
	
	input "Qual é o nome do mercado"; NomeMercado1

end if

PRINT
INPUT "Nome do Produto:"; nome
nome = UCASE$(nome)               'UCASE$ pasa cualquier STRING
                                  'a mayusculas. LCASE$ hace lo
                                  'contrario.

'====================================================================
                                        
loopx = 0                         
DO UNTIL loopx = 1000             
                                 
								 '1- SI ENCUENTRA UN LUGAR VACIO EN LA LISTA
IF ProdutoA(loopx) = "" THEN	 'SIGNIFICA QUE NO HAY MÁS PRODUCTOS. TERMINA
        NumeroDeProduto(loopx) = loopx  'LA BUSQUEDA Y COLOCA EN ESE ESPACIO EL PRODUCTO.
        ProdutoA(loopx) = nome  
        PRINT "Produto Novo. ID "; NumeroDeProduto(loopx); "."
        GOTO SkipLoop
END IF
								 '2- CHEQUEA SI EL NOMBRE DEL PRODUCTO
								 'SE ENCUENTRA ENTRE LOS ITEMS DEL	
IF nome = ProdutoA(loopx) THEN	 'MERCADO.
        NumeroDeProduto(loopx) = loopx
        'ProdutoA(NumeroDeProduto) = nome
        PRINT "Produto achado na lista. ID "; NumeroDeProduto(loopx); "."
        GOTO SkipLoop
END IF

loopx = loopx + 1
LOOP

'====================================================================

'loopx = 0                     '2- SI EL NOMBRE DEL PRODUCTO NO FUE ENCONTRADO
'DO UNTIL loopx = 1000         'BUSCA UN LUGAR VACIO EN LA LISTA DE PRODUCTOS
                              'PARA PODER COLOCAR EL NUEVO ITEM.


'loopx = loopx + 1
'LOOP

'====================================================================

SkipLoop:
x = NumeroDeProduto(loopx)
call IgualarItemsID

PRINT
PerguntarNovamente:
INPUT "Valor do Produto:"; PrecoProdutoA(x)

IF PrecoProdutoA(x) = 0 THEN
        GOTO PerguntarNovamente
END IF

PRINT
PRINT "Produto: "; ProdutoA(x); " | ID do Produto:"; NumeroDeProduto(x)
PRINT "Valor: $"; PrecoProdutoA(x)

PRINT
PRINT "[1] Acrescentar outro produto [2] Sair"
INPUT opcion

SELECT CASE opcion
        CASE 1
        GOTO Mercado1INI
        CASE 2
        Save
        GOTO FinSubMercado1
END SELECT

FinSubMercado1:
END SUB

SUB Save '========================== SAVES DATA ==========================

OPEN "data.dat" FOR OUTPUT AS #1

WRITE #1, NomeMercado1
WRITE #1, NomeMercado2

loopx = 0
DO UNTIL loopx = 1000

	WRITE #1, ProdutoA(loopx)
	WRITE #1, PrecoProdutoA(loopx)
	WRITE #1, ProdutoB(loopx)
	WRITE #1, PrecoProdutoB(loopx)
	WRITE #1, NumeroDeProduto(loopx)
	loopx = loopx + 1

LOOP

LOCATE , 25
PRINT "Data saved in data.dat..."
CLOSE #1

END SUB

SUB WaitKey

DO WHILE INKEY$ = ""
LOOP

END SUB

sub Mercado2
Mercado2INI:

if NomeMercado2 = "" then
	
	input "Qual é o nome do mercado"; NomeMercado2

end if

PRINT
INPUT "Nome do Produto:"; nome
nome = UCASE$(nome)               'UCASE$ pasa cualquier STRING
                                  'a mayusculas. LCASE$ hace lo
                                  'contrario.

'====================================================================
                                        
loopx = 0                         
DO UNTIL loopx = 1000             
                                 
								 '1- SI ENCUENTRA UN LUGAR VACIO EN LA LISTA
IF ProdutoB(loopx) = "" THEN	 'SIGNIFICA QUE NO HAY MÁS PRODUCTOS. TERMINA
        NumeroDeProduto(loopx) = loopx  'LA BUSQUEDA Y COLOCA EN ESE ESPACIO EL PRODUCTO.
        ProdutoB(loopx) = nome  
        PRINT "Produto Novo. ID "; NumeroDeProduto(loopx); "."
        GOTO SkipLoop
END IF
								 '2- CHEQUEA SI EL NOMBRE DEL PRODUCTO
								 'SE ENCUENTRA ENTRE LOS ITEMS DEL	
IF nome = ProdutoB(loopx) THEN	 'MERCADO.
        NumeroDeProduto(loopx) = loopx
        'ProdutoB(NumeroDeProduto) = nome
        PRINT "Produto achado na lista. ID "; NumeroDeProduto(loopx); "."
        GOTO SkipLoop
END IF

loopx = loopx + 1
LOOP

'====================================================================

'loopx = 0                     '2- SI EL NOMBRE DEL PRODUCTO NO FUE ENCONTRADO
'DO UNTIL loopx = 1000         'BUSCA UN LUGAR VACIO EN LA LISTA DE PRODUCTOS
                              'PARA PODER COLOCAR EL NUEVO ITEM.


'loopx = loopx + 1
'LOOP

'====================================================================

SkipLoop:
x = NumeroDeProduto(loopx)
call IgualarItemsID

PRINT
PerguntarNovamente:
INPUT "Valor do Produto:"; PrecoProdutoB(x)

IF PrecoProdutoB(x) = 0 THEN
        GOTO PerguntarNovamente
END IF

PRINT
PRINT "Produto: "; ProdutoB(x); " | ID do Produto:"; NumeroDeProduto(x)
PRINT "Valor: $"; PrecoProdutoB(x)

PRINT
PRINT "[1] Acrescentar outro produto [2] Sair"
INPUT opcion

SELECT CASE opcion
        CASE 1
        GOTO Mercado2INI
        CASE 2
        Save
        GOTO FinSubMercado2
END SELECT

FinSubMercado2:


end sub

sub ListaMercado2

loopx = 0
print

DO UNTIL loopx = 1000

IF NOT ProdutoB(loopx) = "" and NOT PrecoProdutoB(loopx) = 0 THEN
PRINT ProdutoB(loopx); " | $"; PrecoProdutoB(loopx); " | ID -"; NumeroDeProduto(loopx)
END IF

loopx = loopx + 1
LOOP

WaitKey

end sub

sub IgualarItemsID

ProdutoA(x) = nome
ProdutoB(x) = nome
NumeroDeProduto(x) = x 



end sub

sub CompararSoUm

print
input "Ingrese o nome do produto: ", nome
nome = ucase$(nome)

loopx = 0

do until loopx = 1000
	
	if ProdutoA(loopx) = "" then
	
		print "Produto nao listado." 
		goto EndCompararSoUm
		
	end if
	
	if nome = ProdutoA(loopx) then
		
		NumeroDeProduto(loopx) = loopx
		goto SkipLoop1
	
	end if
		
	loopx = loopx + 1

loop

SkipLoop1:
x = NumeroDeProduto(loopx)

print
PRINT "Produto: "; ProdutoA(x); " | ID do Produto:"; NumeroDeProduto(x);" | $"; PrecoProdutoA(x); " | Mercado: "; NomeMercado1
PRINT "Produto: "; ProdutoB(x); " | ID do Produto:"; NumeroDeProduto(x);" | $"; PrecoProdutoB(x); " | Mercado: "; NomeMercado2

if PrecoProdutoA(x) < PrecoProdutoB(x) then
	
	print 
	print "O preco mais baixo está no mercado "; NomeMercado1; "."

end if

if PrecoProdutoB(x) < PrecoProdutoA(x) then
	
	print 
	print "O preco mais baixo está no mercado "; NomeMercado2; "."

end if

if PrecoProdutoA(x) = PrecoProdutoB(x) then
	
	print 
	print "O valor do produto é o mesmo em todos os mercados."

end if


WaitKey

EndCompararSoUm:
WaitKey

end sub
