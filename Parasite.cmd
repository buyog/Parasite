; Parasite's CMD file
;
;---------------------------------------------------------------------------
; Vars:
;   1: for AI activation
;   5: for Super Jump (0=vertical, 1=forward, -1=backward)
;   12: for Superboy stolen special, distance determiner
;   15: for Deadpool Resurrection limiting (only allowed once per round)
;   16: for Invisible Woman airjump
;   47: Keeps track of who the opponent is (for intro 192 and for the AI)
;   48: Desperation quote ("DANGER!" or whatever)
;   49: Feeding Time slot determiner (50=slot 1, 51=slot 2)
;   50: Power Set slot #1
;   51: Power Set slot #2
; Helpers:
;   0: superjump opponent position indicator
; Explods:
;---------------------------------------------------------------------------
;
;-| AI |-------------------------------------------------------------
[Command]
name = "CPU1"
command = U, D, F
time = 1

[Command]
name = "CPU2"
command = U, B, F
time = 1

[Command]
name = "CPU3"
command = U, D, D
time = 1

[Command]
name = "CPU4"
command = F, B, U
time = 1

[Command]
name = "CPU5"
command = U, F, U, B
time = 1

[Command]
name = "CPU6"
command = U, D, B
time = 1

[Command]
name = "CPU7"
command = F, F, B
time = 1

[Command]
name = "CPU8"
command = U, D, U
time = 1

[Command]
name = "CPU9"
command = F, B, B
time = 1

[Command]
name = "CPU10"
command = F, F, B, B
time = 1

[Command]
name = "CPU11"
command = U, U, F
time = 1

[Command]
name = "CPU12"
command = U, B, B
time = 1

[Command]
name = "CPU13"
command = U, B, F, F
time = 1

[Command]
name = "CPU14"
command = U, F, B, U
time = 1

[Command]
name = "CPU15"
command = U, B, F, U
time = 1

[Command]
name = "CPU16"
command = U, B, B, B
time = 1

[Command]
name = "CPU17"
command = U, D, B, F
time = 1

[Command]
name = "CPU18"
command = U, D, B, D
time = 1

[Command]
name = "CPU19"
command = U, D, F, U
time = 1

[Command]
name = "CPU20"
command = U, D, U, B
time = 1

[Command]
name = "CPU21"
command = U, D, F, F
time = 1

[Command]
name = "CPU22"
command = F, F, F, F
time = 1

[Command]
name = "CPU23"
command = U, U, U, D
time = 1

[Command]
name = "CPU24"
command = B, B, B
time = 1

[Command]
name = "CPU25"
command = D, D, D, D
time = 1

[Command]
name = "CPU26"
command = D, D, D
time = 1

[Command]
name = "CPU27"
command = F, F, F
time = 1

[Command]
name = "CPU28"
command = U, U, U
time = 1

[Command]
name = "CPU29"
command = U, U, B, B
time = 1

[Command]
name = "CPU30"
command = D, D, F, F
time = 1

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10

[Command]
name = "DU"
command = D, U
time = 10

[Command]
name = "UU"
command = U, U
time = 10

[Command]
name = "DD"
command = D, D
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

[Command]
name = "3P"
command = x+y+z
time = 1

[Command]
name = "3K"
command = a+b+c
time = 1

[Command]
name = "recovery roll"
command = a+b
time = 1

[Command]
name = "recovery roll"
command = b+c
time = 1

[Command]
name = "recovery roll"
command = a+c
time = 1

[Command]
name = "pushblock"
command = x+y
time = 5

[Command]
name = "pushblock"
command = x+z
time = 5

[Command]
name = "pushblock"
command = y+z
time = 5

[command]
name = "airjump"
command = $U
time = 15

[Command]
name = "flight"
command = b+y
time = 1

[Command]
name = "absorb"
command = a+x
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

;-------------------------
[Command]
name = "hold";Required (do not remove)
command = /a
time = 1

[Command]
name = "hold";Required (do not remove)
command = /b
time = 1

[Command]
name = "hold";Required (do not remove)
command = /c
time = 1

[Command]
name = "hold";Required (do not remove)
command = /x
time = 1

[Command]
name = "hold";Required (do not remove)
command = /y
time = 1

