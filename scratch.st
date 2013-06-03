;========================================================================
; scratch.st: leftovers and other bits that I may want to save for later
;========================================================================



;--------------------------------------------------------------
; Supernova (stolen from Human Torch)
[StateDef 6000]
type = S
movetype = A
physics = S
anim = 6000
ctrl = 0
velset = 0,0

[State 6000, snd]
type = PlaySnd
trigger1 = !Time
persistent = 0
value = 10,3
channel = 0

;-------------------
; DCvM hyper effects - dust, superpause, noBars, portrait/BG
[State 6000, dust]
type = Explod
trigger1 = !Time
anim = 918
supermove = 1
ontop = 1
removeongethit = 1

[State 6000, noBars]
type = AssertSpecial
trigger1 = 1
flag = nobardisplay
ignorehitpause = 1

[State 6000, PalFXWiz]
type = PalFX
trigger1 = AnimElem = 3
time = 50
add = 0,0,-100
mul = 256,256,256
sinadd = 80,80,40,10
invertall = 1
color = 0

[State 6000, snd2]
type = PlaySnd
trigger1 = AnimElem = 3
persistent = 0
value = 9,1

[State 6000, superpause]
type = SuperPause
trigger1 = AnimElem = 4
time = 40
sound = S10,1
pos = 0,0
darken = 1
poweradd = -3000

[State 6000, superportrait]
type = Explod
trigger1 = AnimElem = 4
anim = 10000
ID = 10000
pos = 0,0
postype = back
bindtime = 999
removetime = 40
supermovetime = 40
pausemovetime = 40
sprpriority = 3
ownpal = 1

[State 6000, portraitBG]
type = Explod
trigger1 = AnimElem = 4
anim = 10005
ID = 10005
pos = 0,0
postype = back
bindtime = 999
removetime = 40
supermove = 40
pausemovetime = 40
sprpriority = -2
ownpal = 1

[State 3020, superBG]
type = Helper
trigger1 = AnimElem = 5
name = "Super BG"
ID = 8005
stateno = 8005
postype = back
facing = 1
ownpal = 1
supermovetime = 999999
pausemovetime = 999999
ownpal = 1
; end DCvM stuff
;-------------------

[State 6000, jump]
type = VelSet
trigger1 = AnimElem = 5
y = const(velocity.jump.y)+1.5

[State 6000, snd]
type = PlaySnd
trigger1 = AnimElem = 5
persistent = 0
value = 8,0

[State 6000, StateTypeSet]
type = StateTypeSet
trigger1 = AnimElem = 5
statetype = A
physics = A

[State 6000, ChangeState]
type = ChangeState
trigger1 = !AnimTime && Vel Y > -2
;trigger2 = Time = 200
value = 6010


; Power Overload - exploding state
[StateDef 6010]
type    = A
movetype = A
physics = A
ctrl = 0
anim = 6010
velset = 0,0

[State 6010, snd]
type = PlaySnd
trigger1 = !Time
persistent = 0
value = 9,112

[State 6010, Projectile]
type = Projectile
trigger1 = time < 10
ProjID = 6050
projanim = 6050
projhitanim = 6050
projremanim = 6050
projcancelanim = -1
projscale = 2,2
projremove = 1
projremovetime = -1
velocity = 2.5,0
accel = 0,1
projpriority = 4
projsprpriority = 4
offset = 16,-120
; HitDef
attr = A,HP
hitflag = MAFD
guardflag = MA
animtype = hard
air.animtype = back
priority = 7,Dodge
damage = 30,1
pausetime = 2,2
hitsound = S2,2
guardsound = S3,0
ground.type = High
ground.slide = 5
ground.hit = 5
air.hittime = 20
ground.velocity = 2,0
air.velocity = 4,0
sprpriority = 1
palfx.time = 8
palfx.mul = 255,512,255
palfx.add = 40,80,40

[State 6010, Projectile]
type = Projectile
trigger1 = time < 10
ProjID = 6050
projanim = 6050
projhitanim = 6050
projremanim = 6050
projcancelanim = -1
projscale = 2,2
projremove = 1
projremovetime = -1
velocity = 1.25,2.5
accel = 1,0.5
projpriority = 4
projsprpriority = 4
offset = 16,-120
; HitDef
attr = A,HP
hitflag = MAFD
guardflag = MA
animtype = hard
air.animtype = back
priority = 7,Dodge
damage = 30,1
pausetime = 2,2
hitsound = S2,2
guardsound = S3,0
ground.type = High
ground.slide = 5
ground.hit = 5
air.hittime = 20
ground.velocity = 2,0
air.velocity = 4,0
sprpriority = 1
palfx.time = 8
palfx.mul = 255,512,255
palfx.add = 40,80,40

