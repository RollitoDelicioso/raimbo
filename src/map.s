.area _DATA

enemies_qty: .dw #0x0000
puntero_bucle: .dw #0x0000

;; enemy_offset | enemy_x | enemy_y | enemy_h | enemy_w
enemies:
	.db #10, #30, #120, #2, #2
	.db #50, #50, #100, #2, #2
	.db #70, #50, #120, #2, #2
	.db #10, #60, #120, #2, #2
	.db #10, #70, #120, #2, #2

.area _CODE

.include "scroll.h.s"
.include "enemy.h.s"


map_drawEnemies::

	ld bc, #enemies
	
	bucle_local:

	;; Comprobacion de que hemos hecho todos los enemigos
	ld ix, #enemies_qty
	ld a, (ix)
	cp #5
	jr z, fin_bucle

	inc a
	ld ix, #enemies_qty
	ld (ix), a

	;; -----------------
	;; IF enemy_offset >= offset
	;; -----------------
	ld a, (bc)
	ld de, (offset)
	cp e
	jr c, incrementos

	;; -----------------
	;; AND enemy_offset < offset + 10
	;; -----------------
	ld hl, (offset)
	ld de, #10
	add hl, de
	cp l
	jr c, pintar_enemigo

	;; -----------------
	;; OR enemy_offset == offset + 10
	;; -----------------
	jr z, pintar_enemigo

	;; -----------------
	;; ELSE
	;; -----------------
	jr incrementos

	;; -----------------
	;; THEN pintar enemigo
	;; -----------------
	pintar_enemigo:
	inc bc
	ld a, (bc)
	call enemy_setX

	inc bc
	ld a, (bc)
	call enemy_setY

	push bc

	call enemy_draw

	pop bc

	;; Actualizacion de los valores para apuntar al siguiente enemigo
	inc bc
	inc bc
	inc bc
	jr bucle_local

	incrementos:
	inc bc
	inc bc
	inc bc
	inc bc
	inc bc
	jr bucle_local

	fin_bucle:
	ld ix, #enemies_qty
	ld (ix), #0

ret