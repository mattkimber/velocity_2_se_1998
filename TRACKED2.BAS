DECLARE SUB AddCheckpoints ()
DECLARE SUB LoadTrack ()
DECLARE SUB SaveTrack ()
DECLARE SUB ShowTrack ()
DECLARE SUB LoadTile ()
DECLARE SUB StartUp ()
DIM SHARED Tile(60 * 60) AS INTEGER
DIM SHARED Track(80, 80) AS INTEGER
DIM SHARED Checkpoints(10, 1) AS INTEGER

DIM SHARED OldTile AS INTEGER
DIM SHARED X2 AS INTEGER
DIM SHARED Y2 AS INTEGER
DIM SHARED TileNum AS INTEGER
DIM SHARED Cycle AS INTEGER
DIM SHARED X AS INTEGER
DIM SHARED Y AS INTEGER
DIM SHARED DrawMode AS INTEGER
DIM SHARED Finish(1) AS INTEGER
DIM SHARED Start(1) AS INTEGER

RANDOMIZE TIMER


FOR X = 0 TO 80
        FOR Y = 0 TO 80
        Track(X, Y) = 0
        NEXT Y
NEXT X

X = 10
Y = 6

StartUp
ShowTrack

DO
k$ = INKEY$
' Key find bit
IF k$ = CHR$(0) + "P" THEN Y = Y + 1: IF Y > 74 THEN Y = 74
IF k$ = CHR$(0) + "H" THEN Y = Y - 1: IF Y < 6 THEN Y = 6

IF k$ = CHR$(0) + "K" THEN X = X - 1: IF X < 10 THEN X = 10
IF k$ = CHR$(0) + "M" THEN X = X + 1: IF X > 70 THEN X = 70

IF UCASE$(k$) = "S" THEN SaveTrack
IF UCASE$(k$) = "L" THEN LoadTrack

IF k$ = " " OR k$ = CHR$(13) THEN Track(X, Y) = TileNum
IF k$ = "+" OR k$ = "-" OR Cycle = 0 THEN
IF k$ = "+" THEN TileNum = TileNum + 1
IF k$ = "-" THEN TileNum = TileNum - 1
IF TileNum < 0 THEN TileNum = 59
IF TileNum > 0 THEN
ON ERROR GOTO NoTile
OPEN "TILES/Track_" + LTRIM$(RTRIM$(STR$(TileNum))) + ".TL" FOR INPUT AS #1: CLOSE #1
END IF
LoadTile
END IF
IF UCASE$(k$) = "D" THEN
SELECT CASE DrawMode
        CASE 0
        DrawMode = -1
        CASE IS <> 0
        DrawMode = 0
END SELECT
END IF
IF UCASE$(k$) = "C" THEN
AddCheckpoints
END IF
IF UCASE$(k$) = "B" THEN Start(0) = X: Start(1) = Y: LOCATE 22, 60: PRINT "Start moved"
IF UCASE$(k$) = "F" THEN Finish(0) = X: Finish(1) = Y: LOCATE 22, 60: PRINT "Finish moved"

IF k$ <> "" AND k$ <> "+" AND k$ <> "-" THEN ShowTrack
'*****************************
IF DrawMode = -1 THEN Track(X, Y) = TileNum
LOCATE 23, 60
PRINT "No Checkpoint      "
FOR i = 0 TO 10
IF Checkpoints(i, 0) = X AND Checkpoints(i, 1) = Y THEN
LOCATE 23, 60
PRINT "Checkpoint"; i; "   "
END IF
NEXT i

LOCATE 22, 40
PRINT "X:"; X - 10
LOCATE 23, 40
PRINT "Y:"; Y - 6


LOCATE 22, 1
IF DrawMode = 0 THEN PRINT "Draw mode off     " ELSE PRINT "Draw mode active  "
LOCATE 23, 1
PRINT "Tile:"; STR$(TileNum); "   "

IF Cycle = 0 THEN Cycle = 1
LINE (240, 120)-(300, 180), 15, B
PCOPY 0, 1
LOOP UNTIL UCASE$(k$) = "Q" OR k$ = CHR$(27)
END

NoTile:
TileNum = 1
RESUME NEXT

SUB AddCheckpoints
FOR i = 0 TO 10
IF Checkpoints(i, 0) = 0 AND Checkpoints(i, 1) = 0 THEN
Checkpoints(i, 0) = X
Checkpoints(i, 1) = Y
LOCATE 22, 60
PRINT "Check added      "
EXIT FOR
EXIT SUB
END IF

