DECLARE SUB Save ()
DECLARE SUB Load ()
DECLARE SUB WaitKey ()
DECLARE SUB Study ()
DECLARE SUB CreateFile ()

DIM SHARED question(0 TO 100) AS STRING
DIM SHARED answer(0 TO 100) AS STRING
DIM SHARED UserAnswer AS STRING
DIM SHARED CardNumber AS INTEGER

DIM SHARED opcion AS INTEGER
DIM SHARED counter AS INTEGER

DIM SHARED correct AS INTEGER
DIM SHARED wrong AS INTEGER

CardNumber = 1

question(1) = "RED in Spanish"
answer(1) = "ROJO"

question(2) = "YELLOW in Spanish"
answer(2) = "AMARILLO"

question(3) = "BLUE in Spanish"
answer(3) = "AZUL"

question(4) = "GREEN in Spanish"
answer(4) = "VERDE"

question(5) = "PURPLE in Spanish"
answer(5) = "MORADO"

CreateFile
Load

MainINI:

CLS

LOCATE 3, 1
PRINT "1- Add Questions"
PRINT "2- Study"
PRINT "3- Delete All Flash Cards"
PRINT "4- Quit"
PRINT

INPUT opcion

SELECT CASE opcion

	CASE 1
	
		PRINT "FLASHCARD #"; CardNumber
		PRINT "What's the question?"
		INPUT question(CardNumber)
		
		PRINT "What's the answer?"
		INPUT answer(CardNumber)
			
		CardNumber = CardNumber + 1
		
		GOTO MainINI
	
	CASE 2
			
		Study
		GOTO MainINI

	CASE 3

		counter = 1

		DO UNTIL counter = CardNumber

			question(counter) = ""
			answer(counter) = ""

		counter = counter + 1

		LOOP

		CardNumber = 0

		GOTO MainINI

	CASE 4

		Save
		END
	
	CASE ELSE
	
		GOTO MainINI
		
END SELECT

SUB CreateFile

'FILE SYSTEM
'Checking FILES +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
'If FILES don't exist the program creates them. ++++++++++++++=++++++++++++++

OPEN "memory.dat" FOR BINARY AS #1

IF LOF(1) = 0 THEN
	
	PRINT "Creating memory.dat data file..."
	
	CLOSE #1
	OPEN "memory.dat" FOR OUTPUT AS #1

	counter = 0

	DO UNTIL counter = 500

		WRITE #1, ""
		WRITE #1, ""

		counter = counter + 1
	
	LOOP

	PRINT "memory.dat file successfully created."

END IF

CLOSE #1

END SUB

SUB Load

PRINT "Loading..."

OPEN "memory.dat" FOR INPUT AS #1

INPUT #1, CardNumber

counter = 0
DO UNTIL counter = 10
	
	INPUT #1, question(counter)
	INPUT #1, answer(counter)
	
	counter = counter + 1

LOOP

CLOSE #1

END SUB

SUB NOTES

'TO DO

' Show the list of content so the user can study
' Be able to delete an speciffic Flash Card using the CardNumber ID.
' Create LOAD file sub (load when starting the program)

' DONE

' SHOW the correct answer when the answer is wrong.
' Create the DATA FILE at the beginning of the program.
' Create SAVE file sub (save when ending the program)


END SUB

' ================= SAVE ==========================
' Save PROGRAM variables into the savings.bin file.
'
SUB Save

PRINT "Saving..."

OPEN "memory.dat" FOR OUTPUT AS #1

WRITE #1, CardNumber

counter = 1

DO UNTIL counter = 100
	
	WRITE #1, question(counter)
	WRITE #1, answer(counter)
	
	counter = counter + 1

LOOP

WRITE #1,
WRITE #1,

CLOSE #1

END SUB

SUB Study

CLS

counter = 1

DO UNTIL counter = 10

	CLS

	LOCATE 1, 1
	PRINT "Correct: "; correct; " | Wrong: "; wrong;

	LOCATE 3, 1
	
	PRINT question(counter)
	INPUT UserAnswer
	
	SELECT CASE UserAnswer

		CASE answer(counter)
			
			PRINT
			PRINT "that's correct";
			correct = correct + 1
			
			WaitKey

		CASE ELSE
			
			PRINT
			PRINT "That's not correct."
			PRINT "The right answer is: "; answer(counter);
			wrong = wrong + 1
			
			WaitKey

	END SELECT


	counter = counter + 1

	IF counter = CardNumber THEN '==== Si llega a la ultima pregunta guardada
					       '     sale del loop.
		counter = 0
		GOTO EndSubStudy

	END IF

LOOP

EndSubStudy:

correct = 0
wrong = 0

END SUB

SUB WaitKey 'Pess any key to continue

DO WHILE INKEY$ = ""
LOOP

END SUB

