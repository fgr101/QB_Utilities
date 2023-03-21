DECLARE SUB SubMenu2 ()
DECLARE SUB SubMenu1 ()
DECLARE SUB Help ()
DECLARE SUB SubMenu ()
DECLARE SUB WaitKey ()
DECLARE SUB MicroPause ()
DECLARE SUB ShowChart ()
DECLARE SUB Load ()
DECLARE SUB Save ()

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


DIM SHARED PatrimonioTotal(0 TO 3) AS SINGLE
DIM SHARED dinero AS SINGLE
DIM SHARED totalsav AS SINGLE

DIM SHARED prestamo AS SINGLE
DIM SHARED interes AS SINGLE
DIM SHARED DollarARS AS SINGLE
DIM SHARED DollarREAIS AS SINGLE
DIM SHARED ARSChangeUSD AS SINGLE
DIM SHARED REAISChangeUSD AS SINGLE
DIM SHARED TotalDollars AS SINGLE


DIM SHARED devolver AS SINGLE
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
CALL Load

CALL ShowChart        '============================================ CHARTS
CALL WaitKey


IF DollarARS = 0 THEN  '========== NO SE PUEDE DIVIDIR POR CERO! ============
DollarARS = 1
PRINT "Not possible to divide a number by ZERO."
END IF

IF DollarREAIS = 0 THEN
DollarREAIS = 1
PRINT "Not possible to divide a number by ZERO."
END IF

'This is the beginning of the program.

ahorroini:
CLS

     COLOR 7
     LOCATE 1, 46
     PRINT "Deposits: $"; PatrimonioTotal(0); "| U$"; PatrimonioTotal(1); "| R$"; PatrimonioTotal(3)
     LOCATE 2, 46
     PRINT "A reponer: $"; devolver; "(+"; tazadeinteres; "%)"


     COLOR 15, 5
     LOCATE 1, 1
     PRINT "           Savings Control V0.5            "
     PRINT
     
     COLOR 0, 7

     PRINT "                                           "
     PRINT " 1- Deposit money  ($)                     "
     PRINT " 2- Withdraw money ($)                     "
     PRINT " 3- Savings Report                         "
     PRINT " 4- Show Charts                            "
     PRINT " 10- Exchange Rates [ARS|BRL]              "
     PRINT " 6- Change % interest rates                "
     PRINT " 7- Reset Data                             "
     PRINT " 11- Help                                  "
     PRINT "                                           "
     PRINT " 9- Exit                                   "
     PRINT "                                           "

     PRINT
     COLOR 3, 0
     INPUT OPCION

SELECT CASE OPCION    '//Las diferentes opciones. The different options.

        CASE 1: 'OPCION 1 - AGREGAR DINERO // DEPOSIT MONEY

                SubMenu1
                
        CASE 2  'OPCION 2 - TOMAR DINERO // WITHDRAW MONEY

                SubMenu2
        
        CASE 3  'OPCION 3 - MOSTRAR AHORROS / SHOW SAVINGS DETAILS

                PRINT
                PRINT "Total de dinero en moneda local:   "; PatrimonioTotal(0)
                PRINT "Total de dinero en dolares:        "; PatrimonioTotal(1)
                PRINT
                PRINT "La taza de inter‚s es del "; tazadeinteres; "% "
                PRINT "Dinero tomado de la cuenta en moneda local:    "; prestamo
                PRINT "Dinero a colocar en la cuenta con intereses:   "; devolver

                WaitKey

                GOTO ahorroini   'vuelve al ahorroini / goes back to the beginning of the program.

        CASE 4  'OPCION 4 ============= Show Charts ===============

                ShowChart
                WaitKey
                GOTO ahorroini


        CASE 6
                PRINT "Cual es el porcentaje que deber  ser agregado luego de un prestamo?"
                INPUT "Ingrese el n£mero deseado (10%, 15%, 20%)"; tazadeinteres


        CASE 7

                PRINT
                PRINT "Are you sure you want to erase all SAVINGS DATA?"
                PRINT "[10] YES [11] NO"
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
                                PatrimonioTotal(3) = 0
                                prestamo = 0
                                devolver = 0
                                interes = 0


                                PRINT
                                PRINT "- All data has been deleted - "

                                CALL WaitKey
                                
                                GOTO ahorroini

                        CASE 11
                                PRINT
                                PRINT "- Action cancelled - "

                                CALL WaitKey
                                
                                GOTO ahorroini

                        CASE ELSE
                                PRINT
                                PRINT "- You have not chosen any possible option -"
                                PRINT "       Action has been cancelled"

                                CALL WaitKey
                                
                                GOTO ahorroini
                END SELECT


        CASE 9
                CALL Save      'Saves PROGRAM variables into the savings.bin file.
                CLS
                END            'After that, ENDS the program.

                

        'SI EL USUSARIO NO COLOCA UNA DE LAS OPCIONES CORRECTAS.
        'IF THE USER DOESN'T CHOOSE ONE OF THE GIVEN OPTIONS.

        CASE 10 '------------------- CHANGE RATE SUB MENU

        SubMenu
        GOTO ahorroini

        CASE 11

               Help

        CASE ELSE

                'No hace nada y vuelve al ahorroini
                'goes back to the beginning of the program.
                
        END SELECT


