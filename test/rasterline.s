
; ***** This code is drawn from the tutorial #3 from PHOTON of SCOOPEX
; Watch the video on Youtube: https://youtu.be/dVLnL7_jtu0


    xdef _rasterbar

_rasterbar:


init:
	move #$ac,d7		;start y position
	move #1,d6		;y add

**************************
mainloop:
wframe:
	cmp.b #$ff,$dff006
	bne wframe

;-----frame loop start---

	add d6,d7		;add "1" to y position

	cmp #$f0,d7		;bottom check
	blo ok1
	neg d6			;change direction
ok1:

	cmp.b #$40,d7
	bhi ok2
	neg d6			;change direction
ok2:

waitras1:
	cmp.b $dff006,d7
	bne waitras1
	move.w #$fff,$dff180

waitras2:
	cmp.b $dff006,d7
	beq waitras2
	move.w #$116,$dff180

;-----frame loop end---

	btst #6,$bfe001
	bne mainloop
**************************
	rts
