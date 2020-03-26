DECLARE SUB PrintNums2 (XOffset AS INTEGER, YOffset AS INTEGER, TempString2 AS STRING)
DECLARE FUNCTION Time2DP! ()
DECLARE SUB PrintNums (XOffset AS INTEGER, YOffset AS INTEGER, Number AS SINGLE, UsePercent AS INTEGER)
DECLARE SUB LoadFENums ()
DECLARE SUB Progress ()
DECLARE SUB CarEdit ()
DECLARE SUB LoadCEF ()
DECLARE SUB SaveCEF ()
DECLARE SUB CarEditMenu ()
DECLARE SUB RandomTrack ()
DECLARE SUB GetNoOfTracks ()
DECLARE SUB CreateMessages ()
DECLARE SUB LoadTrackSmall ()
DECLARE SUB DrawTraffic ()
DECLARE SUB MoveComputer ()
DECLARE SUB DrawComputerMap ()
DECLARE SUB ResetCompVariables ()
DECLARE SUB Explosion ()
DECLARE SUB StartLights ()
DECLARE SUB ScreenSaver ()
DECLARE SUB EngineRev ()
DECLARE SUB CarStats ()
DECLARE FUNCTION PCSpdMax ()
DECLARE FUNCTION PCSpdMaxDam ()
DECLARE SUB Help ()
DECLARE SUB Target ()
DECLARE SUB GivePointsTG ()
DECLARE SUB GivePointsPT ()
DECLARE SUB SmallReset ()
DECLARE SUB GivePointsPP ()
DECLARE SUB PointsPosition ()
DECLARE SUB PointsTime ()
DECLARE SUB Knockout ()
DECLARE SUB MultiSetUp ()
DECLARE SUB GoodByeScreen ()
DECLARE SUB PlaySound ()
DECLARE SUB RecordTimes ()
DECLARE SUB InitImprove ()
DECLARE SUB CheckImprove ()
DECLARE SUB ResetSoundcard ()
DECLARE SUB SetReg (Reg%, Value%)
DECLARE SUB GetFamilyName ()
DECLARE SUB MainMenu ()
DECLARE SUB MakeSkid ()
DECLARE SUB RunGame ()
DECLARE SUB LoadCar ()
DECLARE SUB CarMenu ()
DECLARE SUB CarData ()
DECLARE SUB TitleScreen ()
DECLARE SUB CT (Text$, Row!)
DECLARE SUB UseInput ()
DECLARE SUB PrintDash ()
DECLARE SUB DrawVehicle ()
DECLARE SUB CheckSurface ()
DECLARE SUB ReadTrackData ()
DECLARE SUB MovePlayer ()
DECLARE SUB GetKey ()
DECLARE SUB DrawTrack ()
DECLARE SUB DrawBorder ()
DECLARE SUB InitScreen ()
DECLARE SUB PauseMe (SecondsToPause AS DOUBLE)
DECLARE SUB ResetVariables ()

CLEAR

CONST ScaleFactor = 5
CONST BorderColour = 0
CONST SpeedLimit = 14
CONST Pi = 3.14159265358979#

DIM SHARED NoOfTracks AS LONG

DIM SHARED Weather AS INTEGER

DIM SHARED ExplodeLength

DIM SHARED cx AS INTEGER
DIM SHARED cy AS INTEGER
DIM SHARED cz AS INTEGER

DIM SHARED TFName$

DIM SHARED NumTime(700) AS INTEGER
DIM SHARED NumSeconds(1200) AS INTEGER

DIM SHARED CompassN(700) AS INTEGER
DIM SHARED CompassNW(700) AS INTEGER
DIM SHARED CompassNE(700) AS INTEGER
DIM SHARED CompassE(700) AS INTEGER
DIM SHARED CompassW(700) AS INTEGER
DIM SHARED CompassS(700) AS INTEGER
DIM SHARED CompassSW(700) AS INTEGER
DIM SHARED CompassSE(700) AS INTEGER

DIM SHARED Num1(400) AS INTEGER
DIM SHARED Num2(400) AS INTEGER
DIM SHARED Num3(400) AS INTEGER
DIM SHARED Num4(400) AS INTEGER
DIM SHARED Num5(400) AS INTEGER
DIM SHARED Num6(400) AS INTEGER
DIM SHARED Num7(400) AS INTEGER
DIM SHARED Num8(400) AS INTEGER
DIM SHARED Num9(400) AS INTEGER
DIM SHARED Num0(400) AS INTEGER
DIM SHARED NumPC(400) AS INTEGER
DIM SHARED NumFS(400) AS INTEGER

DIM SHARED NumSpeed(1200) AS INTEGER
DIM SHARED NumDamage(1200) AS INTEGER

DIM SHARED CarColour AS INTEGER

DIM SHARED a AS SINGLE
DIM SHARED b AS SINGLE
DIM SHARED c AS SINGLE
DIM SHARED e AS SINGLE

DIM SHARED SoundOn AS INTEGER

DIM SHARED JoystickOn AS INTEGER
DIM SHARED JoystickCentre(1) AS INTEGER
DIM SHARED JoystickPresent AS INTEGER

DIM SHARED Beginner AS INTEGER

DIM SHARED Time!
DIM SHARED octave(2) AS INTEGER
DIM SHARED i AS INTEGER
DIM SHARED j AS INTEGER
DIM SHARED note$(2)
DIM SHARED Duration(1) AS DOUBLE

DIM SHARED Car0(400) AS INTEGER
DIM SHARED Car45(400) AS INTEGER
DIM SHARED Car90(400) AS INTEGER
DIM SHARED Car135(400) AS INTEGER
DIM SHARED Car180(400) AS INTEGER
DIM SHARED Car225(400) AS INTEGER
DIM SHARED Car270(400) AS INTEGER
DIM SHARED Car315(400) AS INTEGER

REDIM SHARED Picture(1) AS INTEGER

DIM SHARED Mask0(400) AS INTEGER
DIM SHARED Mask45(400) AS INTEGER
DIM SHARED Mask90(400) AS INTEGER
DIM SHARED Mask135(400) AS INTEGER
DIM SHARED Mask180(400) AS INTEGER
DIM SHARED Mask225(400) AS INTEGER
DIM SHARED Mask270(400) AS INTEGER
DIM SHARED Mask315(400) AS INTEGER

DIM SHARED TrackFileName AS STRING

DIM SHARED Cheater AS INTEGER

'Track Tiles
DIM SHARED CHeckpoints(10, 2) AS INTEGER
DIM SHARED Start(1) AS INTEGER
DIM SHARED Finish(1) AS INTEGER
DIM SHARED Tile(3600) AS INTEGER

'****************
DIM SHARED PlayersBackup AS INTEGER

DIM SHARED Map(80 * 80) AS INTEGER
DIM SHARED MapDiff AS INTEGER
DIM SHARED MapName AS STRING
DIM SHARED TooSlow AS DOUBLE
DIM SHARED d AS INTEGER
DIM SHARED TimeTaken AS SINGLE
DIM SHARED StartTime AS SINGLE
DIM SHARED Damage AS SINGLE
DIM SHARED Temp AS INTEGER
DIM SHARED TempString$
DIM SHARED GetKeys$
DIM SHARED TC AS DOUBLE
DIM SHARED Track(80, 80) AS INTEGER
DIM SHARED X AS INTEGER
DIM SHARED Y AS INTEGER
DIM SHARED X2 AS INTEGER
DIM SHARED Y2 AS INTEGER
DIM SHARED XAccel AS INTEGER
DIM SHARED YAccel AS INTEGER
DIM SHARED Speed AS SINGLE
DIM SHARED Angle AS INTEGER
DIM SHARED Crash AS INTEGER
DIM SHARED Car AS INTEGER
DIM SHARED Invincible AS INTEGER
DIM SHARED TurnDecay AS SINGLE
DIM SHARED PreviousAngle AS INTEGER
DIM SHARED InSkid AS INTEGER
DIM SHARED SkidCheck AS DOUBLE
DIM SHARED SkidX AS SINGLE
DIM SHARED SkidY AS SINGLE
DIM SHARED CarName AS STRING
DIM SHARED Bounce AS INTEGER
DIM SHARED StoredX AS INTEGER
DIM SHARED StoredY AS INTEGER

DIM SHARED Message AS STRING

DIM SHARED TempX AS INTEGER
DIM SHARED TempY AS INTEGER

DIM SHARED SkidThreshold AS SINGLE
DIM SHARED SkidSize AS INTEGER
DIM SHARED SkidDecay AS SINGLE
DIM SHARED MaxSpeed AS INTEGER
DIM SHARED GrassSpeed AS INTEGER
DIM SHARED GrassDamage AS SINGLE
DIM SHARED FloodDamage AS SINGLE
DIM SHARED BuildingDamage AS SINGLE
DIM SHARED MudDamage AS SINGLE
DIM SHARED RepairSpeed AS SINGLE
DIM SHARED Acceleration AS SINGLE
DIM SHARED Braking AS SINGLE
DIM SHARED CarFile AS STRING

DIM SHARED Family AS INTEGER
DIM SHARED Model AS INTEGER
DIM SHARED FamilyName AS STRING

REDIM SHARED PlayerName(0)  AS STRING
REDIM SHARED Points(1) AS INTEGER
REDIM SHARED PlayerTime(0) AS SINGLE
REDIM SHARED PlayerCar(0) AS INTEGER
DIM SHARED Players AS INTEGER
DIM SHARED GameModeName AS STRING
DIM SHARED GameMode AS INTEGER
DIM SHARED Played AS INTEGER
DIM SHARED InProgress AS INTEGER

DIM SHARED EditFile AS STRING
DIM SHARED TargetTime AS INTEGER

DIM SHARED Who$
DIM SHARED TheirCarFamily$
DIM SHARED TheirCar$
DIM SHARED TheirTime$
DIM SHARED Beaten AS INTEGER
DIM SHARED Skip AS INTEGER

DIM SHARED SlowName AS STRING
DIM SHARED OnRoad AS INTEGER
DIM SHARED SafeSpeed AS INTEGER

DIM SHARED SpriteJump AS INTEGER
DIM SHARED JumpDecay AS INTEGER

RANDOMIZE TIMER

IF COMMAND$ <> "" THEN SoundOn = 0 ELSE SoundOn = -1
SCREEN 0
WIDTH 80, 25
CLS

CT "Please wait... initialising program", 12
GetNoOfTracks
Traffic = 0
GameModeName = "Practice"
GameMode = 1
TargetTime = 999
TimeTaken = 999.99
PlayerName(0) = "Player 1"
TrackFileName = "Track1"
CarName = "M5"
Car = 11
Family = 1
Model = 1
FamilyName = "Sports car"
MapDiff = 0
MapName = "Map and position marker"
Players = 1
SpriteJump = 0
Weather = 1
JoystickPresent = 0
JoystickOn = 0
JoystickCentre(0) = 0
JoystickCentre(1) = 0

'IF STICK(0) <> 0 OR STICK(1) <> 0 THEN
'EngineRev
'PauseMe .1
'JoystickPresent = -1
'JoystickOn = -1
'JoystickCentre(0) = STICK(0)
'JoystickCentre(1) = STICK(1)
'END IF

LoadFENums
TitleScreen
ReadTrackData
ResetVariables




END


IntroTune:
DATA 15: REM Number of notes
'Data below: octave1, note1, octave2, note2, octave3, note3, duration, gap
'l18 o1 fgefdecdc n0l44 cdccdc"
DATA 2, f, 2, f, 2, f, .2 ,.01
DATA 2, g, 2, g, 2, g, .2 ,.01
DATA 2, e, 2, e, 2, e, .2 ,.01
DATA 2, f, 2, f, 2, f, .2 ,.01
DATA 2, d, 2, d, 2, d, .2 ,.01
DATA 2, e, 2, e, 2, e, .2 ,.01
DATA 2, c, 2, c, 2, c, .2 ,.01
DATA 2, d, 2, d, 2, d, .2 ,.01
DATA 2, c, 2, c, 2, c, .2 ,.01

DATA 4, c, 2, c, 2, c, .1 ,.01
DATA 4, d, 2, d, 2, d, .1 ,.01
DATA 4, c, 2, c, 2, c, .1 ,.01
DATA 4, c, 2, c, 2, c, .1 ,.01
DATA 4, d, 2, d, 2, d, .1 ,.01
DATA 4, c, 2, c, 2, c, .1 ,.01
StartTune:
DATA 5: REM Number of notes
'Data below: octave1, note1, octave2, note2, octave3, note3, duration
DATA 4, c, 2, c, 2, c, .15,0
DATA 4, d, 2, d, 2, d, .15,0
DATA 4, e, 2, e, 2, e, .15,0

DATA 2, c, 2, e, 2, g, .4 ,.1
DATA 2, c, 2, e, 2, g, .4 ,.01
Chord:
DATA 1: REM Number of notes
'Data below: octave1, note1, octave2, note2, octave3, note3, duration
DATA 3, c, 3, e, 3, g, .1, .05

GoodBye:
DATA 5

'Data below: octave1, note1, octave2, note2, octave3, note3, duration
DATA 3, g, 3, b, 4, d, .3 ,.01
DATA 3, e, 3, g, 3, a, .3 ,.01
DATA 3, c, 3, e, 3, g, .2 ,.01

DATA 2, c, 2, c, 2, c, .1, 0.1
DATA 2, c, 2, c, 2, c, .1, .1

SUB CarData
CarColour = 5
SELECT CASE Car
CASE 11
CarName = "M5"
MaxSpeed = 30
GrassSpeed = 15
GrassDamage = .15
FloodDamage = .3
MudDamage = .01
BuildingDamage = 15
RepairSpeed = .5
Acceleration = 2
Braking = 2.5
SkidThreshold = 13
SkidSize = 3
SkidDecay = 2
CarFile = "Sal"
CarColour = 4

CASE 12
CarName = "Virage"
MaxSpeed = 33
GrassSpeed = 12
GrassDamage = .19
FloodDamage = .39
MudDamage = .02
BuildingDamage = 19
RepairSpeed = .3
Acceleration = 3
Braking = 3.4
SkidThreshold = 17
SkidSize = 2.5
SkidDecay = 2
CarFile = "Sal"
CarColour = 7

CASE 13
CarName = "Capri 3.0S"
MaxSpeed = 26
GrassSpeed = 22
GrassDamage = .11
FloodDamage = .2
MudDamage = .01
BuildingDamage = 13
RepairSpeed = 2
Acceleration = 1.6
Braking = 1.1
SkidThreshold = 11
SkidSize = 3.6
SkidDecay = 1.7
CarFile = "Sal"
CarColour = 2

CASE 14
CarName = "XJS"
MaxSpeed = 29
GrassSpeed = 13
GrassDamage = .2
FloodDamage = .5
MudDamage = .04
BuildingDamage = 23
RepairSpeed = .3
Acceleration = 1.8
Braking = 1.6
SkidThreshold = 22
SkidSize = 1
SkidDecay = 2.7
CarFile = "Sal"
CarColour = 1

