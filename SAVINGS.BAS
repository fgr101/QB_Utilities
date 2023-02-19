DECLARE SUB WaitKey ()
DECLARE SUB MicroPause ()
DECLARE SUB ShowChart ()
DECLARE SUB load ()
DECLARE SUB save ()


programasavings:

'============================================================================
'                    CONTROL DE AHORROS / SAVINGS CONTROL
'============================================================================

'CONTROL DE AHORROS / SAVINGS CONTROL

'Todas las variables usadas en el programa.
'All the variables used in the program.

'Voy a tratar de usar arrays para el dinero en moneda local,
'para los depositos en dolares y para el total de depositos
'(moneda local + dolares). Llevan ese orden 0, 1, 2.

'I'll try to use arrays for the savings in local currency, savings in
'dollars and for the totalsav amount. They'll follow that order 0, 1, 2.


DIM SHARED PatrimonioTotal(0 TO 2) AS CURRENCY
DIM SHARED dinero AS CURRENCY
DIM SHARED totalsav AS CURRENCY

DIM SHARED prestamo AS CURRENCY
DIM SHARED interes AS CURRENCY
DIM SHARED DollarARS AS CURRENCY
DIM SHARED ARSChangeUSD AS CURRENCY


DIM SHARED devolver AS CURRENCY
DIM SHARED xloop AS INTEGER
DIM SHARED valor AS INTEGER



OPCION = 0
tazadeinteres = 10

'FILE SYSTEM
'Checking FILES +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
'If FILES don't exist the program creates them. ++++++++++++++=++++++++++++++

OPEN "savings.bin" FOR BINARY AS #1
IF LOF(1) = 0 THEN
CLOSE #1
OPEN "savings.bin" FOR OUTPUT AS #1
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
WRITE #1, ""
PRINT "savings.bin File created."
END IF
CLOSE #1
SLEEP 2


'LOADS SAVINGS variables FROM the savings.bin file.
CLS
CALL load

CALL ShowChart        '============================================ CHARTS
CALL WaitKey



'This is the beginning of the program.

ahorroini:
CLS

     COLOR 7
     LOCATE 1, 50
     PRINT "Depositos: $"; PatrimonioTotal(0); "// U$"; PatrimonioTotal(1)
     LOCATE 2, 50
     PRINT "A reponer: $"; devolver; "(+"; tazadeinteres; "%)"


     COLOR 15, 5
     LOCATE 1, 1
     PRINT "           Savings Control V0.3             "
     PRINT
     
     COLOR 0, 7

     PRINT "                                            "
     PRINT " 1- Deposit money in local currency  ($)    "
     PRINT " 2- Withdraw money in local currency ($)    "
     PRINT " 3- Deposit money in US dollar     (U$D)    "
     PRINT " 4- Withdraw money in US dollar    (U$D)    "
     PRINT " 5- Savings Report                          "
     PRINT " 6- Change % interest rates                 "
     PRINT " 60- Dolar --> AR$ - Change Rate            "
     PRINT " 7- Reset Data                              "
     PRINT " 8- Show Charts                             "
     PRINT "                                            "
     PRINT " 9- Exit                                    "
     PRINT "                                            "

     PRINT
     COLOR 3, 0
     INPUT OPCION

