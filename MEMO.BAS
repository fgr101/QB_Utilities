DECLARE SUB Study ()

DIM SHARED question(0 TO 5) AS STRING
DIM SHARED answer(0 TO 5) AS STRING
DIM SHARED UserAnswer AS STRING
DIM SHARED CardNumber AS INTEGER

DIM SHARED opcion AS INTEGER
DIM SHARED xloop AS INTEGER

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

MainINI:

CLS

PRINT "1- Add Questions"
PRINT "2- Study"
PRINT

INPUT opcion

SELECT CASE opcion

	CASE 1
	
		PRINT "What's the question?"
		INPUT question(CardNumber)
		
		PRINT "What's the answer?"
		INPUT answer(CardNumber)
			
		CardNumber = CardNumber + 1
		
		GOTO MainINI
	
	CASE 2
			
		Study

	CASE ELSE

END SELECT

SUB Study

CLS

xloop = 1

DO UNTIL xloop = 6

	PRINT

	PRINT question(xloop)
	INPUT UserAnswer

	SELECT CASE UserAnswer

		CASE answer(xloop)

			PRINT "that's correct"

		CASE ELSE

			PRINT "That's not correct."
			PRINT "The right answer is: "; answer(xloop)

	END SELECT

xloop = xloop + 1

LOOP

END SUB