CASE 15
CarName = "Charger SE"
MaxSpeed = 34
GrassSpeed = 24
GrassDamage = .11
FloodDamage = .2
MudDamage = .01
BuildingDamage = 13
RepairSpeed = .4
Acceleration = 4
Braking = 1.6
SkidThreshold = 10
SkidSize = 4
SkidDecay = 1.6
CarFile = "Sal"
CarColour = 6

CASE 16
CarName = "Cosworth"
MaxSpeed = 29
GrassSpeed = 27
GrassDamage = .09
FloodDamage = .19
MudDamage = .01
BuildingDamage = 14
RepairSpeed = .6
Acceleration = 5
Braking = 1.7
SkidThreshold = 12
SkidSize = 5
SkidDecay = 2
CarFile = "Sal"
CarColour = 7

CASE 21
CarName = "Diablo"
MaxSpeed = 41
GrassSpeed = 13
GrassDamage = .35
FloodDamage = .8
MudDamage = .05
BuildingDamage = 35
RepairSpeed = .2
Acceleration = 3
Braking = 4

SkidThreshold = 22
SkidSize = 2
SkidDecay = 4
CarFile = "Sup"
CarColour = 6

CASE 22
CarName = "F1"
MaxSpeed = 46
GrassSpeed = 10
GrassDamage = .55
FloodDamage = 1.9
MudDamage = .09
BuildingDamage = 29
RepairSpeed = .1
Acceleration = 4.2
Braking = 5

SkidThreshold = 28
SkidSize = 3
SkidDecay = 5
CarFile = "Sup"
CarColour = 1

CASE 23
CarName = "959"
MaxSpeed = 39
GrassSpeed = 28
GrassDamage = .23
FloodDamage = .7
MudDamage = .03
BuildingDamage = 35
RepairSpeed = .05
Acceleration = 2.9
Braking = 3.8

SkidThreshold = 34
SkidSize = 1
SkidDecay = 6
CarFile = "Sup"
CarColour = 7

CASE 24
CarName = "911 Turbo"
MaxSpeed = 35
GrassSpeed = 34
GrassDamage = .06
FloodDamage = .2
MudDamage = .01
BuildingDamage = 28
RepairSpeed = .4
Acceleration = 2.5
Braking = 3

SkidThreshold = 19
SkidSize = 3
SkidDecay = 3
CarFile = "Sup"
CarColour = 4

CASE 25
CarName = "XJ220"
MaxSpeed = 43
GrassSpeed = 11
GrassDamage = .55
FloodDamage = 1.3
MudDamage = .09
BuildingDamage = 45
RepairSpeed = .1
Acceleration = 4.2
Braking = 5

SkidThreshold = 32
SkidSize = 2
SkidDecay = 8
CarFile = "Sup"
CarColour = 7

CASE 26
CarName = "512TR"
MaxSpeed = 38
GrassSpeed = 10
GrassDamage = .65
FloodDamage = 1.9
MudDamage = .1
BuildingDamage = 55
RepairSpeed = .2
Acceleration = 5
Braking = 3

SkidThreshold = 30
SkidSize = 1.5
SkidDecay = 7
CarFile = "Sup"
CarColour = 4

CASE 31
CarName = "Senator"
MaxSpeed = 27
GrassSpeed = 17
GrassDamage = .12
FloodDamage = .25
MudDamage = .01
BuildingDamage = 14
RepairSpeed = 1
Acceleration = 1.3
Braking = 1.6

SkidThreshold = 15
SkidSize = 4
SkidDecay = 1.5
CarFile = "Sal"
CarColour = 1

CASE 32
CarName = "Granada"
MaxSpeed = 25
GrassSpeed = 24
GrassDamage = .06
FloodDamage = .18
MudDamage = .005
BuildingDamage = 11
RepairSpeed = 2
Acceleration = 1.4
Braking = .9

SkidThreshold = 13
SkidSize = 5
SkidDecay = 1.54
CarFile = "Sal"
CarColour = 2

CASE 33
CarName = "Belvedere GTX440"
MaxSpeed = 29
GrassSpeed = 18
GrassDamage = .11
FloodDamage = .21
MudDamage = .01
BuildingDamage = 12
RepairSpeed = .6
Acceleration = 2
Braking = .7

SkidThreshold = 11
SkidSize = 6
SkidDecay = 1.6
CarFile = "Sal"
CarColour = 7

CASE 34
CarName = "Silver Ghost"
MaxSpeed = 24
GrassSpeed = 22
GrassDamage = .09
FloodDamage = .17
MudDamage = .01
BuildingDamage = 9
RepairSpeed = .5
Acceleration = 1.2
Braking = 1.6

SkidThreshold = 14
SkidSize = 4
SkidDecay = 1.2
CarFile = "Sal"
CarColour = 4

CASE 35
CarName = "Omega"
MaxSpeed = 26
GrassSpeed = 16
GrassDamage = .14
FloodDamage = .27
MudDamage = .011
BuildingDamage = 13
RepairSpeed = .9
Acceleration = 1.4
Braking = 2.2

SkidThreshold = 16
SkidSize = 3
SkidDecay = 1.6
CarFile = "Sal"
CarColour = 6

CASE 36
CarName = "XJ6"
MaxSpeed = 28
GrassSpeed = 15
GrassDamage = .19
FloodDamage = .3
MudDamage = .025
BuildingDamage = 19
RepairSpeed = .7
Acceleration = 1.3
Braking = 1.8

SkidThreshold = 18
SkidSize = 2
SkidDecay = 1.3
CarFile = "Sal"
CarColour = 1

CASE 41
CarName = "Cargo"
MaxSpeed = 19
GrassSpeed = 16
GrassDamage = .05
FloodDamage = .14
MudDamage = .001
BuildingDamage = 9
RepairSpeed = .2
Acceleration = .7
Braking = .8

SkidThreshold = 6
SkidSize = 2
SkidDecay = 1.2
CarFile = "Trk"
CarColour = 7

CASE 42
CarName = "D.A.F"
MaxSpeed = 18
GrassSpeed = 17
GrassDamage = .04
FloodDamage = .13
MudDamage = .001
BuildingDamage = 8
RepairSpeed = .23
Acceleration = .65
Braking = .7

SkidThreshold = 6
SkidSize = 2
SkidDecay = 1.3
CarFile = "Trk"
CarColour = 4

CASE 43
CarName = "M.A.N"
MaxSpeed = 21
GrassSpeed = 17
GrassDamage = .07
FloodDamage = .18
MudDamage = .003
BuildingDamage = 10
RepairSpeed = .19
Acceleration = .9
Braking = .9

SkidThreshold = 8
SkidSize = 2
SkidDecay = 1.5
CarFile = "Trk"
CarColour = 5

CASE 44
CarName = "Renault"
MaxSpeed = 20
GrassSpeed = 12
GrassDamage = .1
FloodDamage = .19
MudDamage = .004
BuildingDamage = 15
RepairSpeed = .1
Acceleration = 1
Braking = 1.1

SkidThreshold = 10
SkidSize = 3
SkidDecay = 1.7
CarFile = "Trk"
CarColour = 1

CASE 45
CarName = "Foden"
MaxSpeed = 18
GrassSpeed = 18
GrassDamage = .02
FloodDamage = .11
MudDamage = .001
BuildingDamage = 6
RepairSpeed = .6
Acceleration = .5
Braking = .1

SkidThreshold = 6
SkidSize = 2
SkidDecay = 1.1
CarFile = "Trk"
CarColour = 6

CASE 46
CarName = "AEC"
MaxSpeed = 19
GrassSpeed = 19
GrassDamage = .03
FloodDamage = .14
MudDamage = .002
BuildingDamage = 7
RepairSpeed = .7
Acceleration = .8
Braking = .2

SkidThreshold = 6
SkidSize = 1.9
SkidDecay = 1.15
CarFile = "Trk"
CarColour = 1

CASE 51
CarName = "Kenworth"
MaxSpeed = 17
GrassSpeed = 16
GrassDamage = 0
FloodDamage = 0
MudDamage = 0
BuildingDamage = 7
RepairSpeed = .05
Acceleration = .4
Braking = .5

SkidThreshold = 5
SkidSize = 1
SkidDecay = 1.1
CarFile = "Trk"
CarColour = 7

CASE 52
CarName = "Peterbilt"
MaxSpeed = 19
GrassSpeed = 17
GrassDamage = 0
FloodDamage = 0
MudDamage = 0
BuildingDamage = 8
RepairSpeed = .08
Acceleration = .8
Braking = .6

SkidThreshold = 6
SkidSize = 1
SkidDecay = 1.2
CarFile = "Trk"
CarColour = 1

CASE 53
CarName = "GMC"
MaxSpeed = 17
GrassSpeed = 15
GrassDamage = 0
FloodDamage = 0
MudDamage = 0
BuildingDamage = 5
RepairSpeed = .07
Acceleration = .8
Braking = .3

SkidThreshold = 4
SkidSize = 1.3
SkidDecay = 1.2
CarFile = "Trk"
CarColour = 6

CASE 54
CarName = "Volvo"
MaxSpeed = 18
GrassSpeed = 14
GrassDamage = 0
FloodDamage = 0
MudDamage = 0
BuildingDamage = 3
RepairSpeed = .11
Acceleration = .3
Braking = .2

SkidThreshold = 3
SkidSize = 1.4
SkidDecay = 1.13
CarFile = "Trk"
CarColour = 4

CASE 55
CarName = "Scania"
MaxSpeed = 20
GrassSpeed = 15
GrassDamage = 0
FloodDamage = 0
MudDamage = 0
BuildingDamage = 9
RepairSpeed = .03
Acceleration = .7
Braking = .14

SkidThreshold = 6
SkidSize = 1
SkidDecay = 1.16
CarFile = "Trk"
CarColour = 7

CASE 56
CarName = "Ford"
MaxSpeed = 21
GrassSpeed = 14
GrassDamage = 0
FloodDamage = 0
MudDamage = 0
BuildingDamage = 11
RepairSpeed = .04
Acceleration = .9
Braking = .11

SkidThreshold = 7
SkidSize = 1.1
SkidDecay = 1.18
CarFile = "Trk"
CarColour = 1

CASE 61
CarName = "Silverado"
MaxSpeed = 24
GrassSpeed = 22
GrassDamage = 0
FloodDamage = .08
MudDamage = 0
BuildingDamage = 16
RepairSpeed = .3
Acceleration = 1.2
Braking = 1.8

SkidThreshold = 10
SkidSize = 3
SkidDecay = 1.4
CarColour = 7

CarFile = "Pup"

CASE 62
CarName = "Hilux"
MaxSpeed = 23
GrassSpeed = 21
GrassDamage = 0
FloodDamage = .09
MudDamage = 0
BuildingDamage = 18
RepairSpeed = .4
Acceleration = 1
Braking = 2.1

SkidThreshold = 12
SkidSize = 3
SkidDecay = 1.7
CarColour = 6

CarFile = "Pup"

CASE 63
CarName = "Grand Cherokee"
MaxSpeed = 25
GrassSpeed = 24
GrassDamage = 0
FloodDamage = .09
MudDamage = 0
BuildingDamage = 19
RepairSpeed = .4
Acceleration = 1.4
Braking = 2.1

SkidThreshold = 11
SkidSize = 3
SkidDecay = 1.6
CarFile = "Pup"
CarColour = 1

CASE 64
CarName = "B2000"
MaxSpeed = 21
GrassSpeed = 21
GrassDamage = 0
FloodDamage = .12
MudDamage = 0
BuildingDamage = 21
RepairSpeed = 1.5
Acceleration = 1.6
Braking = 2.4

SkidThreshold = 13
SkidSize = 2.6
SkidDecay = 1.6
CarFile = "Pup"
CarColour = 2

CASE 65
CarName = "'Flareside Chevy'"
MaxSpeed = 25
GrassSpeed = 21
GrassDamage = 0
FloodDamage = .13
MudDamage = 0
BuildingDamage = 26
RepairSpeed = .25
Acceleration = 2
Braking = 1.6

SkidThreshold = 13
SkidSize = 4
SkidDecay = 2
CarFile = "Pup"
CarColour = 4

CASE 66
CarName = "P100"
MaxSpeed = 25
GrassSpeed = 25
GrassDamage = 0
FloodDamage = .18
MudDamage = 0
BuildingDamage = 19
RepairSpeed = 1.4
Acceleration = 1.9
Braking = .9

SkidThreshold = 15
SkidSize = 3
SkidDecay = 2
CarFile = "Pup"
CarColour = 5

END SELECT
END SUB

SUB CarEdit
SCREEN 0
WIDTH 80, 43
CLS
COLOR 15
Model = 1
Family = 6
FamilyName = "User car"
PRINT "General:"
PRINT "Sal = saloon, Sup = supercar, Trk = truck, Pup = pickup"
INPUT "What picture file will your car use"; CarFile
INPUT "What is your car called"; CarName
PRINT
PRINT "Performance:"
INPUT "What is the maximum speed (70-275)"; MaxSpeed
IF MaxSpeed < 70 THEN MaxSpeed = 70
IF MaxSpeed > 275 THEN MaxSpeed = 275
MaxSpeed = MaxSpeed / ScaleFactor
INPUT "What is the acceleration index (M5 = 2)"; Acceleration
INPUT "What is the braking index (M5 = 2.5)"; Braking
PRINT
PRINT "Handling:"
INPUT "What is the maximum safe cornering speed (M5 = 65)"; SkidThreshold
SkidThreshold = SkidThreshold / ScaleFactor
INPUT "What is the slide magnitude index (M5 = 3)"; SkidSize
INPUT "What is the slide decay index (M5 = 2)"; SkidDecay
PRINT
PRINT "Damage and repair:"
INPUT "How fast can the car go while on grass (M5 = 75)"; GrassSpeed
IF GrassSpeed < 10 THEN GrassSpeed = 10
GrassSpeed = GrassSpeed / ScaleFactor
IF GrassSpeed > MaxSpeed THEN GrassSpeed = MaxSpeed
INPUT "What is the grass damage index (M5 = 15)"; GrassDamage
GrassDamage = GrassDamage / 100
INPUT "What is the flood damage index (M5 = 30)"; FloodDamage
FloodDamage = FloodDamage / 100
INPUT "What is the mud damage index (M5 = 1)"; MudDamage
MudDamage = MudDamage / 100
INPUT "What is the building damage index (M5 = 1500)"; BuildingDamage
BuildingDamage = BuildingDamage / 100
INPUT "What is the repair speed index (M5 = 5)"; RepairSpeed
RepairSpeed = RepairSpeed / 10
PRINT
PRINT "Done... press a key"
DO
LOOP WHILE INKEY$ = ""
CarEditMenu
END SUB

