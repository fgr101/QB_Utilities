DECLARE SUB LoadData ()
DECLARE SUB Save ()
DECLARE SUB CreateFile ()

DIM SHARED task1$   'DIM SHARED FOR GLOBAL VARIABLES
DIM SHARED task2$
DIM SHARED task3$
DIM SHARED task4$
DIM SHARED task5$

DIM SHARED task1icon$
DIM SHARED task2icon$
DIM SHARED task3icon$
DIM SHARED task4icon$
DIM SHARED task5icon$

DIM SHARED icon1
DIM SHARED icon2
DIM SHARED icon3
DIM SHARED icon4
DIM SHARED icon5
DIM SHARED icon6

DIM SHARED menuitem

menuitem = 1
task1$ = "                                                                              "
task2$ = "                                                                              "
task3$ = "                                                                              "
task4$ = "                                                                              "
task5$ = "                                                                              "

icon1 = 6
task1icon$ = ""
icon2 = 6
task2icon$ = ""
icon3 = 6
task3icon$ = ""
icon4 = 6
task4icon$ = ""
icon5 = 6
task5icon$ = ""

CLS
CALL CreateFile
CALL LoadData

inicio:

IF menuitem < 1 THEN
menuitem = 5
END IF
IF menuitem > 5 THEN
menuitem = 1
END IF

CLS


COLOR 2, 6
PRINT "                      TASK v 0.1 | TO DO LIST | 2022                            "
COLOR 15, 1
LOCATE 2, 1
PRINT "[ESC] EXIT"
LOCATE 2, 12
PRINT "[F1] TAGS"


COLOR 7, 0

PRINT



'MEJORAR, HACER ESTE PROCESO POR MEDIO DE UN LOOP.

IF menuitem = 1 THEN
COLOR 7, 3
END IF

SELECT CASE icon1
CASE 1
COLOR 15
CASE 2
COLOR 10
CASE 3
COLOR 14
CASE 4
COLOR 12
CASE 5
COLOR 4
CASE 6
COLOR 7
END SELECT

PRINT "- " + task1$ + task1icon$
COLOR 7, 0

IF menuitem = 2 THEN
COLOR 7, 3
END IF

SELECT CASE icon2
CASE 1
COLOR 15
CASE 2
COLOR 10
CASE 3
COLOR 14
CASE 4
COLOR 12
CASE 5
COLOR 4
CASE 6
COLOR 7
END SELECT

PRINT "- " + task2$ + task2icon$
COLOR 7, 0

IF menuitem = 3 THEN
COLOR 7, 3
END IF

SELECT CASE icon3
CASE 1
COLOR 15
CASE 2
COLOR 10
CASE 3
COLOR 14
CASE 4
COLOR 12
CASE 5
COLOR 4
CASE 6
COLOR 7
END SELECT

PRINT "- " + task3$ + task3icon$
COLOR 7, 0

IF menuitem = 4 THEN
COLOR 7, 3
END IF

SELECT CASE icon4
CASE 1
COLOR 15
CASE 2
COLOR 10
CASE 3
COLOR 14
CASE 4
COLOR 12
CASE 5
COLOR 4
CASE 6
COLOR 7
END SELECT

PRINT "- " + task4$ + task4icon$
COLOR 7, 0

IF menuitem = 5 THEN
COLOR 7, 3
END IF

SELECT CASE icon5
CASE 1
COLOR 15
CASE 2
COLOR 10
CASE 3
COLOR 14
CASE 4
COLOR 12
CASE 5
COLOR 4
CASE 6
COLOR 7
END SELECT

PRINT "- " + task5$ + task5icon$
COLOR 7, 0
          
DO