[Command]
name = "hold";Required (do not remove)
command = /z
time = 1
;-------------------------


;-| Hypers |-----------------------------------------------------------
[Command] ; Amalgam (Quarter circle forward + hard punch & hard kick)
name = "Amalgam"
command = ~D, DF, F, c+z
time = 40

[Command] ; Combo hyper (Quarter circle forward + medium punch & medium kick)
name = "ComboHyper"
command = ~D, DF, F, b+y
time = 40

[Command]
name = "qcf_2p"
command = ~D, DF, F, x+y

[Command]
name = "qcf_2p"
command = ~D, DF, F, x+z

[Command]
name = "qcf_2p"
command = ~D, DF, F, y+z

[Command]
name = "qcb_2p"
command = ~D, DB, B, x+y

[Command]
name = "qcb_2p"
command = ~D, DB, B, x+z

[Command]
name = "qcb_2p"
command = ~D, DB, B, y+z

[Command]
name = "qcf_2k"
command = ~D, DF, F, a+b

[Command]
name = "qcf_2k"
command = ~D, DF, F, a+c

[Command]
name = "qcf_2k"
command = ~D, DF, F, b+c

[Command]
name = "qcb_2k"
command = ~D, DB, B, a+b

[Command]
name = "qcb_2k"
command = ~D, DB, B, a+c

[Command]
name = "qcb_2k"
command = ~D, DB, B, b+c


[Command] ; Overload hyper (Dragon Punch + punch & kick of equal strength)
name = "Overload"
command = ~F, D, F, a+x
time = 40

[Command] ; Overload hyper (Dragon Punch + punch & kick of equal strength)
name = "Overload"
command = ~F, D, F, b+y
time = 40

[Command] ; Overload hyper (Dragon Punch + punch & kick of equal strength)
name = "Overload"
command = ~F, D, F, c+z
time = 40




;-| Specials |-----------------------------------------------------------
[Command]
name = "hcb_x"
command = ~F, D, B, x

[Command]
name = "hcb_x"
command = ~F, DF, D, DB, B, x

[Command]
name = "hcb_y"
command = ~F, D, B, y

[Command]
name = "hcb_y"
command = ~F, DF, D, DB, B, y

[Command]
name = "hcb_z"
command = ~F, D, B, z

[Command]
name = "hcb_z"
command = ~F, DF, D, DB, B, z

[Command]
name = "qcf_x"
command = ~D, DF, F, x

[Command]
name = "qcf_y"
command = ~D, DF, F, y

[Command]
name = "qcf_z"
command = ~D, DF, F, z

[Command]
name = "anti_x"
command = ~F, D, F, x

[Command]
name = "anti_y"
command = ~F, D, F, y

[Command]
name = "anti_z"
command = ~F, D, F, z

[Command]
name = "qcf_a"
command = ~D, DF, F, a

[Command]
name = "qcf_b"
command = ~D, DF, F, b

[Command]
name = "qcf_c"
command = ~D, DF, F, c

[Command]
name = "qcb_a"
command = ~D, DB, B, a

[Command]
name = "qcb_b"
command = ~D, DB, B, b

[Command]
name = "qcb_c"
command = ~D, DB, B, c

[Command]
name = "qcb_x"
command = ~D, DB, B, x

[Command]
name = "qcb_y"
command = ~D, DB, B, y

[Command]
name = "qcb_z"
command = ~D, DB, B, z

[Command]
name = "frenzy"
command = x+c
time = 1

[Command]
name = "frenzy"
command = a+z
time = 1


;---------------------------------------------------------------------------
; 2. State entry
; Don't remove the following line. It's required by the CMD standard.
[Statedef -1]
[State -1, AIActivate]
type = VarSet
triggerall = var(1) != 1
triggerall = RoundState != 3
trigger1  = IsHelper(10) || IsHelper(11)  ; Lobo clones
trigger2  = command = "CPU2"
trigger3  = command = "CPU3"
trigger4  = command = "CPU4"
trigger5  = command = "CPU5"
trigger6  = command = "CPU6"
trigger7  = command = "CPU7"
trigger8  = command = "CPU8"
trigger9  = command = "CPU9"
trigger10  = command = "CPU10"
trigger11  = command = "CPU11"
trigger12  = command = "CPU12"
trigger13  = command = "CPU13"
trigger14  = command = "CPU14"
trigger15  = command = "CPU15"
trigger16  = command = "CPU16"
trigger17  = command = "CPU17"
trigger18  = command = "CPU18"
trigger19  = command = "CPU19"
trigger20  = command = "CPU20"
trigger21  = command = "CPU21"
trigger22  = command = "CPU22"
trigger23  = command = "CPU23"
trigger24  = command = "CPU24"
trigger25  = command = "CPU25"
trigger26  = command = "CPU26"
trigger27  = command = "CPU27"
trigger28  = command = "CPU28"
trigger29  = command = "CPU29"
trigger30  = command = "CPU30"
var(1) = 1