[State 6010, Projectile]
type = Projectile
trigger1 = time < 10
ProjID = 6050
projanim = 6050
projhitanim = 6050
projremanim = 6050
projcancelanim = -1
projscale = 2,2
projremove = 1
projremovetime = -1
velocity = 0,2.5
accel = 1,0
projpriority = 4
projsprpriority = 4
offset = 16,-120
; HitDef
attr = A,HP
hitflag = MAFD
guardflag = MA
animtype = hard
air.animtype = back
priority = 7,Dodge
damage = 30,1
pausetime = 2,2
hitsound = S2,2
guardsound = S3,0
ground.type = High
ground.slide = 5
ground.hit = 5
air.hittime = 20
ground.velocity = 2,0
air.velocity = 4,0
sprpriority = 1
palfx.time = 8
palfx.mul = 255,512,255
palfx.add = 40,80,40

[State 6010, Projectile]
type = Projectile
trigger1 = time < 10
ProjID = 6050
projanim = 6050
projhitanim = 6050
projremanim = 6050
projcancelanim = -1
projscale = 2,2
projremove = 1
projremovetime = -1
velocity = -2.5,1.25
accel = -1,0.5
projpriority = 4
projsprpriority = 4
offset = 16,-120
; HitDef
attr = A,HP
hitflag = MAFD
guardflag = MA
animtype = hard
air.animtype = back
priority = 7,Dodge
damage = 30,1
pausetime = 2,2
hitsound = S2,2
guardsound = S3,0
ground.type = High
ground.slide = 5
ground.hit = 5
air.hittime = 20
ground.velocity = 2,0
air.velocity = 4,0
sprpriority = 1
palfx.time = 8
palfx.mul = 255,512,255
palfx.add = 40,80,40

[State 6010, Projectile]
type = Projectile
trigger1 = time < 10
ProjID = 6050
projanim = 6050
projhitanim = 6050
projremanim = 6050
projcancelanim = -1
projscale = 2,2
projremove = 1
projremovetime = -1
velocity = -2.5,0
accel = 0,-1
projpriority = 4
projsprpriority = 4
offset = 16,-120
; HitDef
attr = A,HP
hitflag = MAFD
guardflag = MA
animtype = hard
air.animtype = back
priority = 7,Dodge
damage = 30,1
pausetime = 2,2
hitsound = S2,2
guardsound = S3,0
ground.type = High
ground.slide = 5
ground.hit = 5
air.hittime = 20
ground.velocity = 2,0
air.velocity = 4,0
sprpriority = 1
palfx.time = 8
palfx.mul = 255,512,255
palfx.add = 40,80,40

[State 6010, Projectile]
type = Projectile
trigger1 = time < 10
ProjID = 6050
projanim = 6050
projhitanim = 6050
projremanim = 6050
projcancelanim = -1
projscale = 2,2
projremove = 1
projremovetime = -1
velocity = -1.25,-2.5
accel = -0.5,-1
projpriority = 4
projsprpriority = 4
offset = 16,-120
; HitDef
attr = A,HP
hitflag = MAFD
guardflag = MA
animtype = hard
air.animtype = back
priority = 7,Dodge
damage = 30,1
pausetime = 2,2
hitsound = S2,2
guardsound = S3,0
ground.type = High
ground.slide = 5
ground.hit = 5
air.hittime = 20
ground.velocity = 2,0
air.velocity = 4,0
sprpriority = 1
palfx.time = 8
palfx.mul = 255,512,255
palfx.add = 40,80,40

[State 6010, Projectile]
type = Projectile
trigger1 = time < 10
ProjID = 6050
projanim = 6050
projhitanim = 6050
projremanim = 6050
projcancelanim = -1
projscale = 2,2
projremove = 1
projremovetime = -1
velocity = 0,-2.5
accel = -1,0
projpriority = 4
projsprpriority = 4
offset = 16,-120
; HitDef
attr = A,HP
hitflag = MAFD
guardflag = MA
animtype = hard
air.animtype = back
priority = 7,Dodge
damage = 30,1
pausetime = 2,2
hitsound = S2,2
guardsound = S3,0
ground.type = High
ground.slide = 5
ground.hit = 5
air.hittime = 20
ground.velocity = 2,0
air.velocity = 4,0
sprpriority = 1
palfx.time = 8
palfx.mul = 255,512,255
palfx.add = 40,80,40

