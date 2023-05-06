DECLARE SUB Save ()
DECLARE SUB Load ()
DECLARE SUB CreateFile ()

DECLARE SUB AddExercise ()
DECLARE SUB ShowRoutine ()

DIM SHARED ExerciseName(5) AS STRING
DIM SHARED ExerciseMuscle(5) AS STRING

DIM SHARED ExerciseTimes(5) AS INTEGER
DIM SHARED ExerciseRepetitions(5) AS INTEGER
DIM SHARED Number AS INTEGER

'===========================================

CreateFile
Load

'===========================================

MainMenu:

CLS
PRINT "Menu. 1) Add Exercise 2) Show Routine 3) Exit"
INPUT opcion


SELECT CASE opcion

        CASE 1

                AddExercise
                Save
                GOTO MainMenu

        CASE 2

                ShowRoutine
                GOTO MainMenu

        CASE 3

                END

        CASE ELSE

                GOTO MainMenu

END SELECT

SUB AddExercise


AddExerciseIni:

PRINT "Number of physical Exercises 5."
INPUT "Exercise Number?", Number

IF Number = 0 THEN

        PRINT
        GOTO AddExerciseIni

END IF

PRINT

INPUT "Name: ", ExerciseName(Number)
INPUT "Body Part: ", ExerciseMuscle(Number)
INPUT "Set:", ExerciseTimes(Number)
INPUT "Repetitions:", ExerciseRepetitions(Number)

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

SUB Load

'====================== LOAD ======================
'LOADS SAVED variables FROM the brain.dat file.
'

OPEN "workout.dat" FOR INPUT AS #1

counter = 0  '================ LOADING REMINDERS

DO UNTIL counter = 5


        INPUT #1, ExerciseName(counter)
        INPUT #1, ExerciseMuscle(counter)
        INPUT #1, ExerciseTimes(counter)
        INPUT #1, ExerciseRepetitions(counter)

        counter = counter + 1

LOOP

CLOSE #1

PRINT
PRINT "Loading..."

END SUB

' ================= SAVE ==========================
' Saves PROGRAM variables into the brain.dat file.
'
SUB Save

OPEN "workout.dat" FOR OUTPUT AS #1

counter = 0 ' ======================== SAVING ROUTINE

DO UNTIL counter = 5

        WRITE #1, ExerciseName(counter)
        WRITE #1, ExerciseMuscle(counter)
        WRITE #1, ExerciseTimes(counter)
        WRITE #1, ExerciseRepetitions(counter)
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

Number = 1

PRINT

DO UNTIL Number = 6

        IF NOT ExerciseName(Number) = "" THEN

        PRINT "Name: ", ExerciseName(Number)
        PRINT "Body Part: ", ExerciseMuscle(Number)
        PRINT "Set:", ExerciseTimes(Number)
        PRINT "Repetitions:", ExerciseRepetitions(Number)

        PRINT

        DO WHILE INKEY$ = ""
        LOOP

        END IF

        Number = Number + 1
        
LOOP

END SUB