;======================================================================
;User Input Attacks
;---------------------------------------------------------------------------

;---------------------------------------------------------------------------
; Power Overload hyper
[State -1, PowerOverload]
type = ChangeState
value = 6000
triggerall = command = "Overload"
triggerall = power >= 3000
triggerall = (StateType != A) && (MoveType != H)
trigger1 = ctrl

;---------------------------------------------------------------------------
; Quick Snack (slot 1 power set exchange)
[State -1, QuickSnack1]
type = ChangeState
value = 4500
triggerall = statetype != A && !IsHelper
trigger1 = command = "qcb_2p"
persistent = 0

;---------------------------------------------------------------------------
; Quick Snack (slot 2 power set exchange)
[State -1, QuickSnack2]
type = ChangeState
value = 4501
triggerall = statetype != A && !IsHelper
trigger1 = command = "qcb_2k"
persistent = 0

;---------------------------------------------------------------------------
; Amalgam Hyper
[State -1, Amalgam]
type = Null ;ChangeState
value = 4000
triggerall = command = "Amalgam"
triggerall = power >= 5000
triggerall = StateType != A
triggerall = MoveType != H
trigger1 = ctrl

;---------------------------------------------------------------------------
; Stolen Hyper - slot 1
[State -1, StolenHyper1]
type = ChangeState
value = 3000
triggerall = command = "qcf_2p"
triggerall = power >= 1000 && !IsHelper
triggerall = (StateType != A) && (MoveType != H)
trigger1 = ctrl

;---------------------------------------------------------------------------
; Stolen Hyper - slot 2
[State -1, StolenHyper2]
type = ChangeState
value = 3001
triggerall = command = "qcf_2k"
triggerall = (power >= 1000) && !IsHelper
triggerall = (StateType != A) && (MoveType != H)
trigger1 = ctrl

;---------------------------------------------------------------------------
; Combo Hyper
[State -1, ComboHyper]
type = null; ChangeState
value = 4000
triggerall = command = "ComboHyper"
triggerall = power >= 3000 && !IsHelper
;triggerall = (StateType != A) && (MoveType != H)
trigger1 = ctrl

;---------------------------------------------------------------------------
; Air Stolen Special - slot 1
[State -1, Air StolenSpecial1]
type = ChangeState
value = 2000
triggerall = statetype = A && enemynear,anim != 5300 && ctrl
triggerall = (command = "qcf_x") || (command = "qcf_y") || (command = "qcf_z")
trigger1 = Var(50) = 1 ; superman heat vision
trigger2 = Var(50) = 3 ; wondy fierce amazon
trigger3 = Var(50) = 9 ; etrigan flaming charge
trigger4 = Var(50) = 14 ; bizarro ice vision
trigger5 = Var(50) = 21 ; starfire star sphere
trigger6 = Var(50) = 23 ; eradicator flying punch
trigger7 = Var(50) = 54 ; spider-man web-ball
trigger8 = Var(50) = 69 ; human torch fireball
trigger9 = Var(50) = 70 ; silver surfer power cosmic
trigger10= Var(50) = 75 ; marrow bonerang

