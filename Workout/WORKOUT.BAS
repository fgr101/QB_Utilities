DECLARE SUB EditExercise ()
DECLARE SUB PrintOptions ()
DECLARE SUB DifficultySwitcher ()
DECLARE SUB SAVE ()
DECLARE SUB Load ()
DECLARE SUB CreateFile ()

DECLARE SUB AddExercise ()
DECLARE SUB ShowRoutine ()

'================

RANDOMIZE TIMER

'================

DIM SHARED ExerciseName(6) AS STRING
DIM SHARED ExerciseMuscle(6) AS STRING
DIM SHARED ExerciseWeight(6) AS STRING

DIM SHARED ExerciseTimes(6) AS INTEGER
DIM SHARED ExerciseSets(6) AS INTEGER

DIM SHARED number AS INTEGER
DIM SHARED opcion AS INTEGER
DIM SHARED counter AS INTEGER

DIM SHARED i AS INTEGER
DIM SHARED ExercisesNumber AS INTEGER
DIM SHARED rndNumber AS INTEGER
DIM SHARED rndNumberSaved(6) AS INTEGER

'BOOLEANS FOR OPTIONS -> TRUE 1 | FALSE 0

DIM SHARED BooleanOrderRND AS INTEGER
DIM SHARED SwitchDifficulty AS INTEGER
DIM SHARED rndDifficultyA AS INTEGER
DIM SHARED rndDifficultyB AS INTEGER

DIM SHARED duplicateFound AS INTEGER

'===========================================

CreateFile
Load

'===========================================

MainMenu:
COLOR 7
CLS
PRINT "Workout v0.2 - FGR Software - Free & Open Source Project"
PRINT
PRINT "Menu. "
PRINT
PRINT "1) Add Exercise 2) Edit Exercise 3) Show Routine"
PRINT "4) Exit"
INPUT opcion

SELECT CASE opcion

	CASE 1

		AddExercise
		SAVE
		GOTO MainMenu

	CASE 2

		EditExercise
		SAVE
		GOTO MainMenu
	
	CASE 3

		ShowRoutine
		GOTO MainMenu

	CASE 4

		END

	CASE ELSE

		GOTO MainMenu

END SELECT

SUB AddExercise


AddExerciseIni:

PRINT "Number of physical Exercises 6."
PRINT
PRINT "1- "; ExerciseName(1)
PRINT "2- "; ExerciseName(2)
PRINT "3- "; ExerciseName(3)
PRINT "4- "; ExerciseName(4)
PRINT "5- "; ExerciseName(5)
PRINT "6- "; ExerciseName(6)
PRINT

INPUT "Exercise Number?", number

IF number = 0 THEN

	PRINT
	GOTO AddExerciseIni

END IF

PRINT

LINE INPUT "Name: ", ExerciseName(number)
LINE INPUT "Body Part: ", ExerciseMuscle(number)
INPUT "Repetitions:", ExerciseTimes(number)
INPUT "Sets:", ExerciseSets(number)
LINE INPUT "Weight:", ExerciseWeight(number)


END SUB

SUB CreateFile

'FILE SYSTEM
'Checking FILES +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
'If FILES don't exist the program creates them. ++++++++++++++=++++++++++++++

OPEN "workout.dat" FOR BINARY AS #1
IF LOF(1) = 0 THEN
CLOSE #1
OPEN "workout.dat" FOR OUTPUT AS #1
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
PRINT "workout.dat File created."
END IF
CLOSE #1

'=============================================================================

END SUB

SUB DifficultySwitcher

SELECT CASE SwitchDifficulty  'DIFFICULTY SWITCHER

	CASE 0

	rndDifficultyA = 0
	rndDifficultyB = 0
	
	CASE 1

	rndDifficultyA = INT(RND * 2) + 1
	rndDifficultyB = INT(RND * 2) + 1

	CASE 2

	rndDifficultyA = INT(RND * 4) + 1
	rndDifficultyB = INT(RND * 4) + 1

	CASE 3

	rndDifficultyA = INT(RND * 7) + 1
	rndDifficultyB = INT(RND * 7) + 1


END SELECT

END SUB

SUB EditExercise

EditExerciseIni:

PRINT "Number of physical Exercises 6."
PRINT

counter = 1

DO UNTIL counter = 7
PRINT counter; "-"; ExerciseName(counter)
counter = counter + 1
LOOP

PRINT

INPUT "Exercise Number?", number

IF number = 0 THEN

	PRINT
	GOTO EditExerciseIni

END IF

PRINT

PRINT "Name: "; ExerciseName(number)
PRINT "Body Part: "; ExerciseMuscle(number)
PRINT "Repetitions x Sets: "; ExerciseTimes(number) + rndDifficultyA; " x"; ExerciseSets(number) + rndDifficultyB

PRINT
COLOR 10
PRINT "======================================="
PRINT

LINE INPUT "Name: ", ExerciseName(number)
LINE INPUT "Body Part: ", ExerciseMuscle(number)
INPUT "Repetitions:", ExerciseTimes(number)
INPUT "Sets:", ExerciseSets(number)
LINE INPUT "Weight:", ExerciseWeight(number)






END SUB

SUB Load

'====================== LOAD ======================
'LOADS SAVED variables FROM the brain.dat file.
'

OPEN "workout.dat" FOR INPUT AS #1

counter = 0  '================ LOADING REMINDERS

