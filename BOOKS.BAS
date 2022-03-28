' BOOKS 0.2: The utility of this program is to help you keep a record of all the
' books you've read along the years. So far you can add some information
' and details together with the names of the books you add, for instance
' author and genre. This small piece of software is under development.

' Developed by Fernando Gaston Ramirez in 2022 on Qbasic 7.1. Brazil.

DECLARE SUB ResetFile ()
DECLARE SUB save ()
DECLARE SUB load ()
DECLARE SUB showbooks ()
DECLARE SUB addbook ()
DECLARE SUB About ()

'========================== VARIABLES ==========================


DIM SHARED booknumber, name$(100), author$(100), genre$(100), rating(100), daydate$(100)

MENUITEM = 1

' DIM SHARED turns local variables into GLOBAL VARIABLES, that way they can
' be also usable in SUB routines and FUNCTIONS.

booknumber = 0

CALL load

'========================== MAIN MENU ==========================

inicio:


IF MENUITEM > 5 THEN
MENUITEM = 1
END IF

IF MENUITEM < 1 THEN
MENUITEM = 5
END IF


CLS
PRINT
COLOR 4, 7
LOCATE , 28
PRINT "      Books V0.2      "
COLOR 7, 1
LOCATE , 28
PRINT "  FGR Software 2022   "
COLOR 2, 1
LOCATE , 28
PRINT " By: Fernando Ramirez "
PRINT
COLOR 7

LOCATE , 25
PRINT "                            "

IF MENUITEM = 1 THEN
COLOR 0, 7
END IF

LOCATE , 25
PRINT "   1) Add Finished Book     "
COLOR 7, 1

IF MENUITEM = 2 THEN
COLOR 0, 7
END IF

LOCATE , 25
PRINT "   2) Show All Read Books   "
COLOR 7, 1

IF MENUITEM = 3 THEN
COLOR 0, 7
END IF

LOCATE , 25
PRINT "   3) Erase all data        "
COLOR 7, 1

IF MENUITEM = 4 THEN
COLOR 0, 7
END IF

LOCATE , 25
PRINT "   4) About Books           "
COLOR 7, 1

LOCATE , 25
PRINT "                            "

IF MENUITEM = 5 THEN
COLOR 0, 7
END IF

LOCATE , 25
PRINT "   10) Exit                 "
COLOR 7, 1

LOCATE , 25
PRINT "                            "
PRINT

' LOOP FOR KEYS RECOGNITION
' SELECT CASE + INKEY$ FOR A FASTER REACTION.
' MUCH BETTER AND FASTER THAN IF...THEN.


COLOR , 0

DO
SELECT CASE INKEY$

        CASE CHR$(0) + CHR$(72)
        MENUITEM = MENUITEM - 1
        GOTO inicio

        CASE CHR$(0) + CHR$(80)
        MENUITEM = MENUITEM + 1
        GOTO inicio
        
        CASE CHR$(27)
        END

        CASE CHR$(13)

        SELECT CASE MENUITEM

                CASE 1
                CALL addbook
                GOTO inicio

                CASE 2
                CALL showbooks
                GOTO inicio
              
                CASE 3
                CALL ResetFile
                GOTO inicio

                CASE 4
                CALL About
                GOTO inicio

                CASE 5
                CALL save
                END

        END SELECT

END SELECT
LOOP

GOTO inicio

SUB About
CLS
PRINT
PRINT "BOOKS: The utility of this program is to help you keep a record of all the"
PRINT "books you've read along the years. So far you can add some information"
PRINT "and details together with the names of the books you add, for instance"
PRINT "author, genre and rating. The date will be added automatically too. This"
PRINT "small piece of software is under development."
PRINT
PRINT "Developed by Fernando Gaston Ramirez in 2022 on Qbasic 7.1. Brazil."
PRINT "[Last Update: 0.2 version - March, 2022]"
PRINT ""

DO WHILE INKEY$ = ""
LOOP

END SUB

SUB addbook

'========================== ADD BOOK ==========================
CLS
COLOR 15
LOCATE 3, 1
INPUT "Book's name: ", name$(booknumber)
INPUT "Author:", author$(booknumber)
INPUT "Genre:", genre$(booknumber)
daydate$(booknumber) = DATE$


rating:
INPUT "Rating from 1 to 5:", rating(booknumber)

        IF rating(booknumber) < 0 OR rating(booknumber) > 5 THEN
        COLOR 4
        PRINT "The number must be between 0 and 5."
        COLOR 15
        GOTO rating
        END IF

booknumber = booknumber + 1
SLEEP 2
END SUB

SUB load

'Checking FILES +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
'If FILES don't exist the program creates them. ++++++++++++++++++++++++++++