;---------------------------------------------------------------------------
; Air Stolen Special - slot 2
[State -1, Air StolenSpecial2]
type = ChangeState
value = 2001
triggerall = statetype = A && enemynear,anim != 5300 && ctrl
triggerall = (command = "qcf_a") || (command = "qcf_b") || (command = "qcf_c")
trigger1 = Var(50) = 1 ; superman heat vision
trigger2 = Var(50) = 3 ; wondy fierce amazon
trigger3 = Var(50) = 9 ; etrigan flaming charge
trigger4 = Var(50) = 14 ; bizarro ice vision
trigger5 = Var(50) = 21 ; starfire star sphere
trigger6 = Var(50) = 23 ; eradicator flying punch
trigger7 = Var(50) = 54 ; spider-man web-ball
trigger8 = Var(50) = 69 ; human torch fireball
trigger9 = Var(50) = 70 ; silver surfer power cosmic
trigger10= Var(50) = 75 ; marrow bonerang


;---------------------------------------------------------------------------
; Feeding Frenzy
[State -1, Feeding Frenzy]
type = ChangeState
value = 1300
triggerall = statetype != A && !IsHelper
trigger1 = command = "frenzy"
persistent = 0

;---------------------------------------------------------------------------
; Feeding Frenzy (air)
[State -1, Feeding Frenzy]
type = ChangeState
value = 1350
triggerall = statetype = A && !IsHelper
trigger1 = command = "frenzy"
persistent = 0

;---------------------------------------------------------------------------
; Stolen Special - slot 1
[State -1, StolenSpecial1]
type = ChangeState
value = 2000
triggerall = statetype != A && enemynear,anim != 5300
triggerall = (command = "qcf_x") || (command = "qcf_y") || (command = "qcf_z")
triggerall = Var(50) > 0 && !IsHelper
trigger1 = ctrl

;---------------------------------------------------------------------------
; Stolen Special - slot 2
[State -1, StolenSpecial2]
type = ChangeState
value = 2001
triggerall = statetype != A && enemynear,anim != 5300
triggerall = (command = "qcf_a") || (command = "qcf_b") || (command = "qcf_c")
triggerall = Var(51) > 0 && !IsHelper
trigger1 = ctrl

;---------------------------------------------------------------------------
; Projectile absorption
[State -1, Projectile Absorb]
type = ChangeState
value = 1200
triggerall = statetype != A && !IsHelper
trigger1 = command = "absorb"
persistent = 0

;---------------------------------------------------------------------------
; Feeding Time (Slot 1 - Punches)
[State -1, feedingtime slot 1]
type = ChangeState
value = 1000
triggerall = statetype != A && ctrl && !IsHelper
trigger1 = (command = "qcb_x") || (command = "qcb_y") || (command = "qcb_z")

;---------------------------------------------------------------------------
; Feeding Time (Slot 2 - Kicks)
[State -1, feedingtime slot 2]
type = ChangeState
value = 1001
triggerall = statetype != A && ctrl && !IsHelper
trigger1 = (command = "qcb_a") || (command = "qcb_b") || (command = "qcb_c")


;---------------------------------------------------------------------------
; Standing Push Block (AKA advancing guard)
[State -1, SPushBlock]
type = null ;ChangeState
value = 750
triggerall = command = "pushblock" && StateType = S && !var(1)
triggerall = !IsHelper
trigger1 = StateNo = 130
trigger2 = StateNo = [150, 151]

;---------------------------------------------------------------------------
; Crouching Push Block
[State -1, CPushBlock]
type = null ;ChangeState
value = 752
triggerall = command = "pushblock" && StateType = C && !var(1)
trigger1 = StateNo = 131
trigger2 = StateNo = [152, 153]

;---------------------------------------------------------------------------
; Air Push Block
[State -1, APushBlock]
type = null ;ChangeState
value = 754
triggerall = command = "pushblock" && StateType = A && !var(1)
trigger1 = StateNo = 132
trigger2 = StateNo = [154, 155]

;---------------------------------------------------------------------------
; Fwd Dash
[State -1, FwdDash]
type = ChangeState
value = 100
triggerall = command != "holdback" && !var(1)
triggerall = statetype = S
triggerall = ctrl = 1
trigger1 = command = "FF"
trigger2 = command = "3P"

;---------------------------------------------------------------------------
; Back Dash
[State -1, BackDash]
type = ChangeState
value = 105
triggerall = statetype = S && !var(1)
triggerall = ctrl = 1
trigger1 = command = "BB"
trigger2 = command = "holdback"
trigger2 = command = "3P"


