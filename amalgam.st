; States file for Parasite -- Amalgams
;
;---------------------------------------------------------------------------
; States in this file:
; 
; Amalgam Hyper (D,DF,F + HP+HK) - state 4000
;   (Move description goes here)
;
;----------------------------

;---------------------------------------------------------------------------
; Amalgam Hyper
; (incomplete -- only the intro portraits are done at this point)
[StateDef 4000]
type    = S
physics = S
ctrl = 1
anim = 0        ; change this to the anim char will perform when the Hyper starts
velset = 0,0
poweradd = -3000

[State 4000, superpause]
type = SuperPause
trigger1 = Time = 0 ;animelem = 2
time = 40
sound = S10,0
pos = -5,-45
darken = 1

[State 4000, Char Portrait]
type = Explod
trigger1 = Time = 0
anim = 4010
postype = left
pos = 0,0
ownpal = 1
ignorehitpause = 1
sprpriority = 1
supermovetime = 40
removeongethit = 1

[State 4000, Partner Portrait]
type = Explod
trigger1 = Time = 0
anim = 4011
postype = left
pos = 0,0
ownpal = 1
ignorehitpause = 1
sprpriority = 1
supermovetime = 40
removeongethit = 1