DO UNTIL counter = 6


	INPUT #1, ExerciseName(counter)
	INPUT #1, ExerciseMuscle(counter)
	INPUT #1, ExerciseTimes(counter)
	INPUT #1, ExerciseSets(counter)
	INPUT #1, ExerciseWeight(counter)

	counter = counter + 1

LOOP

CLOSE #1

PRINT
PRINT "Loading..."

END SUB

SUB Notes

'v 0.2

'- OPTIONS --> Difficulty levels
'- OPTIONS --> Exercises can be shown randomly
'- EDIT EXERCISE option created.
'- Correction --> [Reps and Sets] instead of [Times and Repetitions]
'- BUG [Error after showing routine more than twice] FIXED.
'- Routines up to 6 exercises.
'- 1 more slot for an exercise available.
'- WEIGHT details added to routines.

'v 0.1

'- Program basic structure created.
'- Routines up to 5 exercises.
'- NAME, BODY PART & REPETITION details added to routines.
'- 5 slots for exercises available. You can modify them.

END SUB

SUB PrintOptions

PRINT "Random Order: ";

SELECT CASE BooleanOrderRND

	CASE 0
	PRINT "DISABLED";

	CASE 1
	PRINT "ENABLED";

END SELECT

PRINT " | ";

PRINT "Difficulty: ";

SELECT CASE SwitchDifficulty

	CASE 0
	PRINT "DISABLED";

	CASE 1
	PRINT "EASY";

	CASE 2
	PRINT "MEDIUM";

	CASE 3
	PRINT "HARD"

END SELECT


END SUB

' ================= SAVE ==========================
' Saves PROGRAM variables into the brain.dat file.
'
SUB SAVE

OPEN "workout.dat" FOR OUTPUT AS #1

counter = 0 ' ======================== SAVING ROUTINE

DO UNTIL counter = 6

	WRITE #1, ExerciseName(counter)
	WRITE #1, ExerciseMuscle(counter)
	WRITE #1, ExerciseTimes(counter)
	WRITE #1, ExerciseSets(counter)
	WRITE #1, ExerciseWeight(counter)

	counter = counter + 1

LOOP

WRITE #1,
WRITE #1,
WRITE #1,
WRITE #1,
WRITE #1,
WRITE #1,
WRITE #1,
WRITE #1,
WRITE #1,
WRITE #1,
CLOSE #1

PRINT
PRINT "Saving..."

END SUB

SUB ShowRoutine

ExercisesNumber = 0
number = 0
BooleanOrderRND = 0  'RANDOM ORDER: 0 DISABLED | 1 ENABLED
SwitchDifficulty = 3 'DIFFICULTY: 0 DISABLED | 1 EASY | 2 MEDIUM | 3 HARD

CLS

PrintOptions

IF BooleanOrderRND = 0 THEN

	DO UNTIL number >= 7

		IF NOT ExerciseName(number) = "" THEN

			DifficultySwitcher

			COLOR 15

			PRINT
			PRINT "Name: "; ExerciseName(number)
			PRINT "Body Part: "; ExerciseMuscle(number)
			PRINT "Repetitions x Sets: "; ExerciseTimes(number) + rndDifficultyA; " x"; ExerciseSets(number) + rndDifficultyB

			IF NOT ExerciseWeight(number) = "" THEN

				PRINT "Weight: "; ExerciseWeight(number)
	
			END IF

			PRINT

			COLOR 10
			PRINT "======================================="

			DO WHILE INKEY$ = ""
			LOOP

		END IF

		number = number + 1
	
	LOOP

END IF


'============================== RANDOM ORDER =================================

counter = 0

DO UNTIL counter = 7  'CAMBIAR SI CAMBIA CANTIDAD DE EJERCICIOS

	IF ExerciseName(counter) <> "" AND NOT counter = 7 THEN

		ExercisesNumber = ExercisesNumber + 1

	END IF

	counter = counter + 1

LOOP

counter = 0

'===========================================

IF BooleanOrderRND = 1 THEN

    DO UNTIL number >= ExercisesNumber

	rndNumber = INT(RND * 6) + 1
	rndNumberSaved(number) = rndNumber

	IF ExerciseName(rndNumber) <> "" THEN
	    
	    duplicateFound = 0
						
	    FOR i = 0 TO number - 1

		IF rndNumber = rndNumberSaved(i) THEN

		    duplicateFound = 1
		    EXIT FOR

		END IF

	    NEXT i

	    IF duplicateFound = 0 THEN

		DifficultySwitcher

		' Display exercise details here
		' ...

		COLOR 15
		PRINT
		PRINT "Name: "; ExerciseName(rndNumber)
		PRINT "Body Part: "; ExerciseMuscle(rndNumber)
		PRINT "Repetitions x Sets:  "; ExerciseTimes(rndNumber) + rndDifficultyA; " x"; ExerciseSets(rndNumber) + rndDifficultyB

		IF NOT ExerciseWeight(rndNumber) = "" THEN

		    PRINT "Weight: "; ExerciseWeight(rndNumber)

		END IF

		PRINT

		COLOR 10
		PRINT "======================================="

		DO WHILE INKEY$ = ""
		LOOP

		COLOR 7
		
		number = number + 1

	    END IF
	
	ELSE
	
	END IF

    LOOP

END IF


number = 0 '=========== RESTORING USED VARIABLES TO 0 ==================
rndNumber = 0

counter = 0

DO UNTIL counter = ExercisesNumber

	rndNumberSaved(counter) = 0
	counter = counter + 1

LOOP

counter = 0

END SUB