SELECT CASE INKEY$

        CASE CHR$(27)
        CALL Save
        END

        CASE CHR$(0) + CHR$(80)
        menuitem = menuitem + 1
        GOTO inicio

        CASE CHR$(0) + CHR$(72)
        menuitem = menuitem - 1
        GOTO inicio

        CASE CHR$(0) + CHR$(59)

                SELECT CASE menuitem

                CASE 1
                
                icon1 = icon1 + 1
                IF icon1 > 6 THEN
                icon1 = 1
                END IF

                IF icon1 = 1 THEN
                task1icon$ = " - TO DO"
                END IF

                IF icon1 = 2 THEN
                task1icon$ = " - DONE"
                END IF

                IF icon1 = 3 THEN
                task1icon$ = " - ASAP"
                END IF

                IF icon1 = 4 THEN
                task1icon$ = " - DELAYED"
                END IF

                IF icon1 = 5 THEN
                task1icon$ = " - URGENT"
                END IF

                IF icon1 = 6 THEN
                task1icon$ = ""
                END IF

                GOTO inicio

                CASE 2

                icon2 = icon2 + 1
                IF icon2 > 6 THEN
                icon2 = 1
                END IF

                IF icon2 = 1 THEN
                task2icon$ = " - TO DO"
                END IF

                IF icon2 = 2 THEN
                task2icon$ = " - DONE"
                END IF

                IF icon2 = 3 THEN
                task2icon$ = " - ASAP"
                END IF

                IF icon2 = 4 THEN
                task2icon$ = " - DELAYED"
                END IF

                IF icon2 = 5 THEN
                task2icon$ = " - URGENT"
                END IF

                IF icon2 = 6 THEN
                task2icon$ = ""
                END IF
                
                GOTO inicio
                
                CASE 3

                icon3 = icon3 + 1
                IF icon3 > 6 THEN
                icon3 = 1
                END IF

                IF icon3 = 1 THEN
                task3icon$ = " - TO DO"
                END IF

                IF icon3 = 2 THEN
                task3icon$ = " - DONE"
                END IF

                IF icon3 = 3 THEN
                task3icon$ = " - ASAP"
                END IF

                IF icon3 = 4 THEN
                task3icon$ = " - DELAYED "
                END IF

                IF icon3 = 5 THEN
                task3icon$ = " - URGENT"
                END IF

                IF icon3 = 6 THEN
                task3icon$ = ""
                END IF

                GOTO inicio

                CASE 4

                icon4 = icon4 + 1
                IF icon4 > 6 THEN
                icon4 = 1
                END IF

                IF icon4 = 1 THEN
                task4icon$ = " - TO DO"
                END IF

                IF icon4 = 2 THEN
                task4icon$ = " - DONE"
                END IF

                IF icon4 = 3 THEN
                task4icon$ = " - ASAP"
                END IF

                IF icon4 = 4 THEN
                task4icon$ = " - DELAYED "
                END IF

                IF icon4 = 5 THEN
                task4icon$ = " - URGENT"
                END IF

                IF icon4 = 6 THEN
                task4icon$ = ""
                END IF

                GOTO inicio
                
                CASE 5

                icon5 = icon5 + 1
                IF icon5 > 6 THEN
                icon5 = 1
                END IF

                IF icon5 = 1 THEN
                task5icon$ = " - TO DO"
                END IF

                IF icon5 = 2 THEN
                task5icon$ = " - DONE"
                END IF

                IF icon5 = 3 THEN
                task5icon$ = " - ASAP"
                END IF

                IF icon5 = 4 THEN
                task5icon$ = " - DELAYED "
                END IF

                IF icon5 = 5 THEN
                task5icon$ = " - URGENT"
                END IF

                IF icon5 = 6 THEN
                task5icon$ = ""
                END IF

                GOTO inicio

                END SELECT

        CASE CHR$(13)

        SELECT CASE menuitem

                CASE 1
                LOCATE 4, 1
                COLOR 7, 3
                INPUT "- ", task1$
                COLOR 4, 0
                GOTO inicio

                CASE 2
                LOCATE 5, 1
                COLOR 7, 3
                INPUT "- ", task2$
                COLOR 4, 0
                GOTO inicio

                CASE 3
                LOCATE 6, 1
                COLOR 7, 3
                INPUT "- ", task3$
                COLOR 4, 0
                GOTO inicio

                CASE 4
                LOCATE 7, 1
                COLOR 7, 3
                INPUT "- ", task4$
                COLOR 4, 0
                GOTO inicio

                CASE 5
                LOCATE 8, 1
                COLOR 7, 3
                INPUT "- ", task5$
                COLOR 4, 0
                GOTO inicio


        END SELECT

END SELECT

LOOP

SUB CreateFile

'FILE SYSTEM
'Checking FILES +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
'If FILES don't exist the program creates them. ++++++++++++++=++++++++++++++

OPEN "tasks.bin" FOR BINARY AS #1
IF LOF(1) = 0 THEN
CLOSE #1
OPEN "tasks.bin" FOR OUTPUT AS #1
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

CLS
LOCATE 11, 30
PRINT "tasks.bin File created."

END IF
CLOSE #1
SLEEP 2

END SUB

SUB LoadData

COLOR 7, 0
LOCATE 12, 24
PRINT "Loading saved data from tasks.bin."
SLEEP 1

OPEN "tasks.bin" FOR INPUT AS #1

INPUT #1, task1$
INPUT #1, task2$
INPUT #1, task3$
INPUT #1, task4$
INPUT #1, task5$

INPUT #1, task1icon$
INPUT #1, task2icon$
INPUT #1, task3icon$
INPUT #1, task4icon$
INPUT #1, task5icon$

INPUT #1, icon1
INPUT #1, icon2
INPUT #1, icon3
INPUT #1, icon4
INPUT #1, icon5
INPUT #1, icon6

CLOSE #1


END SUB

SUB Notes

' Que se puedan marcar las tareas realizadas como COMPLETADAS.


END SUB

'========================== SAVES DATA ==========================
 SUB Save

OPEN "tasks.bin" FOR OUTPUT AS #1

WRITE #1, task1$
WRITE #1, task2$
WRITE #1, task3$
WRITE #1, task4$
WRITE #1, task5$

WRITE #1, task1icon$
WRITE #1, task2icon$
WRITE #1, task3icon$
WRITE #1, task4icon$
WRITE #1, task5icon$

WRITE #1, icon1
WRITE #1, icon2
WRITE #1, icon3
WRITE #1, icon4
WRITE #1, icon5
WRITE #1, icon6


LOCATE 12, 29
COLOR 7, 0
PRINT "Data saved in tasks.bin."
SLEEP 1
CLOSE #1
END SUB