GOTO ahorroini

SUB Help

CLS

PRINT "ARS | AR$ = Argentinean Pesos   "
MicroPause
PRINT "BRL | R$  = Brazillian Reals    "
MicroPause
PRINT "USD | U$  = United States Dollar"
MicroPause

PRINT
PRINT "Currency Exchange Rates"
MicroPause
PRINT "======================="
MicroPause
PRINT

PRINT "Currency exchange rates refer to the value of one currency compared"
MicroPause
PRINT "to another currency. These rates determine how much of one currency"
MicroPause
PRINT "you can exchange for another currency. Exchange rates are determined"
MicroPause
PRINT "by various factors such as the supply and demand of currencies, political"
MicroPause
PRINT "and economic factors, and central bank policies. Currency exchange rates"
MicroPause
PRINT "can fluctuate frequently, sometimes even within minutes, and impact"
MicroPause
PRINT "international trade, investments, and travel."
PRINT

WaitKey

PRINT "Saving Data"
PRINT "============="
PRINT

PRINT "You don't need to worry about saving and loading data. Every time you exit"
MicroPause
PRINT "the program, all data and variables are automatically saved. They will also"
MicroPause
PRINT "be loaded automatically for you when you run the program again."

PRINT
PRINT "If you ever need to erase and reset all the variables stored in the"
MicroPause
PRINT "computer's memory and all the data stored, you can do so by using the"
MicroPause
PRINT "option 'Reset Data'."

WaitKey

END SUB

'====================== LOAD ======================
'LOADS SAVED variables FROM the savings.bin file.
'
SUB Load

OPEN "savings.bin" FOR INPUT AS #1
INPUT #1, totalsav
INPUT #1, dinero
INPUT #1, PatrimonioTotal(0)
INPUT #1, PatrimonioTotal(1)
INPUT #1, PatrimonioTotal(2)
INPUT #1, PatrimonioTotal(3)
INPUT #1, prestamo
INPUT #1, interes
INPUT #1, devolver
INPUT #1, tazadeinteres
INPUT #1, DollarARS
INPUT #1, DollarREAIS

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

SUB NOTES

'TO DO

' * ORGANIZE THE MAIN MENU BETTER
' * FINISH TRANSLATING INTO ENGLISH

'================================================================

' DONE

' * ADD ANIMATED CHART FOR SAVINGS IN REAL CURRENCY (BR CURRENCY)


END SUB

' ================= SAVE ==========================
' Save PROGRAM variables into the savings.bin file.
'
SUB Save

OPEN "savings.bin" FOR OUTPUT AS #1
WRITE #1, totalsav
WRITE #1, dinero
WRITE #1, PatrimonioTotal(0) 'LOCAL CURRENCY
WRITE #1, PatrimonioTotal(1) 'DOLLARS
WRITE #1, PatrimonioTotal(2)
WRITE #1, PatrimonioTotal(3) 'REALS
WRITE #1, prestamo
WRITE #1, interes
WRITE #1, devolver
WRITE #1, tazadeinteres
WRITE #1, DollarARS
WRITE #1, DollarREAIS
CLOSE #1

PRINT "Saving..."
SLEEP 1

END SUB

SUB ShowChart

'================= PRINTING CHART TEXT & INFORMATION ========================

ARSChangeUSD = PatrimonioTotal(0) / DollarARS
REAISChangeUSD = PatrimonioTotal(3) / DollarREAIS

CLS
COLOR 15

LOCATE 4, 43
PRINT "1 U$D = AR$"; DollarARS; "| R$"; DollarREAIS

CALL MicroPause

LOCATE 6, 43
PRINT "U$"; PatrimonioTotal(1); "[U$"; PatrimonioTotal(1); "]"

CALL MicroPause