SELECT CASE OPCION    '//Las diferentes opciones. The different options.

        CASE 1: 'OPCION 1 - AGREGAR DINERO // ADD MONEY

                LOCATE 15
                PRINT "How much money to add?"
                LOCATE 15, 22
                INPUT ; dinero
                PatrimonioTotal(0) = PatrimonioTotal(0) + dinero

                'Coloca el dinero prestado nuevamente en la cuenta.
                devolver = devolver - dinero
                IF devolver < 0 THEN
                devolver = 0
                prestamo = 0
                END IF

                PRINT
                PRINT "Usted posee un total de: ", PatrimonioTotal(0);

                CALL WaitKey
                GOTO ahorroini        'vuelve al ahorroini // goes back to the beginning of the program.


        CASE 2 'OPCION 2 - RETIRAR DINERO // TAKE MONEY
                PRINT
                PRINT "How much money to withdraw?"
                INPUT dinero
                totalsav = PatrimonioTotal(0)
                totalsav = totalsav - dinero


                IF totalsav < 0 THEN
                PRINT "You don't have that money."

                CALL WaitKey
                GOTO ahorroini
                END IF

                IF totalsav >= 0 THEN
                PRINT
                PRINT "Dinero retirado. Usted posee un total de: ";
                PatrimonioTotal(0) = totalsav
                PRINT PatrimonioTotal(0)
                prestamo = prestamo + dinero

                'VARIABLES DE PRESTAMOS E INTERESES
                interes = (prestamo * tazadeinteres) / 100
                devolver = prestamo + interes

                CALL WaitKey

                GOTO ahorroini     'vuelve al ahorroini / goes back to the beginning of the program.
                END IF



        CASE 3 'OPCION 3 - AGREGAR DEPOSITO EN DOLARES / ADD DOLARS
                PRINT
                PRINT "How many dollars to add?"
                INPUT dinero
                PatrimonioTotal(1) = PatrimonioTotal(1) + dinero
                PRINT
                PRINT "Usted posee un total de (U$D)"
                PRINT PatrimonioTotal(1);

                CALL WaitKey

                GOTO ahorroini


    CASE 4           'OPCION 4 - RETIRAR DEPOSITO EN DOLARES / TAKE DOLARS
    PRINT
    PRINT "Cuanto dinero en dolares desea retirar?"
    INPUT dinero
    totalsav = PatrimonioTotal(1)
    totalsav = totalsav - dinero

    IF totalsav < 0 THEN
    PRINT "Usted no tiene ese dinero."

    CALL WaitKey
    
    GOTO ahorroini
    END IF

    IF totalsav >= 0 THEN
    PRINT "Dinero retirado en U$D. Usted posee un total de: "
    PatrimonioTotal(1) = totalsav
    PRINT PatrimonioTotal(1);

    CALL WaitKey
    
    GOTO ahorroini       'vuelve al ahorroini / goes back to the beginning of the program.
    END IF


    CASE 5       'OPCION 5 - MOSTRAR AHORROS / SHOW SAVINGS DETAILS
    PRINT
    PRINT "Total de dinero en moneda local:   "; PatrimonioTotal(0)
    PRINT "Total de dinero en dolares:        "; PatrimonioTotal(1)
    PRINT
    PRINT "La taza de inter‚s es del "; tazadeinteres; "% "
    PRINT "Dinero tomado de la cuenta en moneda local:    "; prestamo
    PRINT "Dinero a colocar en la cuenta con intereses:   "; devolver

    CALL WaitKey

    GOTO ahorroini   'vuelve al ahorroini / goes back to the beginning of the program.

    CASE 6
    PRINT "Cual es el porcentaje que deber  ser agregado luego de un prestamo?"
    INPUT "Ingrese el n£mero deseado (10%, 15%, 20%)"; tazadeinteres


        CASE 7
                PRINT
                PRINT "Tienes certeza de que quieres eliminar TODOS los datos de AHORROS?"
                PRINT "[10] SI [11] NO"
                PRINT
                INPUT OPCION



                SELECT CASE OPCION

                'BORRA TODAS LAS VARIABLES DE AHORROS

                        CASE 10
                                totalsav = 0
                                dinero = 0
                                PatrimonioTotal(0) = 0
                                PatrimonioTotal(1) = 0
                                PatrimonioTotal(2) = 0
                                prestamo = 0
                                devolver = 0
                                interes = 0


                                PRINT
                                PRINT "- TODOS LOS DATOS DE AHORROS HAN SIDO REINICIADOS - "

                                CALL WaitKey
                                
                                GOTO ahorroini

                        CASE 11
                                PRINT
                                PRINT "- ACCION CANCELADA - "

                                CALL WaitKey
                                
                                GOTO ahorroini

                        CASE ELSE
                                PRINT
                                PRINT "- NO HAS COLOCADO NINGUNA DE LAS OPCIONES ANTERIORES - "
                                PRINT "           MODIFICACIONES NO REALIZADAS"

                                CALL WaitKey
                                
                                GOTO ahorroini
                END SELECT


        CASE 8  '============= Show Charts ===============

                CALL ShowChart
                CALL WaitKey
                GOTO ahorroini


        CASE 9
                CALL save      'Saves PROGRAM variables into the savings.bin file.
                CLS
                END            'After that, ENDS the program.

                

        'SI EL USUSARIO NO COLOCA UNA DE LAS OPCIONES CORRECTAS.
        'IF THE USER DOESN'T CHOOSE ONE OF THE GIVEN OPTIONS.

        CASE 60

        INPUT "How much is U$1 in Argentinean Pesos?"; DollarARS
        MicroPause
        GOTO ahorroini
        
        CASE ELSE

                PRINT "Ingrese una opcion correcta."

                CALL WaitKey
                
                'vuelve al ahorroini
                'goes back to the beginning of the program.

                GOTO ahorroini

        END SELECT


GOTO ahorroini