;---------------------------------------------------------------------------
; Flight mode (stolen from Superman)
[State -1, Flight On]
type = ChangeState
value = 760
triggerall = StateNo != 761 && (Var(50) = 1 || Var(51) = 1)
trigger1 = command = "flight"
persistent = 0


;---------------------------------------------------------------------------
; Wall jump (stolen from Spider-Man / Ice)
[State -1, Wall jump]
type = ChangeState
value = 740
triggerall = (StateType = A) && (Ctrl) && (Pos Y < -30)
triggerall =  Var(50) = 6 || Var(51) = 6 || Var(50) = 54 || Var(51) = 54
trigger1 = ((command = "holdup") && (command = "holdfwd") && (Vel X <= 0) && (backedgebodydist <= 10) && (backedgebodydist > -10))
trigger2 = ((command = "holdup") && (command = "holdback") && (Vel X >= 0) && (frontedgebodydist <= 10) && (frontedgebodydist > -10))
persistent = 0


;---------------------------------------------------------------------------
; Air jump (stolen from Invisible Woman)
[State -1, Air jump]
type = ChangeState
value = 45
triggerall = (Anim = [41,46]) && (Ctrl) && Pos Y < -20
triggerall =  var(16) > 0
trigger1 = command = "airjump"
persistent = 0

;---------------------------------------------------------------------------
; Superjump
[State -1, Superjump]
type = ChangeState
value = 699
triggerall = (StateType != A)
trigger1 = (command = "DU") && (Ctrl)
trigger2 = (command = "3K") && (Ctrl)
trigger3 = (command = "holdup") && StateNo = 450

;---------------------------------------------------------------------------
; Taunt
[State -1, Taunt]
type = ChangeState
value = 195
triggerall = statetype = S && !var(1)
triggerall = ctrl = 1
trigger1 = command = "start"


;---------------------------------------------------------------------------
; Throws & grapples
;---------------------------------------------------------------------------
; Throw 1
[State -1, Throw1]
type = ChangeState
value = 300
triggerall = (command = "z") && ((command = "holdfwd") || (command = "holdback"))
triggerall = statetype = S && p2movetype != H && p2statetype != A
trigger1 = ctrl && (P2BodyDist X <= 30) && !IsHelper


;---------------------------------------------------------------------------
; Standing basics
;
; Punches: 210, 230, 250
; Kicks: 220, 240, 260
;---------------------------------------------------------------------------
; Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 210
triggerall = (command = "x") && (statetype = S) && !var(1)
trigger1 = ctrl = 1

; Flash ultra-comboing passive ability
trigger2 = MoveContact && (Var(50) = 4 || Var(51) = 4)

;---------------------------------------------------------------------------
; Stand Light Kick
[State -1, Stand Light Kick]
type = ChangeState
value = 220
triggerall = (command = "a") && (statetype = S) && !var(1)
trigger1 = ctrl

; Flash ultra-comboing passive ability
trigger2 = MoveContact && (Var(50) = 4 || Var(51) = 4)

;---------------------------------------------------------------------------
; Stand Medium Punch
[State -1, Stand Medium Punch]
type = ChangeState
value = 230
triggerall = (command = "y") && (statetype = S) && !var(1)
trigger1 = ctrl

; (chain combos)
trigger2 = (StateNo = 210) && MoveContact

; Flash ultra-comboing passive ability
trigger3 = MoveContact && (Var(50) = 4 || Var(51) = 4)

;---------------------------------------------------------------------------
; Stand Medium Kick
[State -1, Stand Medium Kick]
type = ChangeState
value = 240
triggerall = (command = "b") && (statetype = S) && !var(1)
trigger1 = ctrl

; (chain combos)
trigger2 = (StateNo = 220) && MoveContact

; Flash ultra-comboing passive ability
trigger3 = MoveContact && (Var(50) = 4 || Var(51) = 4)

;---------------------------------------------------------------------------
; Stand Hard Punch
[State -1, Stand Hard Punch]
type = ChangeState
value = 250
triggerall = (command = "z") && (statetype = S) && !var(1)
trigger1 = ctrl

; (chain combos)
trigger2 = stateno = 210 && movecontact
trigger3 = stateno = 230 && movecontact

; Flash ultra-comboing passive ability
trigger4 = MoveContact && (Var(50) = 4 || Var(51) = 4)