SUB CarEditMenu
SCREEN 0
WIDTH 80, 25
CLS
COLOR 15
PRINT "Car editing functions"
COLOR 7
PRINT "====================="
PRINT
COLOR 15
PRINT "E. Car Editor"
PRINT
PRINT "L. Load a car file"
PRINT "S. Save a car file"
PRINT
PRINT "M. Main menu"
DO
k$ = UCASE$(INKEY$)
SELECT CASE k$
       
        CASE "M"
        MainMenu

        CASE "E"
        CarEdit

        CASE "L"
        LoadCEF

        CASE "S"
        SaveCEF

END SELECT
LOOP
END SUB

SUB CarStats
SCREEN 9, 0, 0, 0
WIDTH 80, 25
LoadCar
SCREEN 9, 0, 0, 0
WIDTH 80, 25
CLS
COLOR 15
PRINT "Car statistics for the "; CarName; ". ("; FamilyName; ")"
PRINT
PRINT "Performance"
COLOR 7
PRINT "Maximum Speed:"; TAB(50); MaxSpeed * ScaleFactor
PRINT "Acceleration:"; TAB(50); Acceleration
PRINT "Braking power:"; TAB(50); Braking
COLOR 15
PRINT
PRINT "Damage"
PRINT
COLOR 7
PRINT "Impact Damage factor:"; TAB(50); BuildingDamage
PRINT "Average rough terrain damage:"
LOCATE 11, 51
PRINT USING "#.##"; (GrassDamage + FloodDamage + MudDamage) / 3
PRINT "Ease of repair"; TAB(50); RepairSpeed * 10
COLOR 15
PRINT
PRINT "Handling"
COLOR 7
PRINT
PRINT "Maximum safe cornering speed:"; TAB(50); SkidThreshold * ScaleFactor
X = 10
Y = 260
Temp = 0
TurnDecay = SkidSize * 4
LINE (X, Y)-(X, Y), 14
DO
Temp = Temp + 1
X = X + TurnDecay
TurnDecay = TurnDecay / SkidDecay
Y = Y + 1
LINE STEP(0, 0)-(X, Y), 14
LOOP UNTIL TurnDecay - .15 <= 0
PRINT "Total slide magnitude @ 20 above MSCS:"; TAB(50); Temp
PRINT "Slide graph @ 20 above MSCS:"
LOCATE 23, 1
COLOR 15
PRINT "Press a key"
Angle = 0
DO
PauseMe .15
Angle = Angle + 45
IF Angle > 315 THEN Angle = 0

IF Angle = 0 THEN PUT (500, 10), Car0, PSET
IF Angle = 45 THEN PUT (500, 10), Car45, PSET
IF Angle = 90 THEN PUT (500, 10), Car90, PSET
IF Angle = 135 THEN PUT (500, 10), Car135, PSET
IF Angle = 180 THEN PUT (500, 10), Car180, PSET
IF Angle = 225 THEN PUT (500, 10), Car225, PSET
IF Angle = 270 THEN PUT (500, 10), Car270, PSET
IF Angle = 315 THEN PUT (500, 10), Car315, PSET

LOOP WHILE INKEY$ = ""
MainMenu
END SUB

SUB CheckImprove
SCREEN 0
WIDTH 80, 25
CLS

COLOR 15
PRINT "You set a target time of" + STR$(TargetTime) + " seconds."
PRINT "You managed a time of" + STR$(TimeTaken) + " seconds."
PRINT
IF TimeTaken <= TargetTime THEN PRINT "Well done!  You achieved your target!"
IF TimeTaken > TargetTime THEN PRINT "You failed to achieve your target.  Try an easier target."

PRINT
PRINT "Press a key"
DO
LOOP WHILE INKEY$ = ""
END SUB

SUB CheckSurface

OnRoad = 0
JumpDecay = JumpDecay - 1
IF SpriteJump > 100 THEN SpriteJump = 100
IF SpriteJump = 0 AND JumpDecay < 0 THEN JumpDecay = 0
SpriteJump = SpriteJump + JumpDecay
IF SpriteJump <= 0 THEN Invincible = 0: SpriteJump = 0
LOCATE 2, 5
PRINT STRING$(70, " ")
LOCATE 2, 5


IF Invincible <> 0 THEN PRINT "Your car is flying through the air!                              "
IF Bounce <= 5 THEN
XAccel = StoredX / Bounce
YAccel = StoredY / Bounce
Speed = 0
Bounce = Bounce + 1
END IF


TimeTaken = TIMER - StartTime

IF Invincible = 0 THEN


IF Track(X + 5, Y + 3) > 0 AND Track(X + 5, Y + 3) < 13 THEN
END IF

IF Track(X + 5, Y + 3) > 16 AND Track(X + 5, Y + 3) < 23 THEN
END IF

IF Track(X + 5, Y + 3) > 33 AND Track(X + 5, Y + 3) < 44 THEN
IF POINT(320, 175) <> 2 THEN
PRINT "Splash!  You drove into the water."
TimeTaken = 999.99
YAccel = 0
XAccel = 0
Crash = -1
Damage = 100
Speed = 0
END IF
END IF

IF POINT(320, 175) = 2 THEN
PRINT "Grass slows you down"
Damage = Damage + GrassDamage
IF Speed > GrassSpeed THEN Speed = GrassSpeed
END IF

IF Track(X + 5, Y + 3) > 64 THEN
IF POINT(320, 175) <> 2 THEN
PRINT "Smashing into buildings severely damages your car."
Damage = Damage + BuildingDamage
IF Bounce > 5 THEN
Bounce = 1
StoredX = -XAccel
StoredY = -YAccel
END IF
END IF
END IF

IF Track(X + 5, Y + 3) > 28 AND Track(X + 5, Y + 3) < 33 THEN
IF POINT(320, 175) <> 2 THEN
PRINT "Smashing into buildings severely damages your car."
Damage = Damage + BuildingDamage
IF Bounce > 5 THEN
Bounce = 1
StoredX = -XAccel
StoredY = -YAccel
END IF
END IF
END IF

IF Track(X + 5, Y + 3) > 57 AND Track(X + 5, Y + 3) < 60 THEN
IF POINT(320, 175) <> 2 THEN
PRINT "Your car is being repaired"
IF Speed > 0 THEN Damage = Damage - RepairSpeed
IF Speed = 0 THEN Damage = Damage - (RepairSpeed * 5)
IF Damage < 0 THEN Damage = 0
END IF
END IF

IF Track(X + 5, Y + 3) > 43 AND Track(X + 5, Y + 3) < 54 THEN
IF POINT(320, 175) <> 2 THEN
PRINT "Mud makes your car slide"
Damage = Damage + MudDamage
YAccel = YAccel + INT(RND * 4 - 2.2)
XAccel = XAccel + INT(RND * 4 - 2.2)
END IF
END IF

IF Track(X + 5, Y + 3) > 59 AND Track(X + 5, Y + 3) < 65 THEN
IF POINT(320, 175) <> 2 THEN
LOCATE 2, 5
PRINT "You crashed on the cliffs!                               "
TimeTaken = 999.99
YAccel = 0
XAccel = 0
Crash = -1
Damage = 100
Speed = 0
END IF
END IF


IF Track(X + 5, Y + 3) > 22 AND Track(X + 5, Y + 3) < 29 THEN
IF POINT(320, 175) <> 2 THEN
LOCATE 2, 5
PRINT "You crashed on the cliffs!                               "
TimeTaken = 999.99
YAccel = 0
XAccel = 0
Crash = -1
Damage = 100
Speed = 0
END IF
END IF

IF Damage >= 100 THEN
IF Damage > 100 THEN
LOCATE 2, 5
PRINT "Your car is wrecked!                                              "
END IF
TimeTaken = 999.99
YAccel = 0
XAccel = 0
Crash = -1
Damage = 100
Speed = 0
PrintNums 480, 100, 100, -1
LINE (20, 100)-(100, 120), 0, BF
PrintNums 20, 100, 0, 0

END IF


IF Track(X + 5, Y + 3) > 12 AND Track(X + 5, Y + 3) < 17 THEN
IF POINT(320, 175) <> 2 THEN
JumpDecay = (7 + (Speed / 11))
Invincible = -1
END IF
END IF
END IF
FOR i = 0 TO 10
IF X + 5 = CHeckpoints(i, 0) AND Y + 3 = CHeckpoints(i, 1) THEN CHeckpoints(i, 2) = -1
NEXT i

IF X + 5 = Finish(0) AND Y + 3 = Finish(1) THEN
Temp = -1
FOR i = 0 TO 10
IF CHeckpoints(i, 2) = 0 THEN Temp = 0
NEXT i
IF Temp <> 0 THEN
PRINT "Brilliant!  You reached the finish!"
YAccel = 0
XAccel = 0
Crash = -1
Damage = 0
Speed = 0
END IF
END IF
IF Beginner <> 0 THEN Damage = 0
END SUB

SUB CreateMessages
d = INT(RND * 6)
SELECT CASE d
CASE 0
Message = "Always slow down for hard turns... an extra 10 seconds is faster than a crash!"
CASE 1
Message = "Beware of the computer traffic... it's suicidally mad!"
CASE 2
Message = "Don't go too fast over jumps (Houston, we have a problem)"
CASE 3
Message = "Watch your slide!"
CASE 4
Message = "Avoid straying onto grass... unless it offers a shortcut..."
CASE 5
Message = "When on mud and grass, you can slide just too far..."
CASE 6
Message = "Test your brakes!  Don't be caught out if you need to stop."
END SELECT
END SUB

SUB CT (Text$, Row)
LOCATE Row, 40 - (LEN(Text$) / 2)
PRINT Text$
END SUB

SUB DrawBorder
LINE (0, 0)-(640, 60), BorderColour, BF
LINE (0, 0)-(120, 290), BorderColour, BF
LINE (460, 60)-(640, 290), BorderColour, BF
LINE (0, 290)-(640, 350), BorderColour, BF
LINE (120, 60)-(460, 290), 15, B

LINE (39, 139)-(61, 241), 15, B
LINE (69, 139)-(91, 241), 15, B

LINE (499, 139)-(531, 241), 15, B

END SUB

SUB DrawTrack
FOR a = 1 TO 9
        FOR b = 1 TO 6
                IF Track(a + X, b + Y) = 0 THEN LINE ((a * 60) - X2 + 20, (b * 60) - Y2)-(((a + 1) * 60) - X2 + 20, ((b + 1) * 60) - Y2), 2, BF
                IF Track(a + X, b + Y) > 0 THEN
                IF OldTile <> Track(a + X, b + Y) THEN
                OldTile = Track(a + X, b + Y)
                OffSet = VARPTR(Tile(0))
                Segment = VARSEG(Tile(0))
                DEF SEG = Segment
                BLOAD "TILES/Track_" + LTRIM$(RTRIM$(STR$(Track(a + X, b + Y)))) + ".TL", OffSet
                END IF
                IF ((a * 60) - X2 + 20) >= 0 AND ((a * 60) - X2 + 20) < 580 AND ((b * 60) - Y2) >= 0 AND ((b * 60) - Y2) < 290 THEN PUT ((a * 60) - X2 + 20, (b * 60) - Y2), Tile, PSET
                TileNum = OldTile
                END IF
               
        NEXT b
NEXT a

END SUB

SUB DrawVehicle

IF Angle = 0 THEN
PUT (310, 165), Mask0, AND
PUT (310 - SpriteJump, 165 - SpriteJump), Mask0, AND
PUT (310 - SpriteJump, 165 - SpriteJump), Car0, XOR
END IF

IF Angle = 45 THEN
PUT (310, 165), Mask45, AND
PUT (310 - SpriteJump, 165 - SpriteJump), Mask45, AND
PUT (310 - SpriteJump, 165 - SpriteJump), Car45, XOR
END IF

IF Angle = 90 THEN
PUT (310, 165), Mask90, AND
PUT (310 - SpriteJump, 165 - SpriteJump), Mask90, AND
PUT (310 - SpriteJump, 165 - SpriteJump), Car90, XOR
END IF

IF Angle = 135 THEN
PUT (310, 165), Mask135, AND
PUT (310 - SpriteJump, 165 - SpriteJump), Mask135, AND
PUT (310 - SpriteJump, 165 - SpriteJump), Car135, XOR
END IF

IF Angle = 180 THEN
PUT (310, 165), Mask180, AND
PUT (310 - SpriteJump, 165 - SpriteJump), Mask180, AND
PUT (310 - SpriteJump, 165 - SpriteJump), Car180, XOR
END IF

IF Angle = 225 THEN
PUT (310, 165), Mask225, AND
PUT (310 - SpriteJump, 165 - SpriteJump), Mask225, AND
PUT (310 - SpriteJump, 165 - SpriteJump), Car225, XOR
END IF

IF Angle = 270 THEN
PUT (310, 165), Mask270, AND
PUT (310 - SpriteJump, 165 - SpriteJump), Mask270, AND
PUT (310 - SpriteJump, 165 - SpriteJump), Car270, XOR
END IF

IF Angle = 315 THEN
PUT (310, 165), Mask315, AND
PUT (310 - SpriteJump, 165 - SpriteJump), Mask315, AND
PUT (310 - SpriteJump, 165 - SpriteJump), Car315, XOR
END IF

IF Damage > 55 THEN
FOR a = 1 TO (Damage * 2) - 110
        PSET ((320 - (Damage / 2)) + INT(RND * Damage), (175 - (Damage / 2)) + INT(RND * (Damage))), 7 + INT(RND * 1)
NEXT a
END IF

IF Damage > 75 THEN
FOR a = 1 TO Damage - 70
        PSET (305 + INT(RND * 30), 160 + INT(RND * 30)), 12
NEXT a
END IF

IF Damage > 85 THEN
FOR a = 1 TO Damage - 60
        PSET (305 + INT(RND * 30), 160 + INT(RND * 30)), 14
NEXT a
END IF
END SUB

SUB EngineRev
IF SoundOn <> 0 THEN
FOR a = 37 TO 80 STEP .5
SOUND a, .1
NEXT a
FOR a = 80 TO 37 STEP -.6
SOUND a, .1
NEXT a
END IF
END SUB

SUB Explosion
ExplodeLength = ExplodeLength + 1
IF ExplodeLength > 125 THEN ExplodeLength = 125
FOR c = 0 TO 360 STEP 5
DRAW "M320, 175"
IF ExplodeLength <= 65 THEN
DRAW "C12"
DRAW "TA" + STR$(c) + "NU" + STR$(ExplodeLength)
DRAW "TA" + STR$(360 - c)
END IF

IF ExplodeLength - 35 > 0 AND ExplodeLength - 35 < 65 THEN
DRAW "C14"
DRAW "TA" + STR$(c) + "NU" + STR$(INT(ExplodeLength - 35))
DRAW "TA" + STR$(360 - c)
END IF
IF ExplodeLength - 60 > 0 THEN
DRAW "C15"
DRAW "TA" + STR$(c) + "NU" + STR$(INT(ExplodeLength - 60))
DRAW "TA" + STR$(360 - c)
END IF