'====================== LOAD ======================
'LOADS SAVED variables FROM the savings.bin file.
'
SUB load

OPEN "savings.bin" FOR INPUT AS #1
INPUT #1, totalsav
INPUT #1, dinero
INPUT #1, PatrimonioTotal(0)
INPUT #1, PatrimonioTotal(1)
INPUT #1, PatrimonioTotal(2)
INPUT #1, prestamo
INPUT #1, interes
INPUT #1, devolver
INPUT #1, tazadeinteres
INPUT #1, DollarARS

CLOSE #1

PRINT "Loading..."
SLEEP 1

END SUB

SUB MicroPause

'This micro pause aims to produce some delay in specific loops
'and to be used in the animation of charts.

aloop = 0

DO UNTIL aloop = 800

        aloop = aloop + 1

LOOP

END SUB

' ================= SAVE ==========================
' Save PROGRAM variables into the savings.bin file.
'
SUB save

OPEN "savings.bin" FOR OUTPUT AS #1
WRITE #1, totalsav
WRITE #1, dinero
WRITE #1, PatrimonioTotal(0)
WRITE #1, PatrimonioTotal(1)
WRITE #1, PatrimonioTotal(2)
WRITE #1, prestamo
WRITE #1, interes
WRITE #1, devolver
WRITE #1, tazadeinteres
WRITE #1, DollarARS
CLOSE #1

PRINT "Saving..."
SLEEP 1

END SUB

SUB ShowChart

'================= PRINTING CHART TEXT & INFORMATION ========================

ARSChangeUSD = PatrimonioTotal(0) / DollarARS

COLOR 2, 0
CLS
LOCATE 4, 1
PRINT "U$D"; PatrimonioTotal(1)

COLOR 15

LOCATE 2, 50
PRINT "1 U$D = AR$"; DollarARS


LOCATE 4, 50
PRINT "AR$"; PatrimonioTotal(0); "[U$"; ARSChangeUSD; "]"

COLOR 7, 0
LOCATE 8, 1
PRINT "AR$"; PatrimonioTotal(0)


'============================================================================

scale = 0
COLOR 2, 0

IF PatrimonioTotal(1) > 0 THEN
valor = PatrimonioTotal(1)
scale = 1
END IF

IF PatrimonioTotal(1) > 10 THEN
valor = PatrimonioTotal(1) / 10
scale = 2
END IF

IF PatrimonioTotal(1) > 100 THEN
valor = PatrimonioTotal(1) / 100
scale = 3
END IF

IF PatrimonioTotal(1) > 1000 THEN
valor = PatrimonioTotal(1) / 1000
scale = 4
END IF

IF PatrimonioTotal(1) > 10000 THEN
valor = PatrimonioTotal(1) / 10000
scale = 5
END IF

IF PatrimonioTotal(1) > 100000 THEN
valor = PatrimonioTotal(1) / 100000
scale = 6
END IF

IF PatrimonioTotal(1) > 1000000 THEN
valor = PatrimonioTotal(1) / 1000000
scale = 7
END IF

'PRINT valor
xloop = 1

'========================== Prints U$D CHART

DO UNTIL xloop = (valor * scale) + 1

        LOCATE 6, xloop
        PRINT "°"
        xloop = xloop + 1
        CALL MicroPause

LOOP

'========================================================================
'========================================================================
'========================================================================

scale = 0
COLOR 7, 0

IF PatrimonioTotal(0) > 0 THEN
valor = PatrimonioTotal(0)
scale = 1
END IF

IF PatrimonioTotal(0) > 10 THEN
valor = PatrimonioTotal(0) / 10
scale = 2
END IF

IF PatrimonioTotal(0) > 100 THEN
valor = PatrimonioTotal(0) / 100
scale = 3
END IF

IF PatrimonioTotal(0) > 1000 THEN
valor = PatrimonioTotal(0) / 1000
scale = 4
END IF

IF PatrimonioTotal(0) > 10000 THEN
valor = PatrimonioTotal(0) / 10000
scale = 5
END IF

IF PatrimonioTotal(0) > 100000 THEN
valor = PatrimonioTotal(0) / 100000
scale = 6
END IF

IF PatrimonioTotal(0) > 1000000 THEN
valor = PatrimonioTotal(0) / 1000000
scale = 7
END IF

'PRINT valor
xloop = 1

'========================== Prints U$D CHART


DO UNTIL xloop = (valor * scale) + 1

        LOCATE 10, xloop
        PRINT "°"
        xloop = xloop + 1
        CALL MicroPause

LOOP


END SUB

SUB WaitKey

DO WHILE INKEY$ = ""
LOOP

END SUB