;---------------------------------------------------------------------------
; Stand Hard Kick
[State -1, Stand Hard Kick]
type = ChangeState
value = 260
triggerall = (command = "c") && (statetype = S) && !var(1)
trigger1 = ctrl

; (chain combos)
trigger2 = stateno = 220 && movecontact
trigger3 = stateno = 240 && movecontact

; Flash ultra-comboing passive ability
trigger4 = MoveContact && (Var(50) = 4 || Var(51) = 4)

;---------------------------------------------------------------------------
; Crouching basics
;---------------------------------------------------------------------------
; Crouch Light Punch
[State -1, Crouch Light Punch]
type = ChangeState
value = 410
triggerall = (command = "x") && (statetype = C)
trigger1 = ctrl

;---------------------------------------------------------------------------
; Crouch Light Kick
[State -1, Crouch Light Kick]
type = ChangeState
value = 420
triggerall = (command = "a") && (statetype = C)
trigger1 = ctrl

;---------------------------------------------------------------------------
; Crouch Medium Punch
[State -1, Crouch Medium Punch]
type = ChangeState
value = 430
triggerall = (command = "y") && (statetype = C)
trigger1 = ctrl

; (chain combos)
trigger2 = stateno = 410 && movecontact

;---------------------------------------------------------------------------
; Crouch Medium Kick
[State -1, Crouch Medium Kick]
type = ChangeState
value = 440
triggerall = (command = "b") && (statetype = C)
trigger1 = ctrl

; (chain combos)
trigger2 = stateno = 420 && movecontact

;---------------------------------------------------------------------------
; Crouch Hard Punch
[State -1, Crouch Hard Punch]
type = ChangeState
value = 450
triggerall = (command = "z") && (statetype = C)
trigger1 = ctrl

; (chain combos)
trigger2 = stateno = 410 && movecontact
trigger3 = stateno = 430 && movecontact

;---------------------------------------------------------------------------
; Crouch Hard Kick
[State -1, Crouch Hard Kick]
type = ChangeState
value = 460
triggerall = (command = "c") && (statetype = C)
trigger1 = ctrl

; (chain combos)
trigger2 = stateno = 420 && movecontact
trigger3 = stateno = 440 && movecontact


;---------------------------------------------------------------------------
; Air basics
;
; Punches: 610, 630, 650
; Kicks: 620, 640, 660
;---------------------------------------------------------------------------
; Air Light Punch
[State -1, Air Light Punch]
type = ChangeState
value = 610
triggerall = (command = "x") && (statetype = A || StateNo = 761)
trigger1 = ctrl

;---------------------------------------------------------------------------
; Air Light Kick
[State -1, Air Light Kick]
type = ChangeState
value = 620
triggerall = (command = "a") && (statetype = A || StateNo = 761)
trigger1 = ctrl

; (zigzag combo)
trigger2 = StateNo = 610 && MoveContact

;---------------------------------------------------------------------------
; Air Medium Punch
[State -1, Air Medium Punch]
type = ChangeState
value = 630
triggerall = (command = "y") && (statetype = A || StateNo = 761)
trigger1 = ctrl

; (zigzag combo)
trigger2 = stateno = 610 && movecontact
trigger3 = stateno = 620 && movecontact

;---------------------------------------------------------------------------
; Air Medium Kick
[State -1, Air Medium Kick]
type = ChangeState
value = 640
triggerall = (command = "b") && (statetype = A || StateNo = 761)
trigger1 = ctrl

; (zigzag combo)
trigger2 = stateno = 610 && movecontact
trigger3 = stateno = 620 && movecontact
trigger4 = stateno = 630 && movecontact

;---------------------------------------------------------------------------
; Air Hard Punch
[State -1, Air Hard Punch]
type = ChangeState
value = 650
triggerall = (command = "z") && (statetype = A || StateNo = 761)
trigger1 = ctrl

; (zigzag combo)
trigger2 = stateno = 610 && movecontact
trigger3 = stateno = 620 && movecontact
trigger4 = stateno = 630 && movecontact
trigger5 = stateno = 640 && movecontact

;---------------------------------------------------------------------------
; Air Hard Kick
[State -1, Air Hard Kick]
type = ChangeState
value = 660
triggerall = (command = "c") && (statetype = A || StateNo = 761)
trigger1 = ctrl