OPEN "books.dat" FOR BINARY AS #1
IF LOF(1) = 0 THEN
CLOSE #1

OPEN "books.dat" FOR OUTPUT AS #1

loopx = 0
DO UNTIL loopx = 600
WRITE #1, ""
loopx = loopx + 1
LOOP

CLS
PRINT "books.dat file created..."
SLEEP 2

END IF
CLOSE #1


OPEN "books.dat" FOR INPUT AS #1

loopx = 0

INPUT #1, booknumber

DO UNTIL loopx = 100
INPUT #1, name$(loopx)
INPUT #1, author$(loopx)
INPUT #1, genre$(loopx)
INPUT #1, rating(loopx)
INPUT #1, daydate$(loopx)
loopx = loopx + 1
LOOP

CLOSE #1
END SUB

SUB NOTES

'THINGS TO DO & IMPROVE




'===============================================

'ALREADY DONE

'[v 0.2 - March 2022]

' - DATE added to the books details
' - ARE YOU SURE? - question added when trying to delete records
' - Add and improve the MAIN MENU.
' - Add RATINGS from 1 to 5 for books

END SUB

SUB ResetFile

'========================== RESET DATA IN FILE ==========================

LOCATE , 25
INPUT "Are you sure? (Y/N)"; election$

IF election$ = "y" THEN
election$ = "Y"
END IF

SELECT CASE election$

        CASE "Y"
        loopx = 0
        DO UNTIL loopx = 100
        name$(loopx) = ""
        author$(loopx) = ""
        genre$(loopx) = ""
        rating(loopx) = 0
        daydate$(loopx) = ""
        loopx = loopx + 1
        LOOP

        booknumber = 0

        LOCATE , 25
        PRINT "Data stored in books.dat has been erased..."
        SLEEP 2
        GOTO endreset

        CASE ELSE
        LOCATE , 25
        PRINT "Operation cancelled."
        LOCATE , 25
        PRINT "Data is still stored in books.dat."
        SLEEP 2

END SELECT

endreset:
END SUB

SUB save

'========================== SAVES DATA ==========================

OPEN "books.dat" FOR OUTPUT AS #1

WRITE #1, booknumber

loopx = 0
DO UNTIL loopx = 100
WRITE #1, name$(loopx)
WRITE #1, author$(loopx)
WRITE #1, genre$(loopx)
WRITE #1, rating(loopx)
WRITE #1, daydate$(loopx)
loopx = loopx + 1
LOOP

LOCATE , 25
PRINT "Data saved in books.dat..."
SLEEP 2
CLOSE #1
END SUB

SUB showbooks

'========================== SHOW BOOKS ==========================

CLS
COLOR 15
PRINT

IF booknumber = 0 THEN
COLOR 15
LOCATE 5, 18
PRINT "Add some books you have read to the list first."
LOCATE 6, 18
PRINT "There's nothing to show here. The list is empty."

GOTO endofsub

END IF


'============================ PAGE 1 ============================

loopx = 0

DO UNTIL loopx = booknumber

PRINT " | " + name$(loopx) + " | Author: " + author$(loopx) + " | Rating: "; rating(loopx); " | Date: "; daydate$(loopx)
loopx = loopx + 1

        IF loopx = 23 THEN
        GOTO page2
        END IF

LOOP





'============================ PAGE 2 ============================

page2:

IF loopx = 23 THEN

DO WHILE INKEY$ = ""
LOOP


CLS

DO UNTIL loopx = booknumber
PRINT " | " + name$(loopx) + " | Author: " + author$(loopx) + " | Rating: "; rating(loopx); " | Date: "; daydate$(loopx)
loopx = loopx + 1

        IF loopx = 46 THEN
        GOTO page3
        END IF

LOOP

END IF


'============================ PAGE 3 ============================

page3:

IF loopx = 46 THEN

DO WHILE INKEY$ = ""
LOOP

CLS

DO UNTIL loopx = booknumber
PRINT " | " + name$(loopx) + " | Author: " + author$(loopx) + " | Rating: "; rating(loopx); " | Date: "; daydate$(loopx)
loopx = loopx + 1

        IF loopx = 69 THEN
        GOTO page4
        END IF

LOOP

END IF


'============================ PAGE 4 ============================

page4:

IF loopx = 69 THEN

DO WHILE INKEY$ = ""
LOOP

CLS

DO UNTIL loopx = booknumber
PRINT " | " + name$(loopx) + " | Author: " + author$(loopx) + " | Rating: "; rating(loopx); " | Date: "; daydate$(loopx)
loopx = loopx + 1

        IF loopx = 92 THEN
        GOTO endofsub
        END IF

LOOP

END IF


endofsub:

DO WHILE INKEY$ = ""
LOOP

END SUB

