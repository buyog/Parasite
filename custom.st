; States file for Parasite -- Custom states (powerset-specific)
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


;-------------------------
; custom stance effects (powerset-based)
; 05: Green Lantern
;-------------------------
; stance effect (helper)
[StateDef 30000]
type = A
movetype = I
physics = N
ctrl = 0
anim = 30000
velset = 0,0
sprpriority = 1

[State 30000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 1

; keep positioned appropriately
[State 30000, PosSet]
type = PosSet
trigger1 = 1
x = parent,Pos X
y = parent,Pos Y

; GL effect
[State 30000, ChangeAnim]
type = null ;ChangeAnim
triggerall = parent,anim = 0 && anim != 30005
trigger1 = parent,var(50) = 5 || parent,var(51) = 5
value = 30005
elem = parent, AnimElemNo(0)




;-------------------------
; custom guard effects (powerset-based)
; 06: Ice
; 68: Thing
; 71: Venom
;-------------------------
; start guard effect (helper)
[StateDef 13000]
type = A
movetype = I
physics = N
ctrl = 0
anim = 13000
velset = 0,0
sprpriority = 1

[State 13000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 1

; Ice guard
[State 13000, ChangeAnim]
type = ChangeAnim
triggerall = !Time
trigger1 = parent,var(50) = 6 || parent,var(51) = 6
value = 13006

; Thing guard
[State 13000, ChangeAnim]
type = ChangeAnim
triggerall = !Time
trigger1 = parent,var(50) = 68 || parent,var(51) = 68
value = 13068

; Venom guard
[State 13000, ChangeAnim]
type = ChangeAnim
triggerall = !Time
trigger1 = parent,var(50) = 71 || parent,var(51) = 71
value = 13071

; reposition if crouching
[State 13000, PosSet]
type = PosSet
trigger1 = StateType = C
x = parent,Pos X
y = parent,Pos Y+30

; reposition if standing
[State 13000, PosSet]
type = PosSet
trigger1 = StateType != C
x = parent,Pos X
y = parent,Pos Y

; done guarding
[State 13000, ChangeState]
type = ChangeState
trigger1 = parent, Anim != [120,159]
;trigger2 = Time > 0
value = 15000
ctrl = 0


; end guard effect (helper)
[StateDef 15000]
type = A
movetype = I
physics = N
ctrl = 0
velset = 0,0
sprpriority = 1

[State 15000, ChangeAnim]
type = ChangeAnim
trigger1 = AnimExist(Anim+2000)
value = Anim+2000

[State 15000, DestroySelf]
type = DestroySelf
trigger1 = AnimTime = 0
trigger2 = !AnimExist(Anim+2000)




;-------------------------
; custom hard punch effects
; 06: Ice
; 16: Doomsday
; 57: Sandman (thanks, Batzarro!)
; 59: Carnage (thanks, MattGodChurch!)
; 68: Thing
; 71: Venom
;-------------------------
; start punch effect (helper)
[StateDef 25000]
type = A
movetype = I
physics = N
ctrl = 0
anim = 25000
velset = 0,0
sprpriority = 2

[State 25000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 1

; start effect, if applicable
[State 25000, ChangeAnim]
type = ChangeAnim
triggerall = !Time
trigger1 = AnimExist(25000 + parent,var(50))
value = 25000 + parent,var(50)

; custom hitdefs for certain moves
[State 25000, Ice HitDef]
type = HitDef
trigger1 = Anim = 25006
attr = S,NA
hitflag = MAF
guardflag = MA
animtype = hard
priority = 6,Hit
damage = 1000,0
pausetime = 0,0
;guard.pause,0
sparkno = S9992
;guard.sparkno = 0
;sparkxy = 0,0
hitsound = S2,2
guardsound = S3,0
ground.type = High
p2stateno = 3063

; done
[State 25000, ChangeState]
type = DestroySelf
trigger1 = (parent, Anim != 250) && (parent, Anim != 255)
trigger2 = AnimTime = 0


;-------------------------
; custom hard kick effects
; 06: Ice
; 59: Carnage (thanks, MattGodChurch!)
;-------------------------
; start hard kick effect (helper)
[StateDef 26000]
type = A
movetype = I
physics = N
ctrl = 0
anim = 26000
velset = 0,0
sprpriority = 2

[State 26000, NotHitBy]
type = NotHitBy
trigger1 = 1
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT
time = 1

; start effect, if applicable
[State 26000, ChangeAnim]
type = ChangeAnim
triggerall = !Time
trigger1 = AnimExist(26000 + parent,var(51))
value = 26000 + parent,var(51)

; done
[State 26000, ChangeState]
type = DestroySelf
trigger1 = (parent, Anim != 260) && (parent, Anim != 265)
trigger2 = AnimTime = 0