NEXT c
COLOR 7
END SUB

SUB GetFamilyName
SELECT CASE Family
        CASE 1
        FamilyName = "Sports car"
        CASE 2
        FamilyName = "Super car"
        CASE 3
        FamilyName = "Saloon car"
        CASE 4
        FamilyName = "Small truck"
        CASE 5
        FamilyName = "Large truck"
        CASE 6
        FamilyName = "Jeep/Pickup"
END SELECT

END SUB

SUB GetKey
GetKeys$ = ""
k$ = UCASE$(INKEY$)
IF Crash <> 0 AND k$ <> "" THEN GetKeys$ = "Quit"

IF GameMode = 1 THEN
IF k$ = "R" THEN GetKeys$ = "Restart"
IF k$ = "Q" THEN GetKeys$ = "Quit"
IF k$ = CHR$(27) THEN GetKeys$ = "Quit"
END IF

IF JoystickOn <> 0 THEN
IF STICK(1) < (JoystickCentre(1) - 10) THEN GetKeys$ = "Up"
IF STICK(1) > (JoystickCentre(1) + 10) THEN GetKeys$ = "Down"
IF STICK(0) < (JoystickCentre(0) - 10) THEN GetKeys$ = "Left"
IF STICK(0) > (JoystickCentre(0) + 10) THEN GetKeys$ = "Right"
IF STRIG(1) <> 0 THEN GetKeys$ = "Equal"
END IF

IF k$ = CHR$(0) + "H" THEN GetKeys$ = "Up"
IF k$ = CHR$(0) + "P" THEN GetKeys$ = "Down"
IF k$ = CHR$(0) + "K" THEN GetKeys$ = "Left"
IF k$ = CHR$(0) + "M" THEN GetKeys$ = "Right"

IF k$ = "E" THEN GetKeys$ = "Equal"

END SUB

SUB GetNoOfTracks
NoOfTracks = 0
OPEN "TRACKS/Tracks.txt" FOR INPUT AS #1
DO WHILE EOF(1) = 0
LINE INPUT #1, filenam$
IF NOT LEFT$(filenam$, 1) = " " OR filenam$ = "" THEN NoOfTracks = NoOfTracks + 1
LOOP
CLOSE #1

END SUB

SUB GivePointsPP
IF Played >= 0 THEN PlayerTime(Played) = TimeTaken
Played = Played + 1


IF Played = Players THEN
SCREEN 0
WIDTH 80, 43
CLS
COLOR 15
TempString$ = "Sorting"
FOR a = 0 TO Players - 1
        FOR b = 0 TO Players - 2
                TempString$ = TempString$ + "."
                IF PlayerTime(b) > PlayerTime(b + 1) THEN
                        SWAP Points(b), Points(b + 1)
                        SWAP PlayerName(b), PlayerName(b + 1)
                        SWAP PlayerCar(b), PlayerCar(b + 1)
                        SWAP PlayerTime(b), PlayerTime(b + 1)
                END IF
                LOCATE 1, 1
                PRINT TempString$
        NEXT b
NEXT a

LOCATE 1, 1
PRINT "Race results:                                                          "
COLOR 14
PRINT "Name"; TAB(45); "Time"; TAB(65); "Points"
PRINT
COLOR 7
FOR a = 0 TO Players - 1
Points(a) = Points(a) + (((Players - 1) - a) * 2)
PRINT LTRIM$(RTRIM$(STR$(a + 1))); ". "; PlayerName(a); TAB(45); PlayerTime(a); TAB(65); Points(a)
NEXT a
PRINT
LOCATE 23, 1
PRINT "Press a key"
DO
LOOP WHILE INKEY$ = ""
ResetVariables
END IF

IF Played < Players THEN
Car = PlayerCar(Played)
CarData
SCREEN 0
WIDTH 80, 25
CLS
COLOR 15
PRINT "Next player to race is:"
PRINT
COLOR 7
PRINT PlayerName(Played)
LOCATE 23, 1
COLOR 15
PRINT "Press a key"
DO
LOOP WHILE INKEY$ = ""
SmallReset
END IF

END SUB

SUB GivePointsPT
IF Played >= 0 THEN PlayerTime(Played) = TimeTaken
Played = Played + 1


IF Played = Players THEN
SCREEN 0
WIDTH 80, 43
CLS
COLOR 15
TempString$ = "Sorting"
FOR a = 0 TO Players - 1
        FOR b = 0 TO Players - 2
                TempString$ = TempString$ + "."
                IF PlayerTime(b) > PlayerTime(b + 1) THEN
                        SWAP Points(b), Points(b + 1)
                        SWAP PlayerName(b), PlayerName(b + 1)
                        SWAP PlayerCar(b), PlayerCar(b + 1)
                        SWAP PlayerTime(b), PlayerTime(b + 1)
                END IF
                LOCATE 1, 1
                PRINT TempString$
        NEXT b
NEXT a

LOCATE 1, 1
PRINT "Race results:                                                          "
COLOR 14
PRINT "Name"; TAB(45); "Time"; TAB(65); "Points"
PRINT
COLOR 7
FOR a = 0 TO Players - 1
Points(a) = Points(a) + INT((PlayerTime(Players - 1) - PlayerTime(a)))
PRINT LTRIM$(RTRIM$(STR$(a + 1))); ". "; PlayerName(a); TAB(45); PlayerTime(a); TAB(65); Points(a)
NEXT a
PRINT
LOCATE 23, 1
PRINT "Press a key"
DO
LOOP WHILE INKEY$ = ""
ResetVariables
END IF

IF Played < Players THEN
Car = PlayerCar(Played)
CarData
SCREEN 0
WIDTH 80, 25
CLS
COLOR 15
PRINT "Next player to race is:"
PRINT
COLOR 7
PRINT PlayerName(Played)
LOCATE 23, 1
COLOR 15
PRINT "Press a key"
DO
LOOP WHILE INKEY$ = ""
SmallReset
END IF

END SUB

SUB GivePointsTG
IF Played >= 0 THEN PlayerTime(Played) = TimeTaken
Played = Played + 1


IF Played = Players THEN
SCREEN 0
WIDTH 80, 43
CLS
COLOR 15
TempString$ = "Sorting"
FOR a = 0 TO Players - 1
        FOR b = 0 TO Players - 2
                TempString$ = TempString$ + "."
                IF PlayerTime(b) > PlayerTime(b + 1) THEN
                        SWAP Points(b), Points(b + 1)
                        SWAP PlayerName(b), PlayerName(b + 1)
                        SWAP PlayerCar(b), PlayerCar(b + 1)
                        SWAP PlayerTime(b), PlayerTime(b + 1)
                END IF
                LOCATE 1, 1
                PRINT TempString$
        NEXT b
NEXT a

LOCATE 1, 1
PRINT "Race results:                                                          "
COLOR 14
PRINT "Name"; TAB(45); "Time"; TAB(65); "Points"
PRINT
COLOR 7
FOR a = 0 TO Players - 1
Points(a) = Points(a) + INT((TargetTime - PlayerTime(a)))
IF Points(a) < 0 THEN Points(a) = 0
PRINT LTRIM$(RTRIM$(STR$(a + 1))); ". "; PlayerName(a); TAB(45); PlayerTime(a); TAB(65); Points(a)
NEXT a
PRINT
LOCATE 23, 1
PRINT "Press a key"
DO
LOOP WHILE INKEY$ = ""
ResetVariables
END IF

IF Played < Players THEN
Car = PlayerCar(Played)
CarData
SCREEN 0
WIDTH 80, 25
CLS
COLOR 15
PRINT "Next player to race is:"
PRINT
COLOR 7
PRINT PlayerName(Played)
LOCATE 23, 1
COLOR 15
PRINT "Press a key"
DO
LOOP WHILE INKEY$ = ""
SmallReset
END IF

END SUB

SUB GoodByeScreen
SCREEN 13
CLS
IF INKEY$ <> "" THEN CLS : PUT (10, 0), Picture: GOTO EndBye
PauseMe .001
EndBye:
LINE (0, 99)-(320, 200), 0, BF
LOCATE 14, 1
COLOR 31
PRINT "Thanks for playing VELOCITY 2 (SE)"
PRINT
COLOR 29
PRINT "Copyright (c) Matt Kimber, 1998"
COLOR 27
PRINT ""
COLOR 25
PRINT "WWW:    https://github.com/mattkimber"
PRINT
COLOR 23
PRINT "Goodbye!"
DEF SEG
RESTORE GoodBye
PlaySound
COLOR 21
LOCATE 23, 1
PRINT "Press a key to continue"
COLOR 7
DO
LOOP WHILE INKEY$ = ""
END
END SUB

SUB Help
SCREEN 0
WIDTH 80, 25
COLOR 15, 1
CLS
COLOR 15
PRINT "Help"
COLOR 7
PRINT "===="
PRINT
PRINT "The basic controls for VELOCITY 2 (SE) are:"
PRINT
PRINT "Left arrow key"; TAB(45); "Turn left"
PRINT "Right arrow key"; TAB(45); "Turn right"
PRINT "Up arrow key"; TAB(45); "Accelerate"
PRINT "Down arrow key"; TAB(45); "Brake"
PRINT "Q or Escape"; TAB(45); "End race (Practice only)"
PRINT "R"; TAB(45); "Restart race (Practice only)"
PRINT
PRINT "Pressing any key after crashing or finishing ends the race"
PRINT
PRINT "-"
PRINT
PRINT "Press any key for the next page (Driving tips)"
DO
LOOP WHILE INKEY$ = ""
COLOR 15, 1
CLS
COLOR 15
PRINT "Driving tips"
COLOR 7
PRINT "============"
PRINT
PRINT "Remember that different cars have different characteristics."
PRINT TAB(5); "Faster cars are weaker or slide more"
PRINT TAB(5); "Good-handling cars are slower or weaker"
PRINT TAB(5); "Stronger cars are slower or slide more"
PRINT
PRINT "Choose a car best suited to a particular track for Time Trials or"
PRINT "practice.  Pick a car that is good all-round for tournaments.  If"
PRINT "someone else has a good-handling car, and you have a fast car, they"
PRINT "might choose a twisty track, making you slower, or even forcing you"
PRINT "to crash!"
PRINT
PRINT "There are different car families.  Sports cars are best while you are"
PRINT "learning.  During a championship, all drivers are restricted to one"
PRINT "type of car.  It just wouldn't be fair to put the Kenworth up against"
PRINT "the XJ220... especially if you have to drive the Kenworth!"
PRINT
PRINT "-"
PRINT
PRINT "Press a key for the next page (Tournament guide)"
DO
LOOP WHILE INKEY$ = ""
COLOR 15, 1
CLS
COLOR 15
PRINT "Tournament guide"
COLOR 7
PRINT "================"
PRINT
PRINT "There are four types of tournament in VELOCITY 2 for multiplayer games."
PRINT "Each supports from two to eight players."
PRINT
PRINT "Points/Position tournament is a bit like F1 or Touring Cars.  Each player gets"
PRINT "a certain number of points based on his/her position."
PRINT
PRINT "Points/Time tournament is a bit like NASCAR in that it reflects your racing"
PRINT "performance.  Each player gets a certain number of points, relative to how much"
PRINT "faster they were than the slowest player.  In this race, every second counts!"
PRINT
PRINT "Target tournament can produce some wild racing.  There is a target time for each"
PRINT "race.  Beat it, and you are awarded points.  The quicker your time, the more you"
PRINT "will get.  But if you are slower than the target, you lose points!"
PRINT
PRINT "Knockout is the fastest of the tournaments.  After each round, the slowest"
PRINT "is 'knocked out' of the tournament, hence the name."
PRINT
PRINT "-"
PRINT
PRINT "Press a key to return to the menu"
DO
LOOP WHILE INKEY$ = ""
COLOR 15, 0
MainMenu
END SUB

SUB InitImprove
SCREEN 0
CLS
WIDTH 80, 25
COLOR 15
PRINT "The last target time set was" + STR$(TargetTime) + " seconds."
PRINT "The computer suggests a new target time of" + STR$(INT(TimeTaken - 1)) + " seconds for you."
COLOR 7
PRINT
INPUT "What is the target time you want to acheive"; TargetTime
IF TargetTime = 0 THEN MainMenu
TargetTime = INT(TargetTime)

END SUB

SUB InitScreen
SCREEN 9, 0, 0, 1
WIDTH 80, 25
CLS
COLOR 7, 0
END SUB

SUB Knockout
Played = -1
SCREEN 0
WIDTH 80, 43
CLS
COLOR 15
TempString$ = "Sorting"
FOR a = 0 TO Players - 1
        FOR b = 0 TO Players - 2
                TempString$ = TempString$ + "."
                IF Points(b) < Points(b + 1) THEN
                        SWAP Points(b), Points(b + 1)
                        SWAP PlayerName(b), PlayerName(b + 1)
                        SWAP PlayerCar(b), PlayerCar(b + 1)
                        SWAP PlayerTime(b), PlayerTime(b + 1)
                END IF
                LOCATE 1, 1
                PRINT TempString$
        NEXT b
NEXT a
CLS
LOCATE 1, 1
PRINT "Current standings:                                                          "
COLOR 14
PRINT "Name"; TAB(45); "Points"
PRINT
COLOR 7
FOR a = 0 TO Players - 1
PRINT LTRIM$(RTRIM$(STR$(a + 1))); ". "; PlayerName(a); TAB(45); Points(a)
NEXT a
PRINT
COLOR 7
IF InProgress = -1 THEN
PRINT PlayerName(Players - 1); " has been eliminated."
Players = Players - 1
PRINT
END IF
COLOR 15
PRINT "Continue knockout (y/n)?"
DO
k$ = UCASE$(INKEY$)
LOOP WHILE k$ <> "Y" AND k$ <> "N"
IF k$ = "Y" AND Players > 1 THEN
        FOR a = 0 TO Players - 1
        Points(a) = 0
        NEXT a
        InProgress = -1
        PRINT
        COLOR 7
        PRINT "Press enter to select a track at random"
        INPUT "What is the name of the track you wish to race on next"; TrackFileName
        IF TrackFileName = "" THEN RandomTrack
        COLOR 15
