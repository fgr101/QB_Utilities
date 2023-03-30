DECLARE SUB WaitKey ()
DECLARE SUB Study ()
DECLARE SUB CreateFile ()

DIM SHARED question(0 TO 11) AS STRING
DIM SHARED answer(0 TO 11) AS STRING
DIM SHARED UserAnswer AS STRING
DIM SHARED CardNumber AS INTEGER

DIM SHARED opcion AS INTEGER
DIM SHARED xloop AS INTEGER

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

MainINI:

CLS

PRINT "1- Add Questions"
PRINT "2- Study"
PRINT "3- Quit"
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

	xloop = 0

	DO UNTIL xloop = 500

		WRITE #1, ""
		xloop = xloop + 1
	
	LOOP

	PRINT "memory.dat file successfully created."

END IF

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

DO UNTIL xloop = 100
	
	WRITE #1, question(xloop)
	WRITE #1, answer(xloop)
	
xloop = xloop + 1

LOOP

WRITE #1,
WRITE #1,

CLOSE #1

END SUB

SUB Study

CLS

xloop = 1

DO UNTIL xloop = 10

	CLS

	LOCATE 1, 1
	PRINT "Correct: "; correct; " | Wrong: "; wrong;

	LOCATE 3, 1
	
	PRINT question(xloop)
	INPUT UserAnswer
	
	SELECT CASE UserAnswer

		CASE answer(xloop)
			
			PRINT
			PRINT "that's correct";
			correct = correct + 1
			
			WaitKey

		CASE ELSE
			
			PRINT
			PRINT "That's not correct."
			PRINT "The right answer is: "; answer(xloop);
			wrong = wrong + 1
			
			WaitKey

	END SELECT


	xloop = xloop + 1

	IF xloop = CardNumber THEN '==== Si llega a la ultima pregunta guardada
					       '     sale del loop.
		xloop = 0
		GOTO EndSubStudy

	END IF

LOOP

EndSubStudy:
END SUB

SUB WaitKey 'Pess any key to continue

DO WHILE INKEY$ = ""
LOOP

END SUB