LOCATE 8, 43
PRINT "AR$"; PatrimonioTotal(0); "[U$"; ARSChangeUSD; "]"

CALL MicroPause

LOCATE 10, 43
PRINT "R$"; PatrimonioTotal(3); "[U$"; REAISChangeUSD; "]"

CALL MicroPause

TotalDollars = PatrimonioTotal(1) + ARSChangeUSD + REAISChangeUSD

CALL MicroPause

LOCATE 12, 43

PRINT "TOTAL in US Dollars = U$D"; TotalDollars

CALL MicroPause

'============================================================================
'Text that goes along the charts to express quantity.


COLOR 2, 0
LOCATE 4, 1
PRINT "USD $"; PatrimonioTotal(1)

COLOR 14, 0
LOCATE 8, 1
PRINT "BRL $"; PatrimonioTotal(3)

COLOR 9, 0
LOCATE 12, 1
PRINT "ARS $"; PatrimonioTotal(0)

'============================================================================

COLOR 2, 0
scale = 0

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

'========================== Prints U$D CHART

xloop = 1

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
COLOR 14, 0

IF PatrimonioTotal(3) > 0 THEN
valor = PatrimonioTotal(3)
scale = 1
END IF

IF PatrimonioTotal(3) > 10 THEN
valor = PatrimonioTotal(3) / 10
scale = 2
END IF

IF PatrimonioTotal(3) > 100 THEN
valor = PatrimonioTotal(3) / 100
scale = 3
END IF

IF PatrimonioTotal(3) > 1000 THEN
valor = PatrimonioTotal(3) / 1000
scale = 4
END IF

IF PatrimonioTotal(3) > 10000 THEN
valor = PatrimonioTotal(3) / 10000
scale = 5
END IF

IF PatrimonioTotal(3) > 100000 THEN
valor = PatrimonioTotal(3) / 100000
scale = 6
END IF

IF PatrimonioTotal(3) > 1000000 THEN
valor = PatrimonioTotal(3) / 1000000
scale = 7
END IF

xloop = 1

'========================== Prints BRL CHART [R$]


DO UNTIL xloop = (valor * scale) + 1

        LOCATE 10, xloop
        PRINT "°"
        xloop = xloop + 1
        CALL MicroPause

LOOP

'========================================================================
'========================================================================
'========================================================================

scale = 0
COLOR 9, 0

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

xloop = 1

'========================== Prints U$D CHART


DO UNTIL xloop = (valor * scale) + 1

        LOCATE 14, xloop
        PRINT "°"
        xloop = xloop + 1
        CALL MicroPause

LOOP


END SUB

SUB SubMenu

SubMenu:

     CLS

     COLOR 15, 5
     LOCATE 1, 1
     PRINT "           Savings Control V0.5            "
     PRINT

     COLOR 0, 7

     PRINT "                                           "
     PRINT " 1- Dollar --> ARS [AR$] - Exchange Rate   "
     PRINT " 2- Dollar --> BRL [R$]  - Exchange Rate   "
     PRINT "                                           "
     PRINT " 9- Go back                                "
     PRINT "                                           "

     PRINT
     COLOR 3, 0
     INPUT OPCION

SELECT CASE OPCION

        CASE 1

        INPUT "How much is 1 USD (U$1) in ARS?"; DollarARS
        MicroPause

        COLOR 15

        LOCATE 3, 46
        PRINT "1 U$D is equal to"; DollarARS; "AR$ now."
        LOCATE 4, 46
        PRINT "Currency values updated."
        WaitKey

        GOTO SubMenu

        CASE 2

        INPUT "How much is 1 USD (U$1) in BRL (R$)?"; DollarREAIS
        MicroPause

        LOCATE 3, 46
        PRINT "1 USD is equal to"; DollarREAIS; "BRL now."
        LOCATE 4, 46
        PRINT "Currency values updated."
        WaitKey


        GOTO SubMenu
        
        CASE 9
        GOTO EndSubMenu

        CASE ELSE

        GOTO SubMenu

END SELECT

EndSubMenu:
END SUB

SUB SubMenu1

SubMenu1:

     CLS

     COLOR 15, 5
     LOCATE 1, 1
     PRINT "           Savings Control V0.5            "
     PRINT

     COLOR 0, 7

     PRINT "                                           "
     PRINT " 1- Deposit money in local currency (ARS)  "
     PRINT " 2- Deposit money in US dollar      (USD)  "
     PRINT " 3- Deposit money in BR Reais       (BRL)  "
     PRINT "                                           "
     PRINT " 9- Go Back                                "
     PRINT "                                           "


     PRINT
     COLOR 3, 0
     INPUT OPCION


