.area _DATA

enemies_qty: .dw #0x0000

;; enemy_offset | enemy_alive | enemy_x | enemy_y |
enemies:
	.db #10, #1, #73, #120
	.db #70, #1, #73, #100
	.db #70, #1, #73, #80
	.db #70, #1, #73, #60
	.db #70, #1, #73, #50

puntero_enemies: .dw #enemies

.area _CODE

.include "scroll.h.s"
.include "enemy.h.s"

map_drawEnemies::

	ld bc, (puntero_enemies)

	;; -----------------
	;; IF offset >= enemy_offset
	;; -----------------
	ld a, (bc)
	ld d, a
	ld a, (offset)
	cp d
	jr c, fin_bucle_draw

	;;ld a, (bc)							;; A = enemy_offset
	;;ld de, (offset)						;;
	;;cp e
	;;jr c, fin_bucle_draw

	;; -----------------
	;; AND enemy_offset < offset + 10
	;; -----------------
	;;ld hl, (offset)
	;;ld de, #10
	;;add hl, de
	;;cp l
	;;jr c, pintar_enemigo

	;; -----------------
	;; OR enemy_offset == offset + 10
	;; -----------------
	;;jr z, pintar_enemigo

	;; -----------------
	;; ELSE
	;; -----------------
	;;jr incrementos

	;; -----------------
	;; THEN pintar enemigo
	;; -----------------
	inc bc

	pintar_enemigo:
	inc bc
	ld a, (bc)
	ld (enemy_x), a

	inc bc
	ld a, (bc)
	ld (enemy_y), a

	push bc

	call enemy_draw

	pop bc

	fin_bucle_draw:

ret

map_updateEnemies::

	ld bc, (puntero_enemies)

	;; -----------------
	;; IF offset >= enemy_offset
	;; -----------------
	ld a, (bc)
	ld d, a
	ld a, (offset)
	cp d
	jr c, fuera_foco

	;; -----------------
	;; AND enemy_offset < offset + 10
	;; -----------------
	;;ld hl, (offset)
	;;ld de, #10
	;;add hl, de
	;;cp l
	;;jr c, pintar_enemigo

	;; -----------------
	;; OR enemy_offset == offset + 10
	;; -----------------
	;;jr z, pintar_enemigo

	;; -----------------
	;; ELSE
	;; -----------------
	;;jr incrementos

	;; -----------------
	;; THEN update enemigo
	;; -----------------
	update_enemigo:
	inc bc
	inc bc
	ld a, (bc)
	ld (enemy_x), a

	inc bc
	ld a, (bc)
	ld (enemy_y), a

	push bc

	call enemy_update

	pop bc

	;; -----------------
	;; IF enemy_alive != 0 THEN sigue con este enemy
	;; -----------------
	ld a, (enemy_alive)
	cp #0
	jr z, actualizar_puntero

	dec bc
	ld a, (enemy_x)
	ld (bc), a

	inc bc
	ld a, (enemy_y)
	ld (bc), a

	jr fin_map_update

	;; -----------------
	;; SI SALE DEL FOCO, REESTABLECEMOS SU X
	;; -----------------
	fuera_foco:
	inc bc
	inc bc
	ld a, #73
	ld (bc), a
	jr fin_map_update

	;; -----------------
	;; ELSE
	;; -----------------
	actualizar_puntero:

	inc bc
	ld hl, #puntero_enemies
	ld (hl), c
	inc hl
	ld (hl), b

	ld a, #3
	ld (enemy_alive), a

	ld a, #0
	ld (death_isDraw), a

	fin_map_update:

ret

map_eraseEnemies::

	ld bc, (puntero_enemies)

	;; -----------------
	;; IF offset >= enemy_offset
	;; -----------------
	ld a, (bc)
	ld d, a
	ld a, (offset)
	cp d
	jr c, fin_bucle_erase

	;; -----------------
	;; AND enemy_offset < offset + 10
	;; -----------------
	;;ld hl, (offset)
	;;ld de, #10
	;;add hl, de
	;;cp l
	;;jr c, pintar_enemigo

	;; -----------------
	;; OR enemy_offset == offset + 10
	;; -----------------
	;;jr z, pintar_enemigo

	;; -----------------
	;; ELSE
	;; -----------------
	;;jr incrementos

	;; -----------------
	;; THEN pintar enemigo
	;; -----------------
	inc bc

	erase_enemigo:
	inc bc
	ld a, (bc)
	ld (enemy_x), a

	inc bc
	ld a, (bc)
	ld (enemy_y), a

	call enemy_erase

	fin_bucle_erase:
ret