END IF
IF k$ = "N" OR Players < 2 THEN
        SCREEN 13
        CLS
        REDIM Picture(100 * 200) AS INTEGER
        OffSet = VARPTR(Picture(0))
        Segment = VARSEG(Picture(0))
        DEF SEG = Segment
        BLOAD "FRONTEND/TOURNY.FE", OffSet
        PUT (60, 0), Picture
        LOCATE 15, 1
        FOR a = 0 TO PlayersBackup
        PRINT LTRIM$(RTRIM$(STR$(a + 1))); ". "; PlayerName(a)
        IF a > 5 THEN EXIT FOR
        NEXT a
        LOCATE 13, 1
        PRINT "Top"; a; "players:"
        DO
        LOOP WHILE INKEY$ = ""
        CLS
        OffSet = VARPTR(Picture(0))
        Segment = VARSEG(Picture(0))
        DEF SEG = Segment
        BLOAD "FRONTEND/WIN.FE", OffSet
        PUT (60, 0), Picture
        LOCATE 13, 20 - INT((LEN(PlayerName(0) + " won the knockout!") / 2))
        PRINT PlayerName(0); " won the knockout!"
        DO
        LOOP WHILE INKEY$ = ""
        CLS
        OffSet = VARPTR(Picture(0))
        Segment = VARSEG(Picture(0))
        DEF SEG = Segment
        BLOAD "FRONTEND/LOSE.FE", OffSet
        PUT (60, 0), Picture

        LOCATE 14, 20 - INT((LEN(PlayerName(PlayersBackup) + " came last.") / 2))
        PRINT PlayerName(PlayersBackup); " came last."
        DO
        LOOP WHILE INKEY$ = ""
        MainMenu
END IF
WIDTH 80, 25
GivePointsPP

END SUB

SUB LoadCar
SCREEN 9, 0, 1, 0
CLS
OffSet = VARPTR(Car0(0))
Segment = VARSEG(Car0(0))
DEF SEG = Segment
BLOAD "CARSPRT/" + CarFile + "_0.CAR", OffSet

OffSet = VARPTR(Car45(0))
Segment = VARSEG(Car45(0))
DEF SEG = Segment
BLOAD "CARSPRT/" + CarFile + "_45.CAR", OffSet

FOR i = 0 TO 1
IF i = 0 THEN PUT (0, 0), Car0, PSET
IF i = 1 THEN PUT (0, 0), Car45, PSET

FOR cx = 0 TO 20
        FOR cy = 0 TO 20
        cz = POINT(cx, 20 - cy)
        PSET (cx + 25, cy), cz

        NEXT cy
NEXT cx

FOR cx = 0 TO 20
        FOR cy = 0 TO 20
        cz = POINT(cx, cy)
        PSET (cy + 50, cx), cz

        NEXT cy
NEXT cx

IF i = 0 THEN
FOR cx = 0 TO 20
        FOR cy = 0 TO 20
        cz = POINT(cx, 20 - cy)
        PSET (cy + 75, cx), cz

        NEXT cy
NEXT cx
END IF
IF i = 1 THEN
FOR cx = 0 TO 20
        FOR cy = 0 TO 20
        cz = POINT(20 - cx, cy)
        PSET (cx + 75, cy), cz

        NEXT cy
NEXT cx
END IF
FOR cx = 0 TO 96
        FOR cy = 0 TO 20
        cz = POINT(cx, cy)
        IF cz = 5 THEN PSET (cx, cy), CarColour
        IF cz = 13 THEN PSET (cx, cy), CarColour + 8
        NEXT cy
NEXT cx
IF i = 0 THEN GET (0, 0)-(20, 20), Car0
IF i = 1 THEN GET (0, 0)-(20, 20), Car45
IF i = 0 THEN GET (25, 0)-(45, 20), Car180
IF i = 1 THEN GET (25, 0)-(45, 20), Car135
IF i = 0 THEN GET (50, 0)-(70, 20), Car270
IF i = 1 THEN GET (50, 0)-(70, 20), Car225
IF i = 0 THEN GET (75, 0)-(95, 20), Car90
IF i = 1 THEN GET (75, 0)-(95, 20), Car315
NEXT i
DEF SEG
SCREEN 9, 0, 1, 0
CLS
PUT (0, 0), Car0, PSET
FOR a = 0 TO 20
        FOR b = 0 TO 20
                IF POINT(a, b) = 0 THEN PSET (a, b), 11
                IF POINT(a, b) <> 0 AND POINT(a, b) <> 11 THEN PSET (a, b), 0
                IF POINT(a, b) = 11 THEN PSET (a, b), 15
        NEXT b
NEXT a
GET (0, 0)-(20, 20), Mask0

PUT (0, 0), Car45, PSET
FOR a = 0 TO 20
        FOR b = 0 TO 20
                IF POINT(a, b) = 0 THEN PSET (a, b), 11
                IF POINT(a, b) <> 0 AND POINT(a, b) <> 11 THEN PSET (a, b), 0
                IF POINT(a, b) = 11 THEN PSET (a, b), 15
        NEXT b
NEXT a
GET (0, 0)-(20, 20), Mask45

PUT (0, 0), Car90, PSET
FOR a = 0 TO 20
        FOR b = 0 TO 20
                IF POINT(a, b) = 0 THEN PSET (a, b), 11
                IF POINT(a, b) <> 0 AND POINT(a, b) <> 11 THEN PSET (a, b), 0
                IF POINT(a, b) = 11 THEN PSET (a, b), 15
        NEXT b
NEXT a
GET (0, 0)-(20, 20), Mask90

PUT (0, 0), Car135, PSET
FOR a = 0 TO 20
        FOR b = 0 TO 20
                IF POINT(a, b) = 0 THEN PSET (a, b), 11
                IF POINT(a, b) <> 0 AND POINT(a, b) <> 11 THEN PSET (a, b), 0
                IF POINT(a, b) = 11 THEN PSET (a, b), 15
        NEXT b
NEXT a
GET (0, 0)-(20, 20), Mask135

PUT (0, 0), Car180, PSET
FOR a = 0 TO 20
        FOR b = 0 TO 20
                IF POINT(a, b) = 0 THEN PSET (a, b), 11
                IF POINT(a, b) <> 0 AND POINT(a, b) <> 11 THEN PSET (a, b), 0
                IF POINT(a, b) = 11 THEN PSET (a, b), 15
        NEXT b
NEXT a
GET (0, 0)-(20, 20), Mask180

PUT (0, 0), Car225, PSET
FOR a = 0 TO 20
        FOR b = 0 TO 20
                IF POINT(a, b) = 0 THEN PSET (a, b), 11
                IF POINT(a, b) <> 0 AND POINT(a, b) <> 11 THEN PSET (a, b), 0
                IF POINT(a, b) = 11 THEN PSET (a, b), 15
        NEXT b
NEXT a
GET (0, 0)-(20, 20), Mask225

PUT (0, 0), Car270, PSET
FOR a = 0 TO 20
        FOR b = 0 TO 20
                IF POINT(a, b) = 0 THEN PSET (a, b), 11
                IF POINT(a, b) <> 0 AND POINT(a, b) <> 11 THEN PSET (a, b), 0
                IF POINT(a, b) = 11 THEN PSET (a, b), 15
        NEXT b
NEXT a
GET (0, 0)-(20, 20), Mask270

PUT (0, 0), Car315, PSET
FOR a = 0 TO 20
        FOR b = 0 TO 20
                IF POINT(a, b) = 0 THEN PSET (a, b), 11
                IF POINT(a, b) <> 0 AND POINT(a, b) <> 11 THEN PSET (a, b), 0
                IF POINT(a, b) = 11 THEN PSET (a, b), 15

        NEXT b
NEXT a
GET (0, 0)-(20, 20), Mask315

END SUB

SUB LoadCEF
SCREEN 0
WIDTH 80, 25
CLS
COLOR 15
Family = 6
INPUT "What filename (no extension) do you want to load"; EditFile
OPEN EditFile + ".CEF" FOR INPUT AS #1
INPUT #1, TempString$
INPUT #1, CarName
INPUT #1, TempString$
INPUT #1, MaxSpeed
IF MaxSpeed < 70 THEN MaxSpeed = 70
IF MaxSpeed > 275 THEN MaxSpeed = 275
MaxSpeed = MaxSpeed / ScaleFactor
INPUT #1, TempString$
INPUT #1, GrassSpeed
GrassSpeed = GrassSpeed / ScaleFactor
IF GrassSpeed > MaxSpeed THEN GrassSpeed = MaxSpeed
INPUT #1, TempString$
INPUT #1, GrassDamage
GrassDamage = GrassDamage / 100
INPUT #1, TempString$
INPUT #1, FloodDamage
FloodDamage = FloodDamage / 100
INPUT #1, TempString$
INPUT #1, MudDamage
MudDamage = MudDamage / 100
INPUT #1, TempString$
INPUT #1, BuildingDamage
BuildingDamage = BuildingDamage / 100
INPUT #1, TempString$
INPUT #1, RepairSpeed
RepairSpeed = RepairSpeed / 10
INPUT #1, TempString$
INPUT #1, Acceleration
INPUT #1, TempString$
INPUT #1, Braking
INPUT #1, TempString$
INPUT #1, SkidThreshold
SkidThreshold = SkidThreshold / ScaleFactor
INPUT #1, TempString$
INPUT #1, SkidSize
INPUT #1, TempString$
INPUT #1, SkidDecay
INPUT #1, TempString$
INPUT #1, CarFile
CLOSE #1
PRINT
CLOSE #1
PRINT "Done."
PRINT "To edit your car, open the .CEF file in a text editor"
PRINT "Press a key"
DO
LOOP WHILE INKEY$ = ""
FamilyName = "User car (from file)"
CarEditMenu

END SUB

SUB LoadFENums

OffSet = VARPTR(NumTime(0))
Segment = VARSEG(NumTime(0))
DEF SEG = Segment
BLOAD "FRONTEND/TIME.FE", OffSet

OffSet = VARPTR(NumSeconds(0))
Segment = VARSEG(NumSeconds(0))
DEF SEG = Segment
BLOAD "FRONTEND/SECONDS.FE", OffSet

OffSet = VARPTR(Num1(0))
Segment = VARSEG(Num1(0))
DEF SEG = Segment
BLOAD "FRONTEND/NUM_1.FE", OffSet

OffSet = VARPTR(Num2(0))
Segment = VARSEG(Num2(0))
DEF SEG = Segment
BLOAD "FRONTEND/NUM_2.FE", OffSet

OffSet = VARPTR(Num3(0))
Segment = VARSEG(Num3(0))
DEF SEG = Segment
BLOAD "FRONTEND/NUM_3.FE", OffSet

OffSet = VARPTR(Num4(0))
Segment = VARSEG(Num4(0))
DEF SEG = Segment
BLOAD "FRONTEND/NUM_4.FE", OffSet

OffSet = VARPTR(Num5(0))
Segment = VARSEG(Num5(0))
DEF SEG = Segment
BLOAD "FRONTEND/NUM_5.FE", OffSet

OffSet = VARPTR(Num6(0))
Segment = VARSEG(Num6(0))
DEF SEG = Segment
BLOAD "FRONTEND/NUM_6.FE", OffSet

OffSet = VARPTR(Num7(0))
Segment = VARSEG(Num7(0))
DEF SEG = Segment
BLOAD "FRONTEND/NUM_7.FE", OffSet

OffSet = VARPTR(Num8(0))
Segment = VARSEG(Num8(0))
DEF SEG = Segment
BLOAD "FRONTEND/NUM_8.FE", OffSet

OffSet = VARPTR(Num9(0))
Segment = VARSEG(Num9(0))
DEF SEG = Segment
BLOAD "FRONTEND/NUM_9.FE", OffSet

OffSet = VARPTR(Num0(0))
Segment = VARSEG(Num0(0))
DEF SEG = Segment
BLOAD "FRONTEND/NUM_0.FE", OffSet

OffSet = VARPTR(NumFS(0))
Segment = VARSEG(NumFS(0))
DEF SEG = Segment
BLOAD "FRONTEND/NUM_FS.FE", OffSet

OffSet = VARPTR(NumPC(0))
Segment = VARSEG(NumPC(0))
DEF SEG = Segment
BLOAD "FRONTEND/NUM_PC.FE", OffSet

OffSet = VARPTR(NumSpeed(0))
Segment = VARSEG(NumSpeed(0))
DEF SEG = Segment
BLOAD "FRONTEND/SPEED.FE", OffSet

OffSet = VARPTR(NumDamage(0))
Segment = VARSEG(NumDamage(0))
DEF SEG = Segment
BLOAD "FRONTEND/DAMAGE.FE", OffSet

OffSet = VARPTR(CompassN(0))
Segment = VARSEG(CompassN(0))
DEF SEG = Segment
BLOAD "FRONTEND/COMP_N.FE", OffSet

OffSet = VARPTR(CompassS(0))
Segment = VARSEG(CompassS(0))
DEF SEG = Segment
BLOAD "FRONTEND/COMP_S.FE", OffSet

OffSet = VARPTR(CompassE(0))
Segment = VARSEG(CompassE(0))
DEF SEG = Segment
BLOAD "FRONTEND/COMP_E.FE", OffSet

OffSet = VARPTR(CompassW(0))
Segment = VARSEG(CompassW(0))
DEF SEG = Segment
BLOAD "FRONTEND/COMP_W.FE", OffSet

OffSet = VARPTR(CompassNE(0))
Segment = VARSEG(CompassNE(0))
DEF SEG = Segment
BLOAD "FRONTEND/COMP_NE.FE", OffSet

OffSet = VARPTR(CompassSE(0))
Segment = VARSEG(CompassSE(0))
DEF SEG = Segment
BLOAD "FRONTEND/COMP_SE.FE", OffSet

OffSet = VARPTR(CompassNW(0))
Segment = VARSEG(CompassNW(0))
DEF SEG = Segment
BLOAD "FRONTEND/COMP_NW.FE", OffSet

OffSet = VARPTR(CompassSW(0))
Segment = VARSEG(CompassSW(0))
DEF SEG = Segment
BLOAD "FRONTEND/COMP_SW.FE", OffSet

END SUB

SUB LoadTrackSmall
OPEN "TRACKS/" + TrackFileName + ".NFO" FOR INPUT AS #1
LINE INPUT #1, TFName$
FOR i = 0 TO 10
INPUT #1, CHeckpoints(i, 0), CHeckpoints(i, 1)
NEXT i
INPUT #1, Start(0), Start(1)
INPUT #1, Finish(0), Finish(1)
CLOSE #1

OPEN "TRACKS/" + TrackFileName + ".MAP" FOR BINARY AS #1
c = 1
        LINE (450, 280)-(450 + 80, 250 + 80), 2, BF
FOR a = 0 TO 80
        FOR b = 0 TO 80
        GET #1, c, Track(a, b)
        IF Track(a, b) > 0 AND Track(a, b) < 13 THEN PSET (a + 450, b + 280), 0
        IF Track(a, b) > 16 AND Track(a, b) < 22 THEN PSET (a + 450, b + 280), 0

        IF Track(a, b) > 12 AND Track(a, b) < 17 THEN PSET (a + 450, b + 280), 10
        IF Track(a, b) > 22 AND Track(a, b) < 29 THEN PSET (a + 450, b + 280), 7
        IF Track(a, b) > 28 AND Track(a, b) < 33 THEN PSET (a + 450, b + 280), 4
        IF Track(a, b) > 33 AND Track(a, b) < 44 THEN PSET (a + 450, b + 280), 1
        IF Track(a, b) > 43 AND Track(a, b) < 54 THEN PSET (a + 450, b + 280), 6
        IF Track(a, b) > 53 AND Track(a, b) < 58 THEN PSET (a + 450, b + 280), 0
        IF Track(a, b) > 57 AND Track(a, b) < 60 THEN PSET (a + 450, b + 280), 5
        c = c + 2
        NEXT b