SELECT CASE OPCION
        
        CASE 1 'AGREGAR DEPOSITO EN MONEDA LOCAL / ADD LOCAL CURRENCY

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
                GOTO SubMenu1        'vuelve al ahorroini // goes back to the beginning of the program.
        
        CASE 2 'AGREGAR DEPOSITO EN DOLARES / ADD DOLARS

                PRINT
                PRINT "How many dollars to add?"
                INPUT dinero
                PatrimonioTotal(1) = PatrimonioTotal(1) + dinero
                PRINT
                PRINT "Usted posee un total de (U$D)"
                PRINT PatrimonioTotal(1);

                CALL WaitKey

                GOTO SubMenu1
        
        CASE 3 'AGREGAR DEPOSITO EN REALES / ADD REALS

                PRINT
                PRINT "How many Reals to add?"
                INPUT dinero
                PatrimonioTotal(3) = PatrimonioTotal(3) + dinero
                PRINT
                PRINT "Usted posee un total de (R$)"
                PRINT PatrimonioTotal(3);

                CALL WaitKey

                GOTO SubMenu1

        CASE 9
                GOTO EndSubMenu1
                CASE ELSE
                GOTO SubMenu1

END SELECT

EndSubMenu1:
END SUB

SUB SubMenu2  'OPCION 2 - RETIRAR DINERO // WITHDRAW MONEY

SubMenu2A:

CLS

COLOR 15, 5
LOCATE 1, 1
PRINT "           Savings Control V0.5            "
PRINT

COLOR 0, 7
     
PRINT "                                           "
PRINT " 1- Withdraw money in local currency (ARS) "
PRINT " 2- Withdraw money in BR Reais       (BRL) "
PRINT " 3- Withdraw money in US dollar      (USD) "

PRINT "                                           "
PRINT " 9- Go Back                                "
PRINT "                                           "

     PRINT
     COLOR 3, 0
     INPUT OPCION


SELECT CASE OPCION

        CASE 1  'OPCION 1 - RETIRAR DEPOSITO EN PESOS / TAKE ARS

                PRINT
                PRINT "How much money to withdraw?"
                INPUT dinero
                totalsav = PatrimonioTotal(0)
                totalsav = totalsav - dinero

                IF totalsav < 0 THEN

                        PRINT "You don't have that money."
                        WaitKey
                        GOTO EndSubMenu2A

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

                        WaitKey

                        'Vuelve al ahorroini.
                        'Goes back to the beginning of the program.

                        GOTO EndSubMenu2A

                END IF


        CASE 2  'OPCION 2 - RETIRAR DEPOSITO EN REALES / TAKE BRL
        
                PRINT
                PRINT "Cuanto dinero en reales desea retirar?"
                INPUT dinero
                totalsav = PatrimonioTotal(3)
                totalsav = totalsav - dinero

                IF totalsav < 0 THEN

                        PRINT "Usted no tiene ese dinero."
                        WaitKey
                        GOTO EndSubMenu2A

                END IF

                IF totalsav >= 0 THEN

                        PRINT "Dinero retirado en R$. Usted posee un total de: "
                        PatrimonioTotal(3) = totalsav
                        PRINT PatrimonioTotal(3);
                        CALL WaitKey

                        'Vuelve al ahorroini.
                        'Goes back to the beginning of the program.

                        GOTO EndSubMenu2A

                END IF

        CASE 3  'OPCION 3 - RETIRAR DEPOSITO EN DOLARES / TAKE USD

                PRINT
                PRINT "Cuanto dinero en dolares desea retirar?"
                INPUT dinero
                totalsav = PatrimonioTotal(1)
                totalsav = totalsav - dinero

                IF totalsav < 0 THEN

                        PRINT "Usted no tiene ese dinero."
                        WaitKey
                        GOTO EndSubMenu2A

                END IF

                IF totalsav >= 0 THEN

                        PRINT "Dinero retirado en U$D. Usted posee un total de: "
                        PatrimonioTotal(1) = totalsav
                        PRINT PatrimonioTotal(1);
                        WaitKey

                        'Vuelve al ahorroini.
                        'Goes back to the beginning of the program.

                        GOTO EndSubMenu2A

                END IF


        CASE 9

                GOTO EndSubMenu2A

        CASE ELSE

                GOTO SubMenu2A

END SELECT

EndSubMenu2A:
END SUB

SUB WaitKey

DO WHILE INKEY$ = ""
LOOP

END SUB

