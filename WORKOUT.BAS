DECLARE SUB SAVE ()
DECLARE SUB Load ()
DECLARE SUB CreateFile ()

DECLARE SUB AddExercise ()
DECLARE SUB ShowRoutine ()

DIM SHARED ExerciseName(6) AS STRING
DIM SHARED ExerciseMuscle(6) AS STRING
DIM SHARED ExerciseWeight(6) AS STRING
DIM SHARED ExerciseTimes(6) AS STRING

DIM SHARED ExerciseRepetitions(6) AS INTEGER

DIM SHARED Number AS INTEGER
DIM SHARED opcion AS INTEGER
DIM SHARED counter AS INTEGER

'===========================================

CreateFile
Load

'===========================================

MainMenu:
COLOR 7
CLS
PRINT "Workout v0.1 - FGR Software - Free & Open Source Project"
PRINT "Menu. 1) Add Exercise 2) Show Routine 3) Exit"
INPUT opcion

SELECT CASE opcion

        CASE 1

                AddExercise
                SAVE
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

PRINT "Number of physical Exercises 6."
PRINT
PRINT "1- "; ExerciseName(1)
PRINT "2- "; ExerciseName(2)
PRINT "3- "; ExerciseName(3)
PRINT "4- "; ExerciseName(4)
PRINT "5- "; ExerciseName(5)
PRINT "6- "; ExerciseName(6)
PRINT

INPUT "Exercise Number?", Number

IF Number = 0 THEN

        PRINT
        GOTO AddExerciseIni

END IF

PRINT

LINE INPUT "Name: ", ExerciseName(Number)
LINE INPUT "Body Part: ", ExerciseMuscle(Number)
LINE INPUT "Set:", ExerciseTimes(Number)
INPUT "Repetitions:", ExerciseRepetitions(Number)
LINE INPUT "Weight:", ExerciseWeight(Number)


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

DO UNTIL counter = 6


        INPUT #1, ExerciseName(counter)
        INPUT #1, ExerciseMuscle(counter)
        INPUT #1, ExerciseTimes(counter)
        INPUT #1, ExerciseRepetitions(counter)
        INPUT #1, ExerciseWeight(counter)

        counter = counter + 1

LOOP

CLOSE #1

PRINT
PRINT "Loading..."

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
        WRITE #1, ExerciseRepetitions(counter)
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

Number = 1

CLS

DO UNTIL Number >= 7

        IF NOT ExerciseName(Number) = "" THEN

        COLOR 15

        PRINT
        PRINT "Name: "; ExerciseName(Number)
        PRINT "Body Part: "; ExerciseMuscle(Number)
        PRINT "Repetitions: "; ExerciseTimes(Number); " x"; ExerciseRepetitions(Number)

        IF NOT ExerciseWeight(Number) = "" THEN

                PRINT "Weight: "; ExerciseWeight(Number)
        
        END IF

        PRINT

        COLOR 10
        PRINT "======================================="

        DO WHILE INKEY$ = ""
        LOOP

        END IF

        Number = Number + 1
        
LOOP

END SUB