NEXT a
PSET (Start(0) + 450, Start(1) + 280), 11
PSET (Finish(0) + 450, Finish(1) + 280), 15
FOR a = 0 TO 10
IF CHeckpoints(a, 0) > 0 AND CHeckpoints(a, 1) > 0 THEN PSET (CHeckpoints(a, 0) + 450, CHeckpoints(a, 1) + 280), 3
NEXT a
CLOSE #1
END SUB

SUB MainMenu
Cheater = 0
FOR a = 0 TO 20
k$ = INKEY$
NEXT a
TimeTaken = 999.99
TC = TIMER
InProgress = 0
IF Family < 6 THEN CarData
Menu:
SCREEN 12
CLS
WIDTH 80, 60
LOCATE 1, 1
COLOR 15
PRINT "VELOCITY   Special Edition"
LOCATE 1, 10
COLOR 14
PRINT "2"
LOCATE 2, 1
COLOR 7
PRINT "=========================="
PRINT
COLOR 15
PRINT "G. Go!"
PRINT "+. Increase number of players"
PRINT "-. Decrease number of players"
PRINT "N. Player name"
PRINT "F. Car family"
PRINT "C. Car type"
PRINT "T. Select Track manually"
PRINT "A. Select Track automatically"
PRINT "?. Help, hints and tips pages"
PRINT "!. VELOCITY 2 Screen Saver (Activates after 2 mins)"
PRINT "S. Current car statistics"
PRINT "W. Weather (Practice mode only)"
PRINT "B. Enable beginner mode (Practice mode only)"
PRINT "E. Car editing functions"
'IF JoystickPresent = 0 THEN COLOR 8
'PRINT "J. Enable/Disable Joystick"
COLOR 8
PRINT
COLOR 15
PRINT "1. Select practice mode"
PRINT "2. Select improvement mode"
PRINT "3. Select time trials"
PRINT "4. Select points/position tournament"
PRINT "5. Select points/time tournament"
PRINT "6. Select target tournament"
PRINT "7. Select knockout"
PRINT
PRINT "Q. Quit"
LOCATE 55, 1
COLOR 15

'**********************
'**********************
'**********************

PRINT "VELOCITY 2 SE"; TAB(20); "Release version (1.01)"; TAB(50); "Programmed by Matt Kimber"
COLOR 7
PRINT "Copyright (c) Matt Kimber, 1998"
LoadTrackSmall


DO

LOCATE 33, 1
PRINT "Maximum Speed:"; TAB(50); MaxSpeed * ScaleFactor; "     "
PRINT "Acceleration:"; TAB(50); Acceleration; "     "
PRINT "Average damage:"; "      "
LOCATE 35, 51
PRINT USING "##.##"; (GrassDamage + FloodDamage + MudDamage + BuildingDamage) / 4
PRINT "Maximum safe cornering speed:"; TAB(50); SkidThreshold * ScaleFactor; " "

COLOR 15
LOCATE 40, 45
PRINT "Track map:"
LOCATE 42, 1
PRINT "Seconds until screen saver:"; TAB(45); INT(ABS(120 - (TIMER - TC) + .3)); "    "
LOCATE 49, 1
PRINT "Track:"
COLOR 7
LOCATE 49, 20
PRINT TFName$ + STRING$(50 - LEN(TFName$), " ")
LOCATE 45, 1
COLOR 15
PRINT "Car Family:"
COLOR 7
LOCATE 45, 20
PRINT FamilyName + "             "
LOCATE 46, 1
COLOR 15
PRINT "Car:"
COLOR 7
LOCATE 46, 20
PRINT CarName + "                "
COLOR 15
LOCATE 47, 1
PRINT "Race Mode:"
LOCATE 47, 20
COLOR 7
PRINT GameModeName + "                  "
LOCATE 48, 1
COLOR 15
PRINT "Player 1 Name:"
COLOR 7
LOCATE 48, 20
PRINT PlayerName(0)
LOCATE 50, 1
COLOR 15
PRINT "Number of players:"
COLOR 7
LOCATE 50, 19
PRINT Players; "  "
COLOR 15
LOCATE 51, 1
PRINT "Weather:"
COLOR 7
LOCATE 51, 20
SELECT CASE Weather
CASE 1
PRINT "Dry"
CASE 2
PRINT "Wet"
CASE 3
PRINT "Icy"
END SELECT

LOCATE 52, 1
COLOR 15
PRINT "Beginner Mode:"
COLOR 7
LOCATE 52, 20
IF Beginner = 0 THEN PRINT "Off "
IF Beginner <> 0 THEN PRINT "On  "

IF GameMode > 2 AND Family > 5 THEN
Family = 1
Model = 1
TempString$ = LTRIM$(RTRIM$(STR$(Family))) + LTRIM$(RTRIM$(STR$(Model)))
Car = VAL(TempString$)
CarData
GetFamilyName
RESTORE Chord
PlaySound
END IF

k$ = UCASE$(INKEY$)

IF k$ <> "" THEN TC = TIMER

SELECT CASE k$

CASE "E"
CarEditMenu

CASE "S"
CarStats

CASE "?"
Help

CASE "!"
ScreenSaver

CASE "W"
Weather = Weather + 1
IF Weather > 3 THEN Weather = 1

CASE "B"
SELECT CASE Beginner
CASE 0
Beginner = -1
CASE -1
Beginner = 0
END SELECT

CASE "T"
COLOR 7
LOCATE 44, 1
PRINT STRING$(80, " ")
LOCATE 44, 1
INPUT "What is the filename of the track you wish to load"; TrackFileName
LOCATE 44, 1
PRINT STRING$(80, " ")
LoadTrackSmall

CASE "A"
RandomTrack
LoadTrackSmall

CASE "M"
SELECT CASE MapDiff
CASE 0
MapDiff = 1
MapName = "Map only"
CASE 1
MapDiff = 2
MapName = "No map"
CASE 2
MapDiff = 0
MapName = "Map and position marker"
END SELECT

CASE "N"
COLOR 7
LOCATE 48, 1
PRINT STRING$(80, " ")
LOCATE 48, 1
INPUT "What is your name"; PlayerName(0)
LOCATE 48, 1
PRINT STRING$(80, " ")
IF UCASE$(PlayerName(0)) = "WHOLE BUCKETLOADS OF TOADS" AND GameMode = 1 THEN PlayerName(0) = "Faster than a speeding bullet": Cheater = -1

CASE "F"
Family = Family + 1
IF Family > 6 THEN Family = 1
GetFamilyName
Model = 1
TempString$ = LTRIM$(RTRIM$(STR$(Family))) + LTRIM$(RTRIM$(STR$(Model)))
Car = VAL(TempString$)
CarData


CASE "C"
Model = Model + 1
IF Model > 6 THEN Model = 1
TempString$ = LTRIM$(RTRIM$(STR$(Family))) + LTRIM$(RTRIM$(STR$(Model)))
Car = VAL(TempString$)
CarData


CASE "G"
PlayersBackup = Players - 1
IF GameMode = 4 THEN MultiSetUp
IF GameMode = 5 THEN MultiSetUp
IF GameMode = 6 THEN MultiSetUp
IF GameMode = 7 THEN MultiSetUp
ResetVariables

CASE "+"
Players = Players + 1
IF Players > 35 THEN Players = 35

CASE "-"
Players = Players - 1
IF Players < 1 THEN Players = 1

CASE "1"
GameMode = 1
GameModeName = "Practice"

CASE "2"
GameMode = 2
GameModeName = "Improvement"

CASE "3"
GameMode = 3
GameModeName = "Time trials"

CASE "4"
GameMode = 4
GameModeName = "Tournament (P/P)"

CASE "5"
GameMode = 5
GameModeName = "Tournament (P/T)"

CASE "6"
GameMode = 6
GameModeName = "Tournament (Target)"

CASE "7"
GameMode = 7
GameModeName = "Knockout"
END SELECT
COLOR 15
IF TIMER - TC > 120 THEN ScreenSaver
IF GameMode <> 1 AND Cheater <> 0 THEN
PlayerName(0) = "Cheats never prosper!"
Cheater = 0
END IF
a = TIMER
DO
LOOP UNTIL TIMER - a > .05
LOOP UNTIL k$ = "Q" OR k$ = CHR$(27)
GoodByeScreen
END SUB

SUB MakeSkid
IF Speed > SkidThreshold THEN
TempVal = Speed - SkidThreshold

TurnDecay = TempVal * SkidSize
END IF

END SUB

SUB MovePlayer
      
        Y2 = Y2 + YAccel
        IF Y2 < 0 THEN Y = Y - 1: Y2 = Y2 + 59
        IF Y2 > 59 THEN Y = Y + 1: Y2 = Y2 - 59

        X2 = X2 + XAccel

        IF X2 < 0 THEN X = X - 1: X2 = X2 + 59
        IF X2 > 59 THEN X = X + 1: X2 = X2 - 59

        IF X > 74 THEN X = 74: X2 = 59
        IF X < 0 THEN X = 0: X2 = 0
        IF Y > 74 THEN Y = 74: Y2 = 59
        IF Y < 0 THEN Y = 0: Y2 = 0

END SUB

SUB MultiSetUp
SCREEN 0
WIDTH 80, 25
CLS
IF Players = 1 THEN
PRINT "Number of players increased to 2.  Press a key"
Players = 2
DO
LOOP WHILE INKEY$ = ""
CLS
END IF
REDIM PlayerName(Players - 1) AS STRING
REDIM PlayerTime(Players - 1) AS SINGLE
REDIM Points(Players - 1) AS INTEGER
REDIM PlayerCar(Players - 1) AS INTEGER
        FOR a = 0 TO Players - 1
        PlayerName(a) = ""
        PlayerTime(a) = 999.99
        Points(a) = 0
        PlayerCar(a) = 0
        NEXT a
        FOR a = 0 TO Players - 1
        CLS
        LOCATE 1, 1
        COLOR 7
        PRINT "Player"; (a + 1)
        PRINT
        INPUT "What is your name"; PlayerName(a)
        PRINT
        PRINT "Please select a car..."
        PRINT "C cycles available cars, any other key selects"
        DO
        k$ = UCASE$(INKEY$)
        LOCATE 8, 1
        COLOR 15
        PRINT "Current car:"
        COLOR 7
                IF k$ = "C" THEN
                Model = Model + 1
                IF Model > 6 THEN Model = 1
                TempString$ = LTRIM$(RTRIM$(STR$(Family))) + LTRIM$(RTRIM$(STR$(Model)))
                Car = VAL(TempString$)
                PlayerCar(a) = Car
                CarData
                END IF
        PRINT CarName; "                "

        LOOP WHILE k$ = "" OR k$ = "C"
                TempString$ = LTRIM$(RTRIM$(STR$(Family))) + LTRIM$(RTRIM$(STR$(Model)))
                Car = VAL(TempString$)
                PlayerCar(a) = Car
                CarData
        NEXT a
END SUB

SUB PauseMe (SecondsToPause AS DOUBLE)
TC = TIMER
DO
LOOP UNTIL TIMER - TC > SecondsToPause
END SUB

FUNCTION PCSpdMax
PCSpdMax = ((Speed / MaxSpeed) * 100) + .2
END FUNCTION

FUNCTION PCSpdMaxDam
PCSpdMaxDam = (Speed / (MaxSpeed - (Damage / 6))) * 100 + .2

END FUNCTION

SUB PlaySound
IF SoundOn <> 0 THEN
READ NoOfNotes
FOR a = 1 TO NoOfNotes
TC = TIMER
FOR j = 0 TO 2
READ octave(j)
READ note$(j)
NEXT j
READ Duration(0)
READ Duration(1)

DO
FOR j = 0 TO 2
PLAY "l64MFO" + LTRIM$(STR$(octave(j)))
PLAY note$(j)
NEXT j

LOOP UNTIL TIMER - TC > (Duration(0) - Duration(1))
PauseMe Duration(1)
NEXT a
END IF
END SUB

SUB PointsPosition
Played = -1
SCREEN 0
WIDTH 80, 43
CLS
COLOR 15
TempString$ = "Sorting"
FOR a = 0 TO Players - 1
        FOR b = 0 TO Players - 2
                TempString$ = TempString$ + "."
                IF Points(b) < Points(b + 1) THEN
                        SWAP Points(b), Points(b + 1)
                        SWAP PlayerName(b), PlayerName(b + 1)
                        SWAP PlayerCar(b), PlayerCar(b + 1)
                        SWAP PlayerTime(b), PlayerTime(b + 1)
                END IF
                LOCATE 1, 1
                PRINT TempString$
        NEXT b
NEXT a
CLS
LOCATE 1, 1
PRINT "Current standings:                                                          "
COLOR 14
PRINT "Name"; TAB(45); "Points"
PRINT
COLOR 7
FOR a = 0 TO Players - 1
PRINT LTRIM$(RTRIM$(STR$(a + 1))); ". "; PlayerName(a); TAB(45); Points(a)
NEXT a
PRINT
COLOR 15
PRINT "Continue tournament (y/n)?"
DO
k$ = UCASE$(INKEY$)
LOOP WHILE k$ <> "Y" AND k$ <> "N"
IF k$ = "Y" THEN
        PRINT
        COLOR 7
        PRINT "Press enter to select a track at random"
        INPUT "What is the name of the track you wish to race on next"; TrackFileName
        IF TrackFileName = "" THEN RandomTrack
        COLOR 15
END IF
IF k$ = "N" THEN
        SCREEN 13
        CLS
        REDIM Picture(100 * 200) AS INTEGER
        OffSet = VARPTR(Picture(0))
        Segment = VARSEG(Picture(0))
        DEF SEG = Segment
        BLOAD "FRONTEND/TOURNY.FE", OffSet
        PUT (60, 0), Picture
        LOCATE 15, 1
        FOR a = 0 TO Players - 1
        PRINT LTRIM$(RTRIM$(STR$(a + 1))); ". "; PlayerName(a); TAB(35); Points(a)
        IF a > 5 THEN EXIT FOR
        NEXT a
        LOCATE 13, 1
        PRINT "Top"; a; "players and their points"
        DO
        LOOP WHILE INKEY$ = ""
        CLS
        OffSet = VARPTR(Picture(0))
        Segment = VARSEG(Picture(0))
        DEF SEG = Segment
        BLOAD "FRONTEND/WIN.FE", OffSet
        PUT (60, 0), Picture
        LOCATE 13, 20 - INT((LEN(PlayerName(0) + " won the tournament!") / 2))
        PRINT PlayerName(0); " won the tournament!"
        DO
        LOOP WHILE INKEY$ = ""
        CLS
        OffSet = VARPTR(Picture(0))
        Segment = VARSEG(Picture(0))
        DEF SEG = Segment
        BLOAD "FRONTEND/LOSE.FE", OffSet
        PUT (60, 0), Picture

        LOCATE 14, 20 - INT((LEN(PlayerName(Players - 1) + " came last.") / 2))
        PRINT PlayerName(Players - 1); " came last."
        DO
        LOOP WHILE INKEY$ = ""
        MainMenu