; (zigzag combo)
trigger2 = stateno = 610 && movecontact
trigger3 = stateno = 620 && movecontact
trigger4 = stateno = 630 && movecontact
trigger5 = stateno = 640 && movecontact
trigger6 = stateno = 650 && movecontact



;======================================================================
; A.I Attacks


;---------------------------------------------------------------------------
; Power Overload hyper
[State -1, PowerOverload AI]
type = ChangeState
value = 6000
triggerall = Var(1) && (power >= 3000) && ctrl
triggerall = (StateType != A) && (MoveType != H) && !winko && !IsHelper
triggerall = StateNo != [6000,6010]
trigger1 = P2BodyDist X < 125 && random > 150

;---------------------------------------------------------------------------
; Stolen Hyper
[State -1, stolen hyper AI]
type = ChangeState
value = IfElse(Random < 500, 3000, 3001)
triggerall = Var(1) && power >= 1000 && ctrl
triggerall = (StateType != A) && (MoveType != H)
trigger1 = P2BodyDist Y = [-30,50]
trigger1 = enemynear, movetype = A

;---------------------------------------------------------------------------
; projectile absorb
[State -1, absorb AI]
type = ChangeState
value = 1200
triggerall = Var(1) && ctrl
triggerall = StateType != A && MoveType != H && !winko && !IsHelper
trigger1 = enemynear, numproj > 0

;---------------------------------------------------------------------------
; feeding time
[State -1, feeding time AI]
type = ChangeState
value = IfElse(Random<500, 1000, 1001)
triggerall = Var(1) && ctrl && prevstateno != [1000,1001]
triggerall = p2statetype != C && random < 250
triggerall = StateType != A && MoveType != H && !winko && !IsHelper
triggerall = var(50) != var(47)
triggerall = var(51) != var(47)
trigger1 = P2BodyDist Y = [-25,25]
trigger1 = P2BodyDist X < 100 && enemynear, statetype = S && enemynear, numproj = 0

;---------------------------------------------------------------------------
; use stolen special
[State -1, stolen special AI]
type = ChangeState
value = IfElse(Random<500, 2000, 2001)
triggerall = Var(1) && ctrl && prevstateno != [2000,2001]
triggerall = p2statetype != C && random > 250
triggerall = StateType != A && MoveType != H && !winko && !IsHelper
trigger1 = P2BodyDist Y = [-50,50]
trigger1 = P2BodyDist X > 80 && enemynear, statetype = S && enemynear, numproj = 0

;---------------------------------------------------------------------------
; Crouch Hard Punch (launcher)
[State -1, Crouch launcher]
type = ChangeState
value = 450
triggerall = Var(1) && ctrl
triggerall = StateType != A && MoveType != H && !winko
trigger1 = p2bodydist X <= 30 && (enemynear, anim = 5300)
trigger2 = p2bodydist X <= 30 && (enemynear, statetype = S) && Random = [150,850]

;---------------------------------------------------------------------------
;Super Jump
[State -1, SuperJump AI]
type = ChangeState
value = 699
triggerall = (StateType != A) && Var(1)
trigger1 = (StateNo = 450) && (MoveHit = 1)
trigger2 = (enemynear, Vel X >= 4) && ctrl

;----------------------------------------------------------------------
; Ground combo
[State -1, GroundComboWeak AI]
type = ChangeState
triggerall = var(1) && StateType = S
trigger1 = (StateNo = [210,230]) && (MoveContact)
value = IfElse(StateNo = 210,220,IfElse(StateNo = 220,230,240))
persistent = 0

[State -1, GroundComboStrong AI]
type = ChangeState
triggerall = var(1) && StateType = S
trigger1 = (StateNo = [240,250]) && (MoveContact)
value = IfElse(StateNo = 240,250,260)
persistent = 0

;----------------------------------------------------------------------
; crouching combo
[State -1, CrouchComboWeak AI]
type = ChangeState
triggerall = var(1) && StateType = C
trigger1 = (StateNo = [410,430]) && (MoveContact)
value = IfElse(StateNo = 410,420,IfElse(StateNo = 420,430,440))
persistent = 0

