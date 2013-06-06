; States file for Parasite -- Overrides and Common states
;
;---------------------------------------------------------------------------
; Vars:
;   0: for Super Jump direction (0=vertical, 1=forward, -1=backward) (states 700-701)
;   1: StateDef 760,761 (flight)
;   1: for superjump sparks (state 701)
;   2: keep track of attack strength for stolen powers w/ variable effects
;   3: keep track of power level (for levelup sounds) (state -3)
;   4: for flight mode (state 761)
;  15: Deadpool resurrection counter
;  17: Invisibility mode
;  18: " "
;  47: Keeps track of who the opponent is (for intro 192 and for the AI)
;  48: Desperation quote ("DANGER!" or whatever)
;  49: Power slot determiner (for feeding time)
;  50: Power slot #1
;  51: Power slot #2
;  59: AI flag
;
; Var(6) - Statedef 2100 (kryptonite ray color selection)
; Var(7) - StateDef 2572
; Var(8) - StateDef 2640 (deadpool taunt selection)
; Var(10) - StateDef 2572, 3075, 3079, -2
; Var(15) - StateDef 3641, 3645
; Var(16) - StateDef 40, 45, 699
; Var(17) - StateDef 2670, 2671, -3
; Var(18) - StateDef -3
; Var(20) - StateDef 3062
; Var(49) - StateDef 1000, 1001, 1011, 1012, 3611, -3

;--------------------- Float Variable List ----------------------

; fVar(0) - StateDef 2980
; fVar(2) - StateDef 2111, 3055, 3132
; fVar(3) - StateDef 3055, 3132



;---------------------------------------------------------------------------
; Override common states (use same number to override) :
;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
; Stand (overridden for Lobo clone hyper, Superman passive power-charge)
[Statedef 0]
type = S
physics = S
sprpriority = 0

[State 0, 1]
type = ChangeAnim
trigger1 = Anim != 0 && Anim != 5
trigger2 = Anim = 5 && AnimTime = 0 ;Turn anim over
value = 0

[State 0, 2]
type = VelSet
trigger1 = Time = 0
y = 0

[State 0, 3] ;Stop moving if low velocity or 4 ticks pass
type = VelSet
trigger1 = abs(vel x) < 2
trigger2 = Time = 4
x = 0

[State 0, 4] ;Are you dead?
type = ChangeState
trigger1 = !alive
value = 5050

;-------
; Lobo clone customization
[State 0, make clone solid]
type = PlayerPush
trigger1 = IsHelper(10) || IsHelper(11)
value = 1

[State 0, Turn clones to face opponent]
type = Turn
trigger1 = IsHelper
trigger1 = P2Dist X < 0


;-------
; Superman passive ability: power charge when standing still
[State 0, PowerAdd]
type = PowerAdd
trigger1 = Var(50) = 1
trigger2 = Var(51) = 1
value = 1

; Lobo, Wolverine passive ability: heal when standing still
[State 0, LifeAdd]
type = LifeAdd
triggerall = TimeMod = 3,1
trigger1 = Var(50) = 7
trigger2 = Var(51) = 7
trigger3 = Var(50) = 58
trigger4 = Var(51) = 58
value = 1

; Flash, others have moves that may leave me up in the air... bring me back down
[State 0, ChangeState]
type = ChangeState
trigger1 = Pos Y < 0
value = 948
ctrl = 1

;---------------------------------------------------------------------------
; Walk (overridden for Lobo clone hyper)
[Statedef 20]
type    = S
physics = S
sprpriority = 0

[State 140, remove guard effect]
type = RemoveExplod
trigger1 = NumExplod(13000) > 0
id = 13000

[State 20, 1]   ; Flash speed-boost
type = VelSet
triggerall = command = "holdfwd"
triggerall = !ishelper
trigger1 = Var(50) = 4 || Var(51) = 4
x = const(velocity.walk.fwd.x) * 2

[State 20, 1]   ; regular
type = VelSet
triggerall = command = "holdfwd"
triggerall = !ishelper(10) && !ishelper(11)
trigger1 = Var(50) != 4 && Var(51) != 4
x = const(velocity.walk.fwd.x)

[State 20, 1]   ; "Abbott" clone
type = VelSet
trigger1 = command = "holdfwd"
trigger1 = ishelper(10)
x = const(velocity.walk.fwd.x) + 0.75

[State 20, 1]   ; "Costello" clone
type = VelSet
trigger1 = command = "holdfwd"
trigger1 = ishelper(11)
x = const(velocity.walk.fwd.x) - 0.75


[State 20, 2]   ; Flash speed-boost
type = VelSet
triggerall = command = "holdback"
triggerall = !ishelper
trigger1 = Var(50) = 4 || Var(51) = 4
x = const(velocity.walk.back.x) * 2

[State 20, 2]   ; normal
type = VelSet
triggerall = command = "holdback"
triggerall = !ishelper(10) && !isHelper(11)
trigger1 = Var(50) != 4 && Var(51) != 4
x = const(velocity.walk.back.x)

[State 20, 2]   ; "Abbott" clone
type = VelSet
trigger1 = command = "holdback"
trigger1 = ishelper(10)
x = const(velocity.walk.back.x) - 0.75

[State 20, 2]   ; "Costello" clone
type = VelSet
trigger1 = command = "holdback"
trigger1 = ishelper(11)
x = const(velocity.walk.back.x) + 0.75

[State 20, 3]
type = ChangeAnim
triggerall = vel x > 0
trigger1 = Anim != 20 && Anim != 5
trigger2 = Anim = 5 && AnimTime = 0
value = 20

[State 20, 4]
type = ChangeAnim
triggerall = vel x < 0
trigger1 = Anim != 21 && Anim != 5
trigger2 = Anim = 5 && AnimTime = 0
value = 21

[State 20, make clone solid]
type = PlayerPush
trigger1 = IsHelper(10) || IsHelper(11)
value = 1