END IF
WIDTH 80, 25
GivePointsPP
END SUB

SUB PointsTime
Played = -1
SCREEN 0
WIDTH 80, 43
CLS
COLOR 15
TempString$ = "Sorting"
FOR a = 0 TO Players - 1
        FOR b = 0 TO Players - 2
                TempString$ = TempString$ + "."
                IF Points(b) < Points(b + 1) THEN
                        SWAP Points(b), Points(b + 1)
                        SWAP PlayerName(b), PlayerName(b + 1)
                        SWAP PlayerCar(b), PlayerCar(b + 1)
                        SWAP PlayerTime(b), PlayerTime(b + 1)
                END IF
                LOCATE 1, 1
                PRINT TempString$
        NEXT b
NEXT a
CLS
LOCATE 1, 1
PRINT "Current standings:                                                          "
COLOR 14
PRINT "Name"; TAB(45); "Points"
PRINT
COLOR 7
FOR a = 0 TO Players - 1
PRINT LTRIM$(RTRIM$(STR$(a + 1))); ". "; PlayerName(a); TAB(45); Points(a)
NEXT a
PRINT
COLOR 15
PRINT "Continue tournament (y/n)?"
DO
k$ = UCASE$(INKEY$)
LOOP WHILE k$ <> "Y" AND k$ <> "N"
IF k$ = "Y" THEN
        PRINT
        COLOR 7
        PRINT "Press enter to select a track at random"
        INPUT "What is the name of the track you wish to race on next"; TrackFileName
        IF TrackFileName = "" THEN RandomTrack
        COLOR 15
END IF
IF k$ = "N" THEN
        SCREEN 13
        CLS
        REDIM Picture(100 * 200) AS INTEGER
        OffSet = VARPTR(Picture(0))
        Segment = VARSEG(Picture(0))
        DEF SEG = Segment
        BLOAD "FRONTEND/TOURNY.FE", OffSet
        PUT (60, 0), Picture
        LOCATE 15, 1
        FOR a = 0 TO Players - 1
        PRINT LTRIM$(RTRIM$(STR$(a + 1))); ". "; PlayerName(a); TAB(35); Points(a)
        IF a > 5 THEN EXIT FOR
        NEXT a
        LOCATE 13, 1
        PRINT "Top"; a; "players and their points"
        DO
        LOOP WHILE INKEY$ = ""
        CLS
        OffSet = VARPTR(Picture(0))
        Segment = VARSEG(Picture(0))
        DEF SEG = Segment
        BLOAD "FRONTEND/WIN.FE", OffSet
        PUT (60, 0), Picture
        LOCATE 13, 20 - INT((LEN(PlayerName(0) + " won the tournament!") / 2))
        PRINT PlayerName(0); " won the tournament!"
        DO
        LOOP WHILE INKEY$ = ""
        CLS
        OffSet = VARPTR(Picture(0))
        Segment = VARSEG(Picture(0))
        DEF SEG = Segment
        BLOAD "FRONTEND/LOSE.FE", OffSet
        PUT (60, 0), Picture

        LOCATE 14, 20 - INT((LEN(PlayerName(Players - 1) + " came last.") / 2))
        PRINT PlayerName(Players - 1); " came last."
        DO
        LOOP WHILE INKEY$ = ""
        MainMenu
END IF
WIDTH 80, 25
GivePointsPT

END SUB

SUB PrintDash
        LOCATE 1, 5
        PRINT CarName; TAB(60); FamilyName

        IF Crash = 0 THEN
        PUT (20, 80), NumSpeed, PSET
        PrintNums 20, 100, INT(Speed * ScaleFactor), 0
        END IF
        LINE (40, 240 - PCSpdMax)-(60, 240 - PCSpdMax), 9
        LINE (70, 240 - PCSpdMaxDam)-(90, 240 - PCSpdMaxDam), 11


       
        SELECT CASE Angle
        CASE 0
        PUT (120, 300), CompassN, PSET
        CASE 45
        PUT (120, 300), CompassNE, PSET
        CASE 90
        PUT (120, 300), CompassE, PSET
        CASE 135
        PUT (120, 300), CompassSE, PSET
        CASE 180
        PUT (120, 300), CompassS, PSET
        CASE 225
        PUT (120, 300), CompassSW, PSET
        CASE 270
        PUT (120, 300), CompassW, PSET
        CASE 315
        PUT (120, 300), CompassNW, PSET
        END SELECT
       
        IF Crash = 0 THEN
        PUT (480, 80), NumDamage, PSET
        PrintNums 480, 100, INT(Damage), -1
        END IF
        LINE (500, 240 - Damage)-(530, 240 - Damage), 4
'210   310
       
        PUT (170, 310), NumTime, PSET
        TempVal = Time2DP
        PUT (315, 310), NumSeconds, PSET
       
        SlowName = STRING$(TooSlow, ">")
        LOCATE 22, 60
        COLOR 12
        PRINT SlowName
        COLOR 7
END SUB

SUB PrintNums (XOffset AS INTEGER, YOffset AS INTEGER, Number AS SINGLE, UsePercent AS INTEGER)
TempString2$ = LTRIM$(RTRIM$(STR$(Number)))
FOR e = 1 TO LEN(TempString2$)
IF MID$(TempString2$, e, 1) = "1" THEN PUT (XOffset + ((e - 1) * 20), YOffset), Num1, PSET
IF MID$(TempString2$, e, 1) = "2" THEN PUT (XOffset + ((e - 1) * 20), YOffset), Num2, PSET
IF MID$(TempString2$, e, 1) = "3" THEN PUT (XOffset + ((e - 1) * 20), YOffset), Num3, PSET
IF MID$(TempString2$, e, 1) = "4" THEN PUT (XOffset + ((e - 1) * 20), YOffset), Num4, PSET
IF MID$(TempString2$, e, 1) = "5" THEN PUT (XOffset + ((e - 1) * 20), YOffset), Num5, PSET
IF MID$(TempString2$, e, 1) = "6" THEN PUT (XOffset + ((e - 1) * 20), YOffset), Num6, PSET
IF MID$(TempString2$, e, 1) = "7" THEN PUT (XOffset + ((e - 1) * 20), YOffset), Num7, PSET
IF MID$(TempString2$, e, 1) = "8" THEN PUT (XOffset + ((e - 1) * 20), YOffset), Num8, PSET
IF MID$(TempString2$, e, 1) = "9" THEN PUT (XOffset + ((e - 1) * 20), YOffset), Num9, PSET
IF MID$(TempString2$, e, 1) = "0" THEN PUT (XOffset + ((e - 1) * 20), YOffset), Num0, PSET
IF MID$(TempString2$, e, 1) = "." THEN PUT (XOffset + ((e - 1) * 20), YOffset), NumFS, PSET
NEXT e
IF UsePercent <> 0 THEN PUT (XOffset + (e * 20), YOffset), NumPC, PSET
END SUB

SUB PrintNums2 (XOffset AS INTEGER, YOffset AS INTEGER, TempString2 AS STRING)

FOR e = 1 TO LEN(TempString2)
IF MID$(TempString2, e, 1) = "1" THEN PUT (XOffset + ((e - 1) * 20), YOffset), Num1, PSET
IF MID$(TempString2, e, 1) = "2" THEN PUT (XOffset + ((e - 1) * 20), YOffset), Num2, PSET
IF MID$(TempString2, e, 1) = "3" THEN PUT (XOffset + ((e - 1) * 20), YOffset), Num3, PSET
IF MID$(TempString2, e, 1) = "4" THEN PUT (XOffset + ((e - 1) * 20), YOffset), Num4, PSET
IF MID$(TempString2, e, 1) = "5" THEN PUT (XOffset + ((e - 1) * 20), YOffset), Num5, PSET
IF MID$(TempString2, e, 1) = "6" THEN PUT (XOffset + ((e - 1) * 20), YOffset), Num6, PSET
IF MID$(TempString2, e, 1) = "7" THEN PUT (XOffset + ((e - 1) * 20), YOffset), Num7, PSET
IF MID$(TempString2, e, 1) = "8" THEN PUT (XOffset + ((e - 1) * 20), YOffset), Num8, PSET
IF MID$(TempString2, e, 1) = "9" THEN PUT (XOffset + ((e - 1) * 20), YOffset), Num9, PSET
IF MID$(TempString2, e, 1) = "0" THEN PUT (XOffset + ((e - 1) * 20), YOffset), Num0, PSET
IF MID$(TempString2, e, 1) = "." THEN PUT (XOffset + ((e - 1) * 20), YOffset), NumFS, PSET
NEXT e

END SUB

SUB RandomTrack
Temp = INT(RND * (NoOfTracks - 1)) + 1
OPEN "TRACKS/Tracks.txt" FOR INPUT AS #1
FOR a = 1 TO Temp
LINE INPUT #1, TempString$
NEXT a
LINE INPUT #1, TempString$
IF NOT LEFT$(TempString$, 1) = " " OR TempString$ = "" THEN
TempString$ = LEFT$(TempString$, 8)
TrackFileName = RTRIM$(TempString$)
ELSE
TrackFileName = "Track1"
END IF
CLOSE #1
END SUB

SUB ReadTrackData
SCREEN 9, 0, 0, 0
OPEN "TRACKS/" + TrackFileName + ".NFO" FOR INPUT AS #1
LINE INPUT #1, TFName$
FOR i = 0 TO 10
INPUT #1, CHeckpoints(i, 0), CHeckpoints(i, 1)
NEXT i
INPUT #1, Start(0), Start(1)
INPUT #1, Finish(0), Finish(1)
CLOSE #1

OPEN "TRACKS/" + TrackFileName + ".MAP" FOR BINARY AS #1
c = 1
FOR a = 0 TO 80
        FOR b = 0 TO 80
        GET #1, c, Track(a, b)
        c = c + 2
        NEXT b
NEXT a
CLOSE #1
FOR i = 0 TO 10
IF CHeckpoints(i, 0) = 0 OR CHeckpoints(i, 1) = 0 THEN CHeckpoints(i, 2) = -1 ELSE CHeckpoints(i, 2) = 0
NEXT i

COLOR 15
CT "Press a key", 13
DO
LOOP WHILE INKEY$ = ""
SCREEN 0
CLS
END SUB

SUB RecordTimes
SCREEN 0
WIDTH 80, 43
CLS
PauseMe .4
COLOR 15
CT "Record times for this track", 1
PRINT
REDIM PlayerTime(0) AS SINGLE
PlayerTime(0) = TimeTaken
OPEN "TRACKS/" + TrackFileName + ".hsc" FOR INPUT AS #1
OPEN "High.tmp" FOR OUTPUT AS #2
Beaten = 0
FOR b = 1 TO 12
        RESTORE Chord
        PlaySound
        IF Skip = 0 THEN INPUT #1, Who$, TheirCarFamily$, TheirCar$, TheirTime$
        Skip = 0
        IF PlayerTime(0) < VAL(LEFT$(TheirTime$, 6)) AND Beaten = 0 THEN
        PRINT #2, PlayerName(0)
        PRINT #2, FamilyName
        PRINT #2, CarName
        PRINT #2, USING "###.##"; PlayerTime(0)
        COLOR 15
        COLOR 12: PRINT LTRIM$(RTRIM$(STR$(b))) + "."; TAB(5); PlayerName(0); TAB(40); LTRIM$(LEFT$(STR$(PlayerTime(0)), 6))
        COLOR 14
        PRINT TAB(5); FamilyName; TAB(25); CarName
        Beaten = 1
        Skip = 1
END IF
COLOR 15
IF Skip = 0 THEN PRINT LTRIM$(RTRIM$(STR$(b))) + "."; TAB(5); Who$; TAB(40); TheirTime$
COLOR 14
IF Skip = 0 THEN PRINT TAB(5); TheirCarFamily$; TAB(25); TheirCar$
PRINT
IF Skip = 0 THEN PRINT #2, Who$
IF Skip = 0 THEN PRINT #2, TheirCarFamily$
IF Skip = 0 THEN PRINT #2, TheirCar$
IF Skip = 0 THEN PRINT #2, TheirTime$
NEXT b
CLOSE #1
CLOSE #2
KILL "TRACKS/" + TrackFileName + ".hsc"
NAME "high.tmp" AS "TRACKS/" + TrackFileName + ".hsc"
PRINT
COLOR 15
PRINT "Press a key"
DO
LOOP WHILE INKEY$ = ""
END SUB

SUB ResetSoundcard
FOR i = 0 TO 224
  SetReg i, 0
NEXT i
SetReg &H20, &H1
SetReg &H23, &H1
SetReg &H40, &H1F
SetReg &H43, &H0
SetReg &H60, &HE4
SetReg &H63, &HE4
SetReg &H80, &H9D
SetReg &H83, &H9D
SetReg &H21, &H1
SetReg &H24, &H1
SetReg &H41, &H1F
SetReg &H44, &H0
SetReg &H61, &HE4
SetReg &H64, &HE4
SetReg &H81, &H9D
SetReg &H84, &H9D
SetReg &H22, &H1
SetReg &H25, &H1
SetReg &H42, &H1F
SetReg &H45, &H0
SetReg &H62, &HE4
SetReg &H65, &HE4
SetReg &H82, &H9D
SetReg &H85, &H9D

END SUB

SUB ResetVariables
CLS
IF GameMode <> 1 AND Traffic <> 0 THEN Traffic = 0
IF GameMode <> 1 AND Beginner <> 0 THEN Beginner = 0
IF GameMode = 4 THEN PointsPosition
IF GameMode = 5 THEN PointsTime
IF GameMode = 6 THEN Target
IF GameMode = 7 THEN Knockout
WIDTH 80, 25
IF Family < 6 THEN CarData
IF GameMode = 1 THEN
SELECT CASE Weather
CASE 1

CASE 2
Acceleration = (Acceleration / 20) * 19
Braking = (Braking / 5) * 3
SkidDecay = SkidDecay - .5
IF SkidDecay < 1.1 THEN SkidDecay = 1.1
SkidSize = (SkidSize / 3) * 4
SkidThreshold = (SkidThreshold / 4) * 3

CASE 3
Acceleration = (Acceleration / 20) * 17
Braking = (Braking / 8) * 2.5
SkidDecay = SkidDecay - 1
IF SkidDecay < 1.1 THEN SkidDecay = 1.1
SkidSize = (SkidSize * 4)
SkidThreshold = SkidThreshold / 2
END SELECT
END IF
ExplodeLength = 0
Bounce = 6
Invincible = 0
RANDOMIZE TIMER
X2 = 30
Y2 = 30
Crash = 0
Speed = 0
Angle = 0
Damage = 0
SkidX = 0
SkidY = 0
TurnDecay = 0
LoadCar
ReadTrackData
IF GameMode = 2 THEN InitImprove
IF Cheater <> 0 THEN MaxSpeed = 60: SkidThreshold = 60: GrassSpeed = 60
X = Start(0) - 5
Y = Start(1) - 3
SkidCheck = TIMER
InitScreen
RunGame
END SUB

