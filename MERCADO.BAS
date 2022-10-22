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
DIM SHARED NumeroDeProduto AS INTEGER
DIM SHARED opcion AS INTEGER
DIM SHARED loopx AS INTEGER
DIM SHARED x AS INTEGER

Load

MenuPrincipal:
opcion = 0
CLS

PRINT "1- Lista de Produtos Mercado1"
PRINT "2- Acrescentar Produto Mercado1"
PRINT "3- Acrescentar Produto Mercado2"
print "4- Sair"

INPUT opcion

SELECT CASE opcion
        CASE 1
        ListaMercado1
        CASE 2
        Mercado1
        case 3
        call Mercado2
        CASE 4
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

IF NOT ProdutoA(loopx) = "" THEN
PRINT ProdutoA(loopx)
END IF

IF NOT PrecoProdutoA(loopx) = 0 THEN
PRINT PrecoProdutoA(loopx)
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

loopx = 0

DO UNTIL loopx = 100
INPUT #1, ProdutoA(loopx)
INPUT #1, PrecoProdutoA(loopx)
INPUT #1, ProdutoB(loopx)
INPUT #1, PrecoProdutoB(loopx)
loopx = loopx + 1
LOOP

CLOSE #1
END SUB

SUB Mercado1

Mercado1INI:
NomeMercado1 = "Valor"

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
        NumeroDeProduto = loopx  'LA BUSQUEDA Y COLOCA EN ESE ESPACIO EL PRODUCTO.
        ProdutoA(loopx) = nome  
        PRINT "Produto Novo. ID "; NumeroDeProduto; "."
        GOTO SkipLoop
END IF
								 '2- CHEQUEA SI EL NOMBRE DEL PRODUCTO
								 'SE ENCUENTRA ENTRE LOS ITEMS DEL	
IF nome = ProdutoA(loopx) THEN	 'MERCADO.
        NumeroDeProduto = loopx
        ProdutoA(NumeroDeProduto) = nome
        PRINT "Produto achado na lista. ID "; NumeroDeProduto; "."
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
x = NumeroDeProduto

PRINT
PerguntarNovamente:
INPUT "Valor do Produto:"; PrecoProdutoA(x)

IF PrecoProdutoA(x) = 0 THEN
        GOTO PerguntarNovamente
END IF

PRINT
PRINT "Produto: "; ProdutoA(x); " | ID do Produto:"; NumeroDeProduto
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

loopx = 0
DO UNTIL loopx = 1000

WRITE #1, ProdutoA(loopx)
WRITE #1, PrecoProdutoA(loopx)
WRITE #1, ProdutoB(loopx)
WRITE #1, PrecoProdutoB(loopx)

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
NomeMercado2 = "Carrefour"

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
        NumeroDeProduto = loopx  'LA BUSQUEDA Y COLOCA EN ESE ESPACIO EL PRODUCTO.
        ProdutoB(loopx) = nome  
        PRINT "Produto Novo. ID "; NumeroDeProduto; "."
        GOTO SkipLoop
END IF
								 '2- CHEQUEA SI EL NOMBRE DEL PRODUCTO
								 'SE ENCUENTRA ENTRE LOS ITEMS DEL	
IF nome = ProdutoB(loopx) THEN	 'MERCADO.
        NumeroDeProduto = loopx
        ProdutoB(NumeroDeProduto) = nome
        PRINT "Produto achado na lista. ID "; NumeroDeProduto; "."
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
x = NumeroDeProduto

PRINT
PerguntarNovamente:
INPUT "Valor do Produto:"; PrecoProdutoB(x)

IF PrecoProdutoB(x) = 0 THEN
        GOTO PerguntarNovamente
END IF

PRINT
PRINT "Produto: "; ProdutoB(x); " | ID do Produto:"; NumeroDeProduto
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