;---------------------------------------------------------------------------
; Jump Start
[Statedef 40]
type    = S
physics = S
ctrl = 0
sprpriority = 1

; Set AirJump Counter (if on ground - prevent if this is a wall jump)
[State 40, airjump]
type = VarSet
triggerall = Pos Y >= 0
trigger1 = var(50) = 67 || var(51) = 67
var(16) = 1

[State 40, ChangeAnim]
type = ChangeAnim
trigger1 = Time = 0
value = IfElse(Pos Y < 0, 740, 40)

[State 40, 1]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 40, 2]
type = VarSet
trigger1 = command = "holdfwd"
sysvar(1) = 1

[State 40, 3]
type = VarSet
trigger1 = command = "holdback"
sysvar(1) = -1

[State 40, 4]   ; Flash speed-boost
type = VelSet
triggerall = AnimTime = 0
trigger1 = Var(50) = 4 || Var(51) = 4
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x) * 2, ifelse(sysvar(1)=1, const(velocity.jump.fwd.x) * 2, const(velocity.jump.back.x) * 2))
y = const(velocity.jump.y)

[State 40, 4]   ; normal
type = VelSet
triggerall = AnimTime = 0
trigger1 = Var(50) != 4 && Var(51) != 4
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, 5]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = prevstateno = 100 ;RUN_FWD
trigger1 = sysvar(1) = 1
x = const(velocity.runjump.fwd.x)

[State 40, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;---------------------------------------------------------------------------
; AirJump Start (stolen from Invisible Woman)
[Statedef 45]
type    = A
physics = N
ctrl = 0
velset = 0,0

; decrement airjump counter
[State 45, VarAdd]
type = VarAdd
trigger1 = Time = 0
v = 16
value = -1

; briefly show invis. platform
[State 45, Explod]
type = Explod
trigger1 = Time = 0
anim = 967
ID = 967
pos = 0,0
postype = p1
bindtime = 1
removetime = 25
sprpriority = -1
ownpal = 1

[State 45, 1]
type = ChangeAnim
trigger1 = SelfAnimExist(44)
value = 44

[State 45, 2]
type = ChangeAnim
trigger1 = !SelfAnimExist(44)
value = 41

[State 45, 3]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 45, 4]
type = VarSet
trigger1 = command = "holdfwd"
sysvar(1) = 1

[State 45, 5]
type = VarSet
trigger1 = command = "holdback"
sysvar(1) = -1

[State 45, 6]
type = VelSet
trigger1 = Time = 2
x = ifelse(sysvar(1)=0, const(velocity.airjump.neu.x), ifelse(sysvar(1)=1, const(velocity.airjump.fwd.x), const(velocity.airjump.back.x)))
y = const(velocity.airjump.y)

[State 45, 7]
type = ChangeState
trigger1 = Time = 2
value = 50
ctrl = 1

;---------------------------------------------------------------------------
; Jump Land
[Statedef 52]
type    = S
physics = S
ctrl = 0
anim = 47

; reset superjump direction var
[State 0, VarSet]
type = VarSet
trigger1 = Var(0) != 0
v = 0
value = 0

[State 52, 1]
type = VelSet
trigger1 = Time = 0
y = 0

[State 52, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 52, 3]
type = CtrlSet
trigger1 = Time = 3
value = 1