IF Checkpoints(i, 0) = X AND Checkpoints(i, 1) = Y THEN
Checkpoints(i, 0) = 0
Checkpoints(i, 1) = 0
LOCATE 22, 60
PRINT "Check removed      "
END IF

NEXT i
END SUB

SUB LoadTile
IF TileNum > 0 THEN
OffSet = VARPTR(Tile(0))
Segment = VARSEG(Tile(0))
DEF SEG = Segment
BLOAD "TILES/Track_" + LTRIM$(RTRIM$(STR$(TileNum))) + ".TL", OffSet
PUT (570, 10), Tile, PSET
END IF
IF TileNum = 0 THEN LINE (570, 10)-(570 + 60, 10 + 60), 2, BF
END SUB

SUB LoadTrack
SCREEN 9, 0, 0, 0
OffSet = VARPTR(Track(0, 0))
Segment = VARSEG(Track(0, 0))
DEF SEG = Segment
LOCATE 23, 1
INPUT "What is the track called"; TName$
LOCATE 23, 1
PRINT "Loading...                                              "

OPEN "TRACKS/" + TName$ + ".NFO" FOR INPUT AS #1
INPUT #1, TFName$
FOR i = 0 TO 10
INPUT #1, Checkpoints(i, 0), Checkpoints(i, 1)
NEXT i
INPUT #1, Start(0), Start(1)
INPUT #1, Finish(0), Finish(1)
CLOSE #1
OPEN "TRACKS/" + TName$ + ".MAP" FOR BINARY AS #1
c = 1
FOR a = 0 TO 80
        FOR B = 0 TO 80
        GET #1, c, Track(a, B)
        c = c + 2
        NEXT B
NEXT a
CLOSE #1
SCREEN 9, 0, 0, 1

END SUB

SUB SaveTrack
SCREEN 9, 0, 0, 0
OffSet = VARPTR(Track(0, 0))
Segment = VARSEG(Track(0, 0))
DEF SEG = Segment
LOCATE 23, 1
INPUT "What will the track be called (8 letter DOS Filename)"; TName$
LOCATE 23, 1
PRINT "                                                                     "
LOCATE 23, 1
LINE INPUT "What will the track be called (Full name)"; TFName$
LOCATE 23, 1
PRINT "Saving...                                                                  "

OPEN "TRACKS/" + TName$ + ".NFO" FOR OUTPUT AS #1
PRINT #1, TFName$
FOR i = 0 TO 10
PRINT #1, Checkpoints(i, 0), Checkpoints(i, 1)
NEXT i
PRINT #1, Start(0), Start(1)
PRINT #1, Finish(0), Finish(1)

CLOSE #1

OPEN "TRACKS/" + TName$ + ".MAP" FOR BINARY AS #1

c = 1
FOR a = 0 TO 80
        FOR B = 0 TO 80
        PUT #1, c, Track(a, B)
        c = c + 2
        NEXT B
NEXT a
CLOSE #1
SCREEN 9, 0, 0, 1
END SUB

SUB ShowTrack
X = X - 4
Y = Y - 2
FOR a = 0 TO 8
        FOR B = 0 TO 3
                IF Track(a + X, B + Y) = 0 THEN LINE (a * 60, B * 60)-((a + 1) * 60, (B + 1) * 60), 2, BF
                IF Track(a + X, B + Y) > 0 THEN
                OldTile = TileNum
                TileNum = Track(a + X, B + Y)
                LoadTile
                PUT (a * 60, B * 60), Tile, PSET
                TileNum = OldTile
                END IF
                
        NEXT B
NEXT a
LoadTile
X = X + 4
Y = Y + 2
END SUB

SUB StartUp
TileNum = 1

SCREEN 9
WIDTH 80, 25
CLS
PRINT "VELOCITY 2 SE Track Editor"
COLOR 7
PRINT "=========================="
COLOR 15
PRINT
PRINT "Programmed by Matt Kimber"
PRINT "Copyright (c) Matt Kimber, 1998"
LOCATE 5, 15
COLOR 12
PRINT "Matt Kimber"
COLOR 15
PRINT
PRINT "Press a key to continue"
DO
LOOP WHILE INKEY$ = ""
SCREEN 9, 0, 1, 1
CLS
SCREEN 9, 0, 0, 1
CLS
END SUB