SUB RunGame
        DrawTrack
        DrawBorder
        DrawVehicle
        PCOPY 0, 1
RESTORE StartTune
PlaySound
StartLights
StartTime = TIMER
DO
        TooSlow = TIMER - TC
        TC = TIMER
        IF Crash = 0 THEN
        TooSlow = TooSlow - .17
        IF TooSlow < 0 THEN TooSlow = 0
        IF TooSlow > .1 THEN TooSlow = .1
        TooSlow = TooSlow * 100
        END IF
        IF Crash = 0 THEN
        DrawTrack
        DrawBorder
        END IF
        PrintDash
        GetKey
        UseInput
        IF Crash = 0 THEN CheckSurface: DrawVehicle
        IF Damage = 100 THEN Explosion
        PCOPY 0, 1
        IF Crash <> 0 THEN Speed = 0
        IF Crash <> 0 THEN Angle = 0
        MovePlayer
        IF GetKeys$ = "Restart" THEN
        IF GameMode = 1 THEN ResetVariables
        END IF
        DO
        LOOP UNTIL TIMER - TC > .15

LOOP UNTIL GetKeys$ = "Quit"
IF GameMode = 2 THEN CheckImprove: ResetVariables
IF GameMode = 3 THEN RecordTimes

IF GameMode = 4 THEN GivePointsPP
IF GameMode = 5 THEN GivePointsPT
IF GameMode = 6 THEN GivePointsTG
IF GameMode = 7 THEN GivePointsPP

MainMenu
END SUB

SUB SaveCEF
SCREEN 0
WIDTH 80, 25
CLS
COLOR 15
INPUT "What filename (no extension) do you want to save your car under"; EditFile
OPEN EditFile + ".CEF" FOR OUTPUT AS #1
PRINT #1, "// Car Name"
PRINT #1, CarName
PRINT #1, "// Maximum speed"
PRINT #1, MaxSpeed * ScaleFactor
PRINT #1, "// Maximum grass speed"
PRINT #1, GrassSpeed * ScaleFactor
PRINT #1, "// Grass damage index"
PRINT #1, GrassDamage * 100
PRINT #1, "// Flood damage index"
PRINT #1, FloodDamage * 100
PRINT #1, "// Mud damage index"
PRINT #1, MudDamage * 100
PRINT #1, "// Building damage index"
PRINT #1, BuildingDamage * 100
PRINT #1, "// Repair speed index"
PRINT #1, RepairSpeed * 10
PRINT #1, "// Acceleration index"
PRINT #1, Acceleration
PRINT #1, "// Braking index"
PRINT #1, Braking
PRINT #1, "// Maximum safe cornering speed"
PRINT #1, SkidThreshold * ScaleFactor
PRINT #1, "// Slide magnitude"
PRINT #1, SkidSize
PRINT #1, "// Slide decay"
PRINT #1, SkidDecay
PRINT #1, "// Picture file (SAL/SUP/TRK/PUP)"
PRINT #1, CarFile
PRINT
CLOSE #1
PRINT "Done."
PRINT "To edit your car, open the .CEF file in a text editor"
PRINT "Press a key"
DO
LOOP WHILE INKEY$ = ""
CarEditMenu
END SUB

SUB ScreenSaver
CarColour = INT(RND * 7)
IF CarColour = 0 THEN CarColour = 7
IF CarColour = 3 THEN CarColour = 7
X = 85
Y = 85
XAccel = 0
YAccel = 0
a = 0
FOR b = 0 TO INT(RND * 20) + 10
a = a + 1
IF a > 4 THEN a = 0
IF a = 1 THEN CarFile = "Sal"
IF a = 2 THEN CarFile = "Sup"
IF a = 3 THEN CarFile = "Trk"
IF a = 4 THEN CarFile = "Pup"
NEXT b
LoadCar
SCREEN 9, 0, 1, 0
WIDTH 80, 25
CLS
YAccel = 2
XAccel = 2
Angle = 0
DO
SCREEN 9, 0, 1, 0
a = a + 1
X = X + XAccel
Y = Y + YAccel
IF X > 538 OR X < 62 THEN XAccel = -XAccel
IF Y > 278 OR Y < 62 THEN YAccel = -YAccel
IF a > 10 THEN Angle = Angle + 45: a = 0
IF Angle > 315 THEN Angle = 0
LINE (X - 3, Y - 3)-(X + 23, Y + 23), 0, BF
'************
'LOCATE 1, 1
'PRINT Angle
'PauseMe .5

SELECT CASE Angle
CASE 0
PUT (X, Y), Car0, PSET

CASE 45
PUT (X, Y), Car45, PSET

CASE 90
PUT (X, Y), Car90, PSET

CASE 135
PUT (X, Y), Car135, PSET

CASE 180
PUT (X, Y), Car180, PSET

CASE 225
PUT (X, Y), Car225, PSET

CASE 270
PUT (X, Y), Car270, PSET

CASE 315
PUT (X, Y), Car315, PSET
END SELECT
PCOPY 1, 0
PauseMe .01
LOOP WHILE INKEY$ = ""
CarData
MainMenu
END SUB

DEFINT A-Z
SUB SetReg (Reg, Value)
OUT RegAddr, Reg
OUT DataAddr, Value

END SUB

DEFSNG A-Z
SUB SmallReset
WIDTH 80, 25
Bounce = 6
Invincible = 0
RANDOMIZE TIMER
X2 = 30
Y2 = 30
Crash = 0
Speed = 0
Angle = 0
Damage = 0
SkidX = 0
SkidY = 0
TurnDecay = 0
LoadCar
ReadTrackData
ExplodeLength = 0
X = Start(0) - 5
Y = Start(1) - 3
SkidCheck = TIMER
InitScreen
RunGame

END SUB

SUB StartLights
FOR b = 0 TO 4
LINE (10, 5)-(180, 55), 0, BF
FOR a = 0 TO (120 - (b * 30)) STEP 30
LINE (20 + a, 10)-(40 + a, 50), 12, BF
NEXT a
PCOPY 0, 1
PauseMe .2
NEXT b

FOR b = 0 TO 4
LINE (10, 5)-(180, 55), 0, BF
FOR a = 0 TO (0 + (b * 30)) STEP 30
LINE (20 + a, 10)-(40 + a, 50), 14, BF
NEXT a
PCOPY 0, 1
PauseMe .2
NEXT b

PauseMe .3

FOR a = 0 TO 120 STEP 30
LINE (20 + a, 10)-(40 + a, 50), 10, BF
NEXT a
PCOPY 0, 1
PauseMe .1
END SUB

SUB Target
Played = -1
SCREEN 0
WIDTH 80, 43
CLS
COLOR 15
TempString$ = "Sorting"
FOR a = 0 TO Players - 1
        FOR b = 0 TO Players - 2
                TempString$ = TempString$ + "."
                IF Points(b) < Points(b + 1) THEN
                        SWAP Points(b), Points(b + 1)
                        SWAP PlayerName(b), PlayerName(b + 1)
                        SWAP PlayerCar(b), PlayerCar(b + 1)
                        SWAP PlayerTime(b), PlayerTime(b + 1)
                END IF
                LOCATE 1, 1
                PRINT TempString$
        NEXT b
NEXT a
CLS
LOCATE 1, 1
PRINT "Current standings:                                                          "
COLOR 14
PRINT "Name"; TAB(45); "Points"
PRINT
COLOR 7
FOR a = 0 TO Players - 1
PRINT LTRIM$(RTRIM$(STR$(a + 1))); ". "; PlayerName(a); TAB(45); Points(a)
NEXT a
PRINT
COLOR 15
PRINT "Continue tournament (y/n)?"
DO
k$ = UCASE$(INKEY$)
LOOP WHILE k$ <> "Y" AND k$ <> "N"
IF k$ = "Y" THEN
        COLOR 15
        PRINT
        IF InProgress = 0 THEN TargetTime = 100
        IF InProgress = -1 THEN TargetTime = INT(PlayerTime(Players - 1)) + 9
        InProgress = -1
        PRINT "The target time is"; TargetTime; "seconds."
        PRINT
        COLOR 7
        PRINT "Press enter to select a track at random"
        INPUT "What is the name of the track you wish to race on next"; TrackFileName
        IF TrackFileName = "" THEN RandomTrack
END IF
IF k$ = "N" THEN
        SCREEN 13
        CLS
        REDIM Picture(100 * 200) AS INTEGER
        OffSet = VARPTR(Picture(0))
        Segment = VARSEG(Picture(0))
        DEF SEG = Segment
        BLOAD "FRONTEND/TOURNY.FE", OffSet
        PUT (60, 0), Picture
        LOCATE 15, 1
        FOR a = 0 TO Players - 1
        PRINT LTRIM$(RTRIM$(STR$(a + 1))); ". "; PlayerName(a); TAB(35); Points(a)
        IF a > 5 THEN EXIT FOR
        NEXT a
        LOCATE 13, 1
        PRINT "Top"; a; "players and their points"
        DO
        LOOP WHILE INKEY$ = ""
        CLS
        OffSet = VARPTR(Picture(0))
        Segment = VARSEG(Picture(0))
        DEF SEG = Segment
        BLOAD "FRONTEND/WIN.FE", OffSet
        PUT (60, 0), Picture
        LOCATE 13, 20 - INT((LEN(PlayerName(0) + " won the tournament!") / 2))
        PRINT PlayerName(0); " won the tournament!"
        DO
        LOOP WHILE INKEY$ = ""
        CLS
        OffSet = VARPTR(Picture(0))
        Segment = VARSEG(Picture(0))
        DEF SEG = Segment
        BLOAD "FRONTEND/LOSE.FE", OffSet
        PUT (60, 0), Picture

        LOCATE 14, 20 - INT((LEN(PlayerName(Players - 1) + " came last.") / 2))
        PRINT PlayerName(Players - 1); " came last."
        DO
        LOOP WHILE INKEY$ = ""
        MainMenu
END IF
WIDTH 80, 25
GivePointsTG

END SUB

FUNCTION Time2DP

TempString$ = LTRIM$(RTRIM$(STR$(TimeTaken)))
IF VAL(TempString$) = INT(VAL(TempString$)) THEN TempString$ = TempString$ + ".0000"
TempString$ = LEFT$(TempString$, 5)
PrintNums2 210, 310, TempString$

END FUNCTION

SUB TitleScreen
SCREEN 13
CLS
REDIM Picture(32000) AS INTEGER
OffSet = VARPTR(Picture(0))
Segment = VARSEG(Picture(0))
DEF SEG = Segment
BLOAD "FRONTEND/V2_LOGO.FE", OffSet
DEF SEG
FOR a = 0 TO 99 STEP 2
PUT (10, a), Picture, PSET
IF INKEY$ <> "" THEN CLS : PUT (10, 99), Picture: GOTO EndIntro
PauseMe .001
NEXT a
EndIntro:
OffSet = VARPTR(Picture(0))
Segment = VARSEG(Picture(0))
DEF SEG = Segment
PauseMe .2
BLOAD "FRONTEND/SE_LOGO.FE", OffSet
PUT (10, 99), Picture, PSET
REDIM Picture(1) AS INTEGER
DEF SEG
RESTORE IntroTune
PlaySound
IF SoundOn = 0 THEN PauseMe .7
MainMenu
END SUB

SUB UseInput
SafeSpeed = 0
IF SpriteJump = 0 THEN
IF Bounce > 5 THEN
IF PCSpdMaxDam <> 100 THEN SafeSpeed = -1
IF GetKeys$ = "Up" THEN Speed = Speed + Acceleration: IF Speed > (MaxSpeed - (Damage / 6)) AND SafeSpeed = 0 THEN Speed = (MaxSpeed - (Damage / 6)): Damage = Damage + .35
IF GetKeys$ = "Down" THEN Speed = Speed - Braking: IF Speed < 0 THEN Speed = 0
IF GetKeys$ = "Equal" THEN
IF OnRoad <> 0 AND ABS(SpeedLimit - Speed) <= Acceleration THEN
Speed = SpeedLimit
END IF
END IF
END IF

IF Speed > (MaxSpeed - (Damage / 6)) THEN Speed = (MaxSpeed - (Damage / 6))

IF GetKeys$ = "Right" THEN
        IF TIMER - SkidCheck > .15 THEN
        PreviousAngle = Angle
        SkidCheck = TIMER
        END IF
Angle = Angle + 45
IF Angle > 315 THEN Angle = 0
MakeSkid
END IF
IF GetKeys$ = "Left" THEN
        IF TIMER - SkidCheck > .15 THEN
        PreviousAngle = Angle
        SkidCheck = TIMER
        END IF
Angle = Angle - 45
IF Angle < 0 THEN Angle = 315
MakeSkid
END IF
END IF

IF Angle = 0 THEN YAccel = -Speed: XAccel = 0
IF Angle = 45 THEN YAccel = -Speed / 2: XAccel = Speed / 2
IF Angle = 90 THEN YAccel = 0: XAccel = Speed
IF Angle = 135 THEN YAccel = Speed / 2: XAccel = Speed / 2
IF Angle = 180 THEN YAccel = Speed: XAccel = 0
IF Angle = 225 THEN YAccel = Speed / 2: XAccel = -Speed / 2
IF Angle = 270 THEN YAccel = 0: XAccel = -Speed
IF Angle = 315 THEN YAccel = -Speed / 2: XAccel = -Speed / 2

IF INT(TurnDecay) > 0 THEN
IF PreviousAngle = 0 THEN SkidY = -TurnDecay: SkidX = 0
IF PreviousAngle = 45 THEN SkidY = -TurnDecay / 2: SkidX = TurnDecay / 2
IF PreviousAngle = 90 THEN SkidY = 0: SkidX = TurnDecay
IF PreviousAngle = 135 THEN SkidY = TurnDecay / 2: SkidX = TurnDecay / 2
IF PreviousAngle = 180 THEN SkidY = TurnDecay: SkidX = 0
IF PreviousAngle = 225 THEN SkidY = TurnDecay / 2: SkidX = -TurnDecay / 2
IF PreviousAngle = 270 THEN SkidY = 0: SkidX = -TurnDecay
IF PreviousAngle = 315 THEN SkidY = -TurnDecay / 2: SkidX = -TurnDecay / 2
TurnDecay = TurnDecay / SkidDecay
END IF
IF INT(TurnDecay) <= 0 THEN TurnDecay = 0: SkidX = 0: SkidY = 0
IF Speed > (SkidThreshold / 2) THEN
XAccel = XAccel + SkidX
YAccel = YAccel + SkidY
END IF
END SUB