[State 52, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

; ----- (customization) -----
[State 52, envshake]
type = EnvShake
trigger1 = !Time
time = 10

[State 3620, on to the move!]
type = ChangeState
trigger1 = PrevStateNo = 3621
value = 3622 ;Hyper Blanka Envy hyper - 2nd Part
ctrl = 0
; --- (end customization) ---


;---------------------------------------------------------------------------
; Hop forward (overrides run)
[Statedef 100]
type    = A
physics = A
anim = 100
sprpriority = 1

[State 100, PlaySnd]
type = PlaySnd
trigger1 = Time = 0
value = S8,0

[State 100, dust]
type = Explod
trigger1 = Time = 0
anim = 918
ontop = 1

[State 100, lines]
type = Explod
trigger1 = timemod = 2,1
anim = 111
ID = 111
removeongethit = 1
removetime = 60
vel = -10-ceil(random/20), 0
postype = p1
pos = -100, -80
random = 10,80
xscale = 0.5
yscale = 0.5
sprpriority = -3
bindtime = 1
ownpal = 1

[State 100, grunt]
type = PlaySnd
trigger1 = Time = 3
value = 1,1
channel = 0

[State 100, 1]   ; Flash speed-boost
type = VelSet
triggerall = Time = 0
trigger1 = Var(50) = 4 || Var(51) = 4
x = const(velocity.run.fwd.x) * 2
y = const(velocity.run.fwd.y) * 2

[State 100, 1]  ; normal
type = VelSet
triggerall = Time = 0
trigger1 = Var(50) != 4 && Var(51) != 4
x = const(velocity.run.fwd.x)
y = const(velocity.run.fwd.y)


;---------------------------------------------------------------------------
; GUARD (start) (customized to fire up any potential custom guard effects)
[Statedef 120000]
type = U    ;Leave state type unchanged
physics = U ;Leave physics unchanged

[State 120, Helper]
type = Helper
trigger1 = !Time
helpertype = normal
name = "custom guard effect"
ID = 13000
stateno = 13000
ownpal = 1

[State 120, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 120 + (statetype = C) + (statetype = A)*2

[State 120, 2]
type = StateTypeSet
trigger1 = Time = 0 && statetype = S
physics = S

[State 120, 3]
type = StateTypeSet
trigger1 = Time = 0 && statetype = C
physics = C

[State 120, 4]
type = StateTypeSet
trigger1 = Time = 0 && statetype = A
physics = A

[State 120, Hi to Lo]
type = StateTypeSet
trigger1 = statetype = S && command = "holddown"
statetype = C
physics = C

[State 120, Lo to Hi]
type = StateTypeSet
trigger1 = statetype = C && command != "holddown"
statetype = S
physics = S

[State 120, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 130 + (statetype = C) + (statetype = A)*2

[State 120, Stop Guarding]
type = ChangeState
trigger1 = command != "holdback"
trigger2 = !inguarddist
value = 140

;---------------------------------------------------------------------------
; GUARD (end) (customized to remove any custom powerset-based guard effects)
[Statedef 140]
type = U    ;Leave state type unchanged
physics = U ;Leave physics unchanged
ctrl = 1

; customize starts here
[State 140, remove effect]
type = RemoveExplod
trigger1 = NumExplod(13000) > 0
id = 13000
; customize ends here

[State 140, 1]
type = ChangeAnim
trigger1 = Time = 0
value = 140 + (statetype = C) + (statetype = A)*2

[State 140, 2]
type = StateTypeSet
trigger1 = Time = 0 && statetype = S
physics = S

[State 140, 3]
type = StateTypeSet
trigger1 = Time = 0 && statetype = C
physics = C

[State 140, 4]
type = StateTypeSet
trigger1 = Time = 0 && statetype = A
physics = A

[State 140, Hi to Lo]
type = StateTypeSet
trigger1 = statetype = S && command = "holddown"
statetype = C
physics = C

[State 140, Lo to Hi]
type = StateTypeSet
trigger1 = statetype = C && command != "holddown"
statetype = S
physics = S


;---------------------------------------------------------------------------
; Superjump custom start (to enable airjump)
[Statedef 699]
type    = S
physics = S
ctrl = 0

; Set AirJump Counter (if on ground - prevent if this is a wall jump)
[State 699, airjump]
type = VarSet
triggerall = Pos Y >= 0
trigger1 = var(50) = 67 || var(51) = 67
var(16) = 1

[State 699, ChangeState]
type = ChangeState
trigger1 = Time = 0
value = 700


;---------------------------------------------------------------------------
; Wall Jump Start
[Statedef 740]
type    = S
physics = S
anim = 740
ctrl = 0
sprpriority = 1

[State 40, 1]
type = VarSet
trigger1 = Time = 0
sysvar(1) = 0

[State 40, 2]
type = VarSet
trigger1 = command = "holdfwd"
sysvar(1) = 1

[State 40, 3]
type = VarSet
trigger1 = command = "holdback"
sysvar(1) = -1

[State 40, 4]
type = VelSet
trigger1 = AnimTime = 0
x = ifelse(sysvar(1)=0, const(velocity.jump.neu.x), ifelse(sysvar(1)=1, const(velocity.jump.fwd.x), const(velocity.jump.back.x)))
y = const(velocity.jump.y)

[State 40, 5]
type = VelSet
trigger1 = AnimTime = 0
trigger1 = prevstateno = 100 ;RUN_FWD
trigger1 = sysvar(1) = 1
x = const(velocity.runjump.fwd.x)

[State 40, 6]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1


;---------------------------------------------------------------------------
; Initialize (at the start of the round) -- overridden to allow power set persistence
[Statedef 5900]
type = S

[State 5900, 1] ;Clear all int variables
type = VarRangeSet
trigger1 = roundsexisted = 0
last = 49  ; added this line;  allows the last 10 vars to persist
value = 0

[State 5900, 2] ;Clear all float variables
type = VarRangeSet
trigger1 = roundsexisted = 0
first = 2  ; added this line;  allows the first 2 vars to persist
fvalue = 0

; spawn "custom effect" helper
[State 5900, CustomEffect]
type = null ;Helper
trigger1 = NumHelper(30000) = 0
helpertype = normal
name = "custom effects"
ID = 30000
stateno = 30000
ownpal = 1

; pre-load power sets
[State 5900, powerPreset1]
type = VarSet
trigger1 = roundno = 1
trigger1 = var(50) = 0
v = 50
value = ((Random * 30) / 1000) + 1

[State 5900, powerPreset2]
type = VarSet
trigger1 = roundno = 1
trigger1 = var(51) = 0
v = 51
value = ((Random * 30) / 1000) + 51

;-------------------------------------------------------------
; figure out who my opponent is, and store that tidbit in var(47).
; it'll be useful for the AI to know, and for the "snacktime" intro (192)
[State 5900, powerset1]
type = VarSet
trigger1 = (P2Name = "Superman")
var(47) = 1

[State 5900, powerset2]
type = VarSet
trigger1 = P2Name = "Batman"
var(47) = 2

[State 5900, powerset3]
type = VarSet
trigger1 = P2Name = "Wonder Woman"
trigger2 = P2Name = "Wonder Woman Reloaded"
var(47) = 3

[State 5900, powerset4]
type = VarSet
trigger1 = P2Name = "Flash"
trigger2 = P2Name = "TheFlash"
trigger3 = P2name = "Wally West"
trigger4 = p2name = "Barry Allen"
trigger5 = p2name = "Jay Garrick"
var(47) = 4

[State 5900, powerset5]
type = VarSet
trigger1 = P2Name = "Blackest Night Hal Jordan" && (enemy, PalNo <= 6)
trigger2 = P2Name = "Green Lantern Hal Jordan"
trigger3 = P2Name = "Guy Gardner"
trigger4 = P2Name = "Green Lantern Guy"
trigger5 = P2Name = "John Stewart"
trigger6 = P2Name = "Green Lantern"
trigger7 = P2Name = "John_StewartGL"
var(47) = 5

[State 5900, powerset6]
type = VarSet
trigger1 = P2Name = "Ice"
var(47) = 6

[State 5900, powerset7]
type = VarSet
trigger1 = P2Name = "Lobo"
var(47) = 7

[State 5900, powerset8]
type = VarSet
trigger1 = P2Name = "Homem Borracha"
trigger2 = P2Name = "Plastic Man"
trigger3 = P2Name = "ElongatedMan"
var(47) = 8

[State 5900, powerset9]
type = VarSet
trigger1 = P2Name = "Etrigan"
trigger2 = P2Name = "Etrigan the Demon"
trigger3 = P2Name = "DCvsMEtrigan"
var(47) = 9

[State 5900, powerset10]
type = VarSet
trigger1 = P2Name = "Luthor"
trigger2 = (P2Name = "Lex Luthor") && (enemy, palno < 12)
var(47) = 10

[State 5900, powerset11]
type = VarSet
trigger1 = P2Name = "Darkseid"
trigger2 = P2Name = "Darksied"
trigger3 = P2Name = "Darkseid 16 bits"
var(47) = 11

[State 5900, powerset12]
type = VarSet
trigger1 = P2Name = "Superboy"
trigger2 = P2Name = "Kon-El"
trigger3 = P2Name = "KonEl"
var(47) = 12

[State 5900, powerset13]
type = VarSet
trigger1 = P2Name = "Sinestro"
trigger2 = (P2Name = "Blackest Night Hal Jordan") && (enemy, PalNo = 9)
var(47) = 13

[State 5900, powerset14]
type = VarSet
trigger1 = (P2Name = "Superman") && (enemy, PalNo = [8,9])
trigger2 = P2Name = "Bizarro"
var(47) = 14

[State 5900, powerset15]
type = VarSet
trigger1 = P2Name = "Aquaman"
var(47) = 15

[State 5900, powerset16]
type = VarSet
trigger1 = P2Name = "Doomsday"
var(47) = 16

[State 5900, powerset17]
type = VarSet
trigger1 = P2Name = "Poison Ivy"
var(47) = 17

[State 5900, powerset18]
type = VarSet
trigger1 = P2Name = "The Atom"
trigger2 = P2Name = "Atom"
var(47) = 18

[State 5900, powerset19]
type = VarSet
trigger1 = P2Name = "Martian Manhunter"
trigger2 = P2Name = "J'onn J'onzz"
var(47) = 19

[State 5900, powerset20]
type = VarSet
trigger1 = (P2Name = "Shazam")
trigger2 = (P2Name = "Captain Marvel")
var(47) = 20

[State 5900, powerset21]
type = VarSet
trigger1 = (P2Name = "Starfire")
trigger2 = (P2Name = "HCF Starfire")
var(47) = 21

[State 5900, powerset22]
type = VarSet
trigger1 = (P2Name = "Bane")
var(47) = 22

[State 5900, powerset23]
type = VarSet
trigger1 = (P2Name = "Eradicator")
trigger2 = (P2Name = "Erradicator")
var(47) = 23

[State 5900, powerset24]
type = VarSet
trigger1 = (P2Name = "Vixen")
var(47) = 24

[State 5900, powerset25]
type = VarSet
trigger1 = (P2Name = "Mongul")
var(47) = 25

[State 5900, powerset26]
type = VarSet
trigger1 = (P2Name = "Atrocitus")
trigger2 = (P2Name = "Red Lantern")
trigger3 = (P2Name = "Blackest Night Green Lantern") && (enemy, PalNo = 7)
trigger4 = (P2Name = "Dexstarr")
var(47) = 26

[State 5900, powerset27]
type = VarSet
trigger1 = (P2Name = "Larfleeze")
trigger2 = (P2Name = "Orange Lantern")
trigger3 = (P2Name = "Agent Orange")
trigger4 = (P2Name = "Blackest Night Hal Jordan") && (enemy, PalNo = 8)
trigger5 = (P2Name = "Lex Luthor") && (enemy, PalNo = 12)
var(47) = 27

[State 5900, powerset28]
type = VarSet
trigger1 = (P2Name = "Indigo-1")
trigger2 = (P2Name = "Indigo Lantern")
trigger3 = (P2Name = "Blackest Night Hal Jordan") && (enemy, PalNo = 11)
var(47) = 28

[State 5900, powerset29]
type = VarSet
trigger1 = (P2Name = "Star Sapphire")
var(47) = 29

[State 5900, powerset30]
type = VarSet
trigger1 = (P2Name = "Black Lantern")
trigger2 = (P2Name = "Blackest Night Hal Jordan") && (enemy, PalNo = 12)
var(47) = 30

; 31-50: open

[State 5900, powerset51]
type = VarSet
trigger1 = P2Name = "Captain America"
trigger2 = P2Name = "Isaiah Bradley"
trigger3 = P2Name = "Captain Bucky"
trigger4 = P2Name = "Ultimate Cap"
var(47) = 51

[State 5900, powerset52]
type = VarSet
trigger1 = P2Name = "Hulk"
trigger2 = P2Name = "Savage Hulk"
var(47) = 52

[State 5900, powerset53]
type = VarSet
trigger1 = P2Name = "Thor"
trigger2 = P2Name = "The Mighty Thor"
var(47) = 53

[State 5900, powerset54]
type = VarSet
trigger1 = P2Name = "Spider-Man"
trigger2 = P2Name = "Spiderman"
var(47) = 54

[State 5900, powerset55]
type = VarSet
trigger1 = P2Name = "Iron-Man"
trigger2 = P2Name = "Ironman"
trigger3 = P2Name = "Ironman DCvsM"
trigger4 = P2Name = "War Machine"
trigger5 = P2Name = "Warmachine"
var(47) = 55

[State 5900, powerset56]
type = VarSet
trigger1 = P2Name = "Crystal"
trigger2 = P2Name = "Crystal of The Avengers"
var(47) = 56

[State 5900, powerset57]
type = VarSet
trigger1 = P2Name = "Sandman"
var(47) = 57

[State 5900, powerset58]
type = VarSet
trigger1 = P2Name = "Wolverine"
trigger2 = P2Name = "Wx2"
trigger3 = P2Name = "Logan"
trigger4 = P2Name = "WolverineDCvsMC"
var(47) = 58

[State 5900, powerset59]
type = VarSet
trigger1 = P2Name = "Carnage"
var(47) = 59

[State 5900, powerset60]
type = VarSet
trigger1 = P2Name = "Doom"
trigger2 = P2Name = "Dr.Doom"
var(47) = 60

[State 5900, powerset61]
type = VarSet
trigger1 = P2Name = "Ghost Rider"
trigger2 = P2Name = "DCvsMGhostRider"
var(47) = 61

[State 5900, powerset62]
type = VarSet
trigger1 = P2Name = "Strong Guy"
trigger2 = P2Name = "Guido"
var(47) = 62

[State 5900, powerset63]
type = VarSet
trigger1 = P2Name = "Thanos"
trigger2 = P2Name = "Thanos of Titan"
var(47) = 63

[State 5900, powerset64]
type = VarSet
trigger1 = (P2Name = "Deadpool")
var(47) = 64

[State 5900, powerset65]
type = VarSet
trigger1 = P2Name = "Juggernaut"
trigger2 = P2Name = "Juggernaut by Splode"
trigger3 = P2Name = "Juggernault"
var(47) = 65

[State 5900, powerset66]
type = VarSet
trigger1 = P2Name = "Mister Fantastic"
trigger2 = P2Name = "Mr. Fantastic"
var(47) = 66

[State 5900, powerset67]
type = VarSet
trigger1 = P2Name = "Invisible Woman"
trigger2 = P2Name = "Sue Storm"
var(47) = 67

[State 5900, powerset68]
type = VarSet
trigger1 = P2Name = "The Thing"
trigger2 = P2Name = "Thing"
trigger3 = P2Name = "Mole"
trigger4 = P2Name = "La Mole"
var(47) = 68

[State 5900, powerset69]
type = VarSet
trigger1 = P2Name = "Human Torch"
var(47) = 69

[State 5900, powerset70]
type = VarSet
trigger1 = P2Name = "Silver Surfer"
trigger2 = P2Name = "silversurferv2"
var(47) = 70

[State 5900, powerset71]
type = VarSet
trigger1 = P2Name = "Venom"
var(47) = 71

[State 5900, powerset72]
type = VarSet
trigger1 = P2Name = "Cyclops"
trigger2 = P2Name = "Scott Summers MVC2 + MSHVSF + MUA + XML2"
var(47) = 72

[State 5900, powerset73]
type = VarSet
trigger1 = P2Name = "Elektra"
trigger2 = P2Name = "Elektra Natchios"
var(47) = 73

[State 5900, powerset74]
type = VarSet
trigger1 = P2Name = "Nightcrawler"
var(47) = 74

[State 5900, powerset75]
type = VarSet
trigger1 = P2Name = "Marrow"
var(47) = 75

[State 5900, powerset76]
type = VarSet
trigger1 = P2Name = "Songbird"
var(47) = 76

[State 5900, powerset77]
type = VarSet
trigger1 = P2Name = "Omega Red"
var(47) = 77

[State 5900, powerset78]
type = VarSet
trigger1 = P2Name = "RHINO"
var(47) = 78

[State 5900, powerset79]
type = VarSet
trigger1 = P2Name = "Iceman"
trigger2 = P2Name = "MvDC Iceman"
var(47) = 79

[State 5900, powerset80]
type = VarSet
trigger1 = P2Name = "Storm"
var(47) = 80

[State 5900, powerset81]
type = VarSet
trigger1 = P2Name = "Cable"
var(47) = 81

; 82-89: open

[State 5900, powerset90]
type = VarSet
trigger1 = (P2Name = "Daredevil")
trigger2 = (P2Name = "Devil")
var(47) = 90

[State 5900, powerset91]
type = VarSet
trigger1 = P2Name = "Miss Marvel"
trigger2 = P2Name = "Ms. Marvel"
var(47) = 91

; 92-97: open

[State 5900, powerset98]
type = VarSet
trigger1 = P2Name = "Spiral"
var(47) = 98

; end of opponent-determination code
;-------------------------------------------------------------


[State 5900, 3] ;Intro for round 1
type = ChangeState
trigger1 = roundno = 1
value = 190



;---------------------------------------------------------------------------
; States that are always executed (use statedef -2)
;---------------------------------------------------------------------------
[Statedef -2]

[State -2, debug]
type = DisplayToClipboard
trigger1 = 1
;text = "var 15 = %d -- var 50 = %d -- var 51 = %d -- Pos: %f, %f"
;params = var(15), var(50), var(51), Pos X, Pos Y
text = "P2 powerset code: %d"
params = var(47)

[State -2, jump landing sound]   ; custom jump-landing sound
trigger1 = stateno = 52
trigger1 = Time = 1
type = PlaySnd
persistent = 0
value = 8,1

;[State -2, fall landing sound]   ; custom fall-landing sound
;trigger1 = stateno = [5100, 5110]
;trigger1 = Time = 1
;type = PlaySnd
;persistent = 0
;value = 8,2

[State -2, gethits]         ; custom gethit sounds
type = PlaySnd
triggerall = Alive && (Time = 1)
triggerall = Random < 300
trigger1 = stateno = [5000,5022] ; standing hard hit high
trigger2 = stateno = 5030   ; air hit
trigger3 = stateno = 5070   ; tripped
channel = 1
value = 4,0

[State -2, superjump opponent locator]
type = Explod
triggerall = NumExplod(910) = 0
trigger1 = (Pos Y < -200) && (P2Dist Y > 50)
ID = 910
pos = 0,-120
postype = p2
anim = 910
facing = 1

[State -2, RemoveExplod]
type = RemoveExplod
triggerall = NumExplod(910) > 0
trigger1 = (Pos Y >= -200)
id = 910

; wall jump spark (ice's walljump)
[State -2, walljump ice]
type = Explod
trigger1 = Var(50) = 6 || Var(51) = 6
trigger1 = NumExplod(741) = 0
trigger1 = Anim = 740 && AnimTime = 0
anim = 741
ontop = 1
bindtime = -1
pos = 0, floor(ScreenPos Y)
postype = back

; wall jump sound (ice crunch)
[State -2, walljump Explod]
type = PlaySnd
trigger1 = Var(50) = 6 || Var(51) = 6
trigger1 = NumExplod(741) = 0
trigger1 = Anim = 740 && AnimTime = 0
persistent = 0
value = 10,63

;-------------------------
; Songbird stolen power: glide downward if player is holding up
[State -2, glide]
type = VelAdd
triggerall = StateNo = 50 || StateNo = 701
triggerall = Var(50) = 76 || Var(51) = 76
trigger1 = Vel y > -2
trigger1 = command = "holdup"
y = -0.35

[State -2, sonic wings]
type = Explod
triggerall = StateNo = 50 || StateNo = 701
triggerall = Var(50) = 76 || Var(51) = 76
trigger1 = Vel y > -2
trigger1 = command = "holdup"
trigger1 = NumExplod(790) = 0
anim = 790
ID = 790
bindtime = -1
removetime = -1
ownpal = 1

[State -2, buzz-hum]
type = PlaySnd
triggerall = StateNo = 50 || StateNo = 701
triggerall = Var(50) = 76 || Var(51) = 76
trigger1 = NumExplod(790) = 1 && TimeMod = 50,0
value = 9,762

[State -2, Remove wings]
type = RemoveExplod
triggerall = StateNo != 50 && StateNo != 701
trigger1 = NumExplod(790) > 0
id = 790
; end of Songbird wings
;-------------------------

;-------------------------
; Deadpool resurrection hyper (can be used once per round... var 15 keeps track of this for us)
[State -2, HitOverride]
type = HitOverride
triggerall = (Var(15) = 0) && (Power >= 1000) && (Life <= 50)
trigger1 = Var(50) = 64
trigger2 = Var(51) = 64
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
slot = 0
stateno = 3641
time = 1

[State -2, AssertSpecial]
type = AssertSpecial
triggerall = (Var(15) = 0) && (Power >= 1000)
trigger1 = Var(50) = 64
trigger2 = Var(51) = 64
flag = NoKO



;-------------------------
; Power Slot OSD
;
; Adapted from code by FlowaGirl
;flowergirl@cutey.com
;http://blargh.i-xcell.com

; Power Slot OSD - orbs background
[State -2, orbs]
type = Explod
trigger1 = RoundState = 2
anim = 800
pos = ifelse(TeamSide = 1, 6, GameWidth - 7), GameHeight - 31
postype = left
facing = ifelse(TeamSide = 1, 1, -1)
bindtime = -1
removetime = 1
sprpriority = 8
shadow = 0,0,0
ownpal = 1
ignorehitpause = 1

; Power Slot OSD - Power Set #1 icon
[State -2, PowerIcon1]
type = Explod
triggerall = RoundState = 2
trigger1 = var(50) > 0
anim = 800 + var(50)
pos = ifelse(TeamSide = 1, 6, GameWidth - 31), GameHeight - 31
postype = left
bindtime = -1
removetime = 1
sprpriority = 7
shadow = 0,0,0
ownpal = 1
ignorehitpause = 1

; Power Slot OSD - Power Set #2 icon
[State -2, PowerIcon2]
type = Explod
triggerall = RoundState = 2
trigger1 = var(51) > 0
anim = 800 + var(51)
pos = ifelse(TeamSide = 1, 24, GameWidth - 49), GameHeight - 31
postype = left
bindtime = -1
removetime = 1
sprpriority = 6
shadow = 0,0,0
ownpal = 1
ignorehitpause = 1


;------------------------------------------
; Lobo clones - timer
[State -2, SetCloneTimer]
type = VarAdd
triggerall = (IsHelper(10) || IsHelper(11)) && (StateNo != 3079) && (RoundState = 2)
trigger1 = Var(10) = [0,300]
trigger2 = (GameTime % 1) = 0
v = 10
value = 1

[State -2, Clone timeout]
type = ChangeState
triggerall = IsHelper(10) || IsHelper(11)
trigger1 = numhelper(10) > 2
trigger2 = (Var(10) >= 300) && (StateType != A)
;trigger3 = roundstate > 2
value = 3079
;------------------------------------------

;-------------------------
; Elektra shadow-clones...
;
; aren't solid
[State -2, shadow clone]
type = PlayerPush
trigger1 = IsHelper(73)
value = 0

; can't be hit
[State -2, NotHitBy]
type = NotHitBy
trigger1 = IsHelper(73)
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 1

; nearly all black
[state -2, palfx]
type = PalFX
trigger1 = IsHelper(73)
add = -212,-212,-212
time = 1

; do fractional damage
[State -2, AttackMulSet]
type = AttackMulSet
trigger1 = IsHelper(73)
value = 0.1
ignorehitpause = 1

; set timer
[State -2, Shadow timer]
type = VarAdd
triggerall = IsHelper(73) && (StateNo != 3739) && (RoundState = 2)
trigger1 = Var(10) = [0,600]
trigger2 = (GameTime % 1) = 0
v = 10
value = 1

; check timer
[State -2, Shadow timeout]
type = ChangeState
triggerall = IsHelper(73)
trigger1 = numhelper(73) > 4
trigger2 = (Var(10) >= 600) && (StateType != A)
value = 3739

; end of Elektra shadow-clones code
;------------------------------------------

;-----------------------------------------
; Damage Dampener (from P.o.t.S @ Mugen Fighter's Guild)
[State -2, DamperSet]
type = VarSet
triggerall = Stateno != 3012 ; superman autocombo
triggerall = Stateno != 3511 ; captain america autocombo
triggerall = Stateno != 3681 ; thing autocombo
trigger1 = NumEnemy
fvar(12) = IfElse(EnemyNear,GetHitVar(HitCount)=0, 1, IfElse(EnemyNear,GetHitVar(HitCount)=1, .9, .8**EnemyNear,GetHitVar(HitCount)))
ignorehitpause=1

[State -2, DamperReset]
type = varset
trigger1 = NumEnemy && (enemynear,movetype!=H)
trigger2 = !NumEnemy
fvar(12) = 1

[State -2, DampenerEnable]
type = attackmulset
trigger1 = 1
value = fvar(12)
ignorehitpause = 1
;
; end damage dampener
;-----------------------------------------

;------------------------------------------
; super armor (for Hulk, Juggernaut, Doomsday) -- disabled because it's buggy
; [State -2]
; type = Helper
; triggerall = Numhelper(9000) = 0 && palno = 1
; trigger1 = RoundState >= 2
; id = 9000
; persistent = 0
; name = "Armor"
; pos = 0,0
; postype = P1
; stateno = 9000
; helpertype = normal
; ignorehitpause = 1
; keyctrl = 0
; ownpal = 1
; pausemovetime = 9999999
; supermovetime = 9999999
; 
; [State -2]
; type = Lifeadd
; trigger1 = Numhelper(9000)
; value = var(11)
; pausemovetime = 9999999
; supermovetime = 9999999
; 
; [State -2]
; type = NotHitBy
; trigger1 = Numhelper(9000) && GetHitVar(hitcount) = 0
; value = SCA,NA,NP,NT
; pausemovetime = 9999999
; supermovetime = 9999999
; 
; [State -2]
; type = PalFX
; trigger1 = var(11)
; time = 7 ; Set how long the gethit glow should last here
; add = 200,150,0 ; Set color value
; mul = 256,256,0 ; Set color value
; sinadd = 0,0,0,10
; invertall = 0
; color = 256
; ignorehitpause = 1
; persistent = 1
; pausemovetime = 9999999
; supermovetime = 9999999
; 
; end of super armor
;------------------------------------------



;---------------------------------------------------------------------------
; States that are executed when in self's state file (use statedef -3)
;---------------------------------------------------------------------------
[Statedef -3]

[State -3, custom guard helper]
type = null ;Helper
triggerall = Anim = [120,159] ;&& AnimElemTime(1) = 0
trigger1 = NumHelper(13000) = 0
helpertype = normal
name = "custom guard effect"
ID = 13000
stateno = 13000
ownpal = 1

[State -3, custom hard punch helper]
type = null ;Helper
triggerall = Anim = [250,255]
trigger1 = NumHelper(25000) = 0
helpertype = normal
name = "custom HP effect"
ID = 25000
stateno = 25000
ownpal = 1

[State -3, custom hard kick helper]
type = null ;Helper
triggerall = Anim = [260,269]
trigger1 = NumHelper(26000) = 0
helpertype = normal
name = "custom HK effect"
ID = 26000
stateno = 26000
ownpal = 1

[State -3, Landing Dust]
type = Explod
triggerall =  NumExplod(60) < 1
triggerall = Time = 3
trigger1 = StateNo = 52 ;Jump land
trigger2 = StateNo = 101 ;Run-fdw land
trigger3 = StateNo = 106 ;Run-back land
trigger4 = PrevStateNo = 52 && StateNo = 11 ;Jump land/crouch
persistent = 0
ID = 60
anim = 60
postype = p1
pos = 7, 3
velocity = 0, 0
accel = 0, 0
removetime = -2
sprpriority = -2
ownpal = 1

[State -3, Landing Sound]
type = PlaySnd
triggerall = Time = 1 && Var(20) != 2
trigger1 = StateNo = 52 ;Jump land
trigger2 = StateNo = 101 ;Run-fwd land
trigger3 = StateNo = 106 ;Run-back land
value = 8, 1

;--------------------------------------------------
; Level-up sounds (uses Var(2))
[State -3, levelup var 0]
type = VarSet
trigger1 = power < 1000
v =  3
value = 0

[State -3, levelup snd 1]
type = PlaySnd
trigger1 = (power >= 1000) && (power < 2000) && (var(3) < 1) && (RoundState = 2)
value = 12,0

[State -3, levelup var 1]
type = VarSet
trigger1 = (power >= 1000) && (power < 2000)
v =  3
value = 1

[State -3, levelup snd 2]
type = PlaySnd
trigger1 = (power >= 2000) && (power < 3000) && (var(3) < 2) && (RoundState = 2)
value = 12,1

[State -3, levelup var 2]
type = VarSet
trigger1 = (power >= 2000) && (power < 3000)
v =  3
value = 2

[State -3, levelup snd 3]
type = PlaySnd
trigger1 = (power >= 3000) && (var(3) < 3) && (RoundState = 2)
value = 12,2

[State -3, levelup var 3]
type = VarSet
trigger1 = (power >= 3000)
v =  3
value = 3


;--------------------------------
; based on FlowaGirl and Ethan Lives codes
; taken with permission from McCready's Guido char
[State -3, Finish Hit Explod - Helper]
type = Helper
triggerall = WinKO && NumHelper(8900) = 0
trigger1 = RoundState = 3
helpertype = Normal
name = "Finish Hit Explod"
id = 8900
pos = 0, 0
postype = p1
facing = 0
stateno = 8900
keyctrl = 0
ownpal = 1
supermovetime = 1000
pausemovetime = 1000
ignorehitpause = 1


; desperation quote
[State -3, PlaySnd]
type = PlaySnd
trigger1 = (Life <= 150) && (var(48) = 0)
value = S11,1

[State -3, VarSet]
type = VarSet
trigger1 = Life <= 150
v = 48
value = 1

; "Win by hyper" effect
[State -3, Explod]
type = Explod
trigger1 = (RoundState = 3) && (Life > 0) && (NumExplod(12000) = 0)
anim = 12000
ID = 12000
pos = 0,0
postype = left
bindtime = 100
sprpriority = -1
ownpal = 1

;----------------------------------
; force hyper background to persist if any interactive moves are running:
;  - Lobo's Main Men
;  - Elektra's Ninjitsu
;  - Juggernaut's PowerUp
;  - ...?
[State -3, persistHyperBG]
type = VarSet
triggerall = sysvar(3) = 0
trigger1 = NumHelper(10) || NumHelper(11)
trigger2 = NumHelper(73)
sysvar(3) = 1

[State -3, resetHyperBG]
type = VarSet
triggerall = sysvar(3) = 1
trigger1 = !NumHelper(10) && !NumHelper(11)
trigger1 = !NumHelper(73)
sysvar(3) = 0


;-------------------------
; intangibility (stolen from Martian Manhunter, eventually Vision)
[State -3, intangibility]
type = AfterImage
trigger1 = var(17) = 2
time = 60
length = 60
timegap = 1
framegap = 1
trans = add

;Turn Intangible
[State -3, Intangible]
type = AssertSpecial
trigger1 = Var(17) = 2
flag = Invisible

[State -3, NotHitBy] ; anything!
type = NotHitBy
trigger1 = Var(17) = 2
value = SCA
time = 1

[State -3, nopush]
type = PlayerPush
trigger1 = Var(17) = 2
value = 0

[State -3, no energy]
type = PlaySnd
trigger1 = Var(17) = 2
trigger1 = power = 50
value = S9,190

[State -3, no energy]
type = VarSet
trigger1 = Var(17) = 2
trigger1 = power < 50
v = 17
value = 0

[State -3, use energy]
type = PowerAdd
trigger1 = Var(17) = 2
trigger1 = power >= 1
value = -3

;-------------------------
;  invisibility (stolen from Invisible Woman...who else?)
[State -2, Invisibility effect]
type = AfterImage
trigger1 = var(17) = 1
time = 375
length = 60
palcolor = 0
palinvertall = 1
timegap = 1
framegap = 1
trans = add

;Turn Invisible
[State -3, Invisible]
type = AssertSpecial
trigger1 = Var(17) = 1
flag = Invisible

;If hit, returns to visible...
[State -3, VarSet]
type = VarSet
trigger1 = Var(17)= 1 && power <= 50
trigger2 = (MoveType = H) || (RoundState = 3)
v = 17
value = 0

; if invisible, can't be hit by enemy projectiles
[State -3, invis_no_proj_hits]
type = NotHitBy
trigger1 = Var(17) = 1
time = 1
value = ,AP
ignorehitpause = 1

;Haste/V-ism (when invisible)
[State -3, Speed]
type = ChangeAnim
triggerall = Var(17) = 1
trigger1 = AnimElemTime(AnimElemNo(0) + 1) < 0
trigger1 = AnimElemTime(AnimElemNo(0)) > floor ((AnimElemTime(AnimElemNo(0)) - AnimElemTime(AnimElemNo(0) + 1))/2)
ignorehitpause = 1
value = anim
elem = AnimElemNo(0) + 1

[State -3, no energy]
type = PlaySnd
trigger1 = Var(17) = 1
trigger1 = power = 50
value = S9,670

[State -3, no energy]
type = VarSet
trigger1 = Var(17) = 1
trigger1 = power < 50
v = 17
value = 0

[State -3, use energy]
type = PowerAdd
trigger1 = Var(17) = 1
trigger1 = power >= 1
value = -3

;----end invisibility effects


;-------------------------
; Flash passive power - speed up all regular moves
; (thanks to SorrowEdge for the tutorial!)
[State -3, Speed]
type = ChangeAnim
triggerall = (RoundState = 2) && (MoveType != H) && (Var(50) = 4 || Var(51) = 4)
triggerall = Stateno != 1012
trigger1 = AnimElemTime(AnimElemNo(0) + 1) < 0
trigger1 = AnimElemTime(AnimElemNo(0)) > floor ((AnimElemTime(AnimElemNo(0)) - AnimElemTime(AnimElemNo(0) + 1))/2)
ignorehitpause = 1
value = anim
elem = AnimElemNo(0) + 1

[State -3, Speed Afterimages]
type = AfterImage
triggerall = (Var(50) = 4 || Var(51) = 4) ;(RoundState = 2) &&
trigger1 = Time % 300 = 0
time = 300
length = 20
palcolor = 1
paladd = 40,-200,-200
palmul = 256,256,256
trans = add


;-------------------------
[State -3, GL Afterimages]
type = AfterImage
triggerall = (RoundState = 2) && (Var(50) = 5 || Var(51) = 5)
trigger1 = Time % 300 = 0
time = 300
length = 20
palcolor = 1
paladd = -200,40,-200
palmul = 256,256,256
trans = add




;-------------------------
; Plastic Man / Mr. Fantastic passive power - all regular moves have extended range
[State -3, Stretch]
type = ChangeAnim
triggerall = (RoundState = 2) && (MoveType = A) && (Var(50) = 8 || Var(51) = 8 || Var(50) = 66 || Var(51) = 66)
trigger1 = (Anim > 200 && Anim < 700) && AnimExist(anim + 8) ;&& AnimElem = 1
ignorehitpause = 1
value = anim + 8
elem = AnimElemNo(0) + 1


;-------------------------
; Lobo clones timer bar
; adapted from FlowaGirl's meterbar tutorial: http://blargh.i-xcell.com
[State -3: clone timer bar]
type = Explod
trigger1 = (IsHelper(10) || IsHelper(11)) && (RoundState = 2) ; && Alive
trigger1 = Var(10) = [0,300]    ;< 300
anim = 3230 - (Var(10) / 10)
pos = -40,-130
postype = p1
bindtime = -1
removetime = 1
ontop = 1
shadow = 0,0,0
ownpal = 1
ignorehitpause = 1

; Force clones into winpose if roundstate > 2 and we won
[State -3: clone winpose]
type = ChangeState
triggerall = IsHelper(10) || IsHelper(11) || IsHelper(73)
trigger1 = (RoundState = 4) & (StateNo = 0) & Win
value = 180

; Force clones into lose pose if roundstate > 2 and we lost / were KO'ed
[State -3: clone losepose]
type = ChangeState
triggerall = IsHelper(10) || IsHelper(11) || IsHelper(73)
trigger1 = (RoundState = 4) && (StateNo = 0) && (DrawGame || Lose)
value = 179

;-----------------------
;  DCvM Template Files
;      provided by
;       Buyog2099
;(based on MEE template
;  by Kitsune Sniper)
;         ***
;   Thanks, Kitsune!
;-----------------------