[State 6010, Projectile]
type = Projectile
trigger1 = time < 10
ProjID = 6050
projanim = 6050
projhitanim = 6050
projremanim = 6050
projcancelanim = -1
projscale = 2,2
projremove = 1
projremovetime = -1
velocity = 2.5,-1.25
accel = 1,-0.5
projpriority = 4
projsprpriority = 4
offset = 16,-120
; HitDef
attr = A,HP
hitflag = MAFD
guardflag = MA
animtype = hard
air.animtype = back
priority = 7,Dodge
damage = 30,1
pausetime = 2,2
hitsound = S2,2
guardsound = S3,0
ground.type = High
ground.slide = 5
ground.hit = 5
air.hittime = 20
ground.velocity = 2,0
air.velocity = 4,0
sprpriority = 1
palfx.time = 8
palfx.mul = 255,512,255
palfx.add = 40,80,40

[State 6010, SlowMotion]
type = Pause
triggerall = movehit
trigger1 = TimeMod = 1,0
time = 5
move!Time

[State 6010, no fall]
type = VelSet
trigger1 = time < 10
y = 0

[State 6000, safe fall]
type = ChangeState
trigger1 = !AnimTime
value = 948
ctrl = 1





;--------------------------------------------------
; super armor v2 (by Twilight Reaper; see here: http://mugenpulse.forums1.net/t18-super-armor-v2)
;--------------------------------------------------
[Statedef 9000]
movetype = I

[State 9000]
type = AssertSpecial
trigger1 = 1
flag = invisible
ignorehitpause = 1
pausemovetime = 9999999
supermovetime = 9999999

[State 9000]
type = BindToRoot
trigger1 = 1
pos = 0,0
pausemovetime = 9999999
supermovetime = 9999999

[State 9000]
type = ChangeAnim
trigger1 = root,AnimElemTime(1) = 0
value = Root,Anim
pausemovetime = 9999999
supermovetime = 9999999

[State 9000]
type = HitOverride
trigger1 = 1
attr = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT,AA,AP,AT
slot = 1
stateno = 9000
time = -1
ignorehitpause = 1
persistent = 1
pausemovetime = 9999999
supermovetime = 9999999

[State 9000]
type = NotHitBy
triggerall = (Root,Life > 0) || (Root,Stateno != 130) || (Root,Stateno != [140,170]) ; Insert not hit states here
trigger1 = !Time
value = SCA,NA,SA,HA,NP,SP,HP,NT,ST,HT,AA,AP,AT
time = 15
ignorehitpause = 1
persistent = 1
pausemovetime = 9999999
supermovetime = 9999999

[State 9000]
type = NotHitBy
trigger1 = (Root,Life <= 0) || (Root,Stateno = 130) || (Root,Stateno = [140,170]) ; Insert not hit states here
value = SCA
pausemovetime = 9999999
supermovetime = 9999999

[State 9000]
type = ParentVarSet
trigger1 = !Time
trigger1 = GetHitVar(damage)
v = 11 ; Variable range = 0-59
value = -2 ; Amount of damage will be done on GetHit
ignorehitpause = 1
pausemovetime = 9999999
supermovetime = 9999999

[State 9000]
type = ParentVarSet
trigger1 = time > 0
v = 11 ; Variable range = 0-59
value = 0
ignorehitpause = 1
pausemovetime = 9999999
supermovetime = 9999999

[State 9000]
type = Turn
trigger1 = P2Dist X < 0
ignorehitpause = 1
persistent = 1
pausemovetime = 9999999
supermovetime = 9999999



[Statedef-2]

[State -2]
type = Helper
triggerall = Numhelper(9000) = 0
trigger1 = RoundState >= 2
id = 9000
persistent = 0
name = "Armor"
pos = 0,0
postype = P1
stateno = 9000
helpertype = normal
ignorehitpause = 1
keyctrl = 0
ownpal = 1
pausemovetime = 9999999
supermovetime = 9999999

[State -2]
type = Lifeadd
trigger1 = 1
value = var(11)
pausemovetime = 9999999
supermovetime = 9999999

[State -2]
type = NotHitBy
trigger1 = 1
value = SCA
pausemovetime = 9999999
supermovetime = 9999999

[State -2]
type = PalFX
trigger1 = var(11)
time = 7 ; Set how long the gethit glow should last here
add = 0,150,200 ; Set color value
mul = 0,256,256 ; Set color value
sinadd = 0,0,0,10
invertall = 0
color = 256
ignorehitpause = 1
persistent = 1
pausemovetime = 9999999
supermovetime = 9999999
;--------------------------------------------------
; end of super armor v2
;--------------------------------------------------