[State -1, CrouchComboStrong AI]
type = ChangeState
triggerall = var(1) && StateType = C
trigger1 = (StateNo = 440) && MoveContact
value = 450
persistent = 0

;----------------------------------------------------------------------
; Air combo
[State -1, AirComboWeak AI]
type = ChangeState
triggerall = var(1) && StateType = A
trigger1 = (StateNo = [610,630]) && (MoveContact)
value = IfElse(StateNo = 610,620,IfElse(StateNo = 620,630,640))
persistent = 0

[State -1, AirComboStrong AI]
type = ChangeState
triggerall = var(1) && StateType = A
trigger1 = (StateNo = [640,650]) && (MoveContact)
value = IfElse(StateNo = 640,650,660)
persistent = 0


;---------------------------------------------------------------------------
[State -1, StandGuard AI]
type = ChangeState
triggerall = (var(1) = 1) && (StateType = S) && (Pos Y >= 0) && (P2BodyDist Y <= 0) && stateno != 130
triggerall = (P2BodyDist Y >= -120) && (P2StateType != C) && (P2MoveType = A)
trigger1 = (P2Dist X <= 10) && (Random <= 799) && (Ctrl)
trigger2 = (StateNo = [140, 155]) || (StateNo = [100, 105]) && ctrl
value = 130

[State -1, CrouchGuard AI]
type = ChangeState
triggerall = (var(1) = 1) && (StateType != A) && (Pos Y >= 0) && (P2BodyDist Y <= 0) && stateno != 131
triggerall = (P2BodyDist Y >= -50) && (P2StateType = C) && (P2MoveType = A)
trigger1 = (P2BodyDist X <= 120) && (Random <= 799) && (Ctrl)
trigger2 = (StateNo = [140, 155]) || (StateNo = [100, 105])
value = 131

[State -1, AirGuard AI]
type = ChangeState
triggerall = var(1) = 1 && StateType = A && Pos Y < 0 && P2BodyDist Y >= -120 && stateno != 132
trigger1 = P2BodyDist X <= 120 && (Ctrl || (StateNo = [140, 155])) && enemynear,movetype = A
value = 132

;---------------------------------------------------------------------------
; Standing Push Block (AKA advancing guard)
[State -1, SPushBlock AI]
type = null ;ChangeState
value = 750
triggerall = backedgebodydist <= 9 && StateType = S && var(1)
trigger1 = StateNo = 130 && !winko
trigger2 = StateNo = [150, 151]

;---------------------------------------------------------------------------
; Crouching Push Block
[State -1, CPushBlock AI]
type = null ;ChangeState
value = 752
triggerall = backedgebodydist <= 9 && StateType = C && var(1)
trigger1 = StateNo = 131
trigger2 = StateNo = [152, 153]

;---------------------------------------------------------------------------
; Air Push Block
[State -1, APushBlock AI]
type = null ;ChangeState
value = 754
triggerall = backedgebodydist <= 9 && StateType = A && var(1)
trigger1 = StateNo = 132
trigger2 = StateNo = [154, 155]


;---------------------------------------------------------------------------
; Fwd Dash
[State -1, FwdDash AI]
type = ChangeState
value = 100
triggerall = Var(1) = 1 && !WinKo && ctrl
triggerall = (statetype = S) && enemynear, p2dist X >= 100
trigger1 = enemynear, movetype != A && enemynear, numproj = 0 && enemynear, statetype != L
trigger2 = enemynear, statetype = L && random <= 300 && enemy, numproj = 0

;---------------------------------------------------------------------------
; Back Dash
[State -1, BackDash AI]
type = ChangeState
value = 105
triggerall = statetype = S && Var(1) && ctrl
trigger1 = enemynear, p2dist x <= 100 && enemynear,movetype = A && random <= 300

;---------------------------------------------------------------------------
; Standing throw
[State -1, Throw1]
type = ChangeState
value = 300
triggerall = Var(1) && !winko && ctrl
triggerall = statetype = S && enemynear, statetype != L && random < 100
trigger1 = (P2BodyDist X <= 25) && enemynear, statetype != C


;-----------------------
;  DCvM Template Files
;      provided by
;       Buyog2099
;(based on MEE template
;  by Kitsune Sniper)
;         ***
;   Thanks, Kitsune!
;-----------------------
