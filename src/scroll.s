.area _DATA

;; Global
puntero_video:: .dw #0xC000
puntero_tilemap:: .dw #0x4000
offset:: .dw #0x0000

MAX_SCROLL: .db #80

.area _CODE

.include "cpctelera.h.s"

;;===========================================
;;===========================================
;;PRIVATE FUNTIONS
;;===========================================
;;===========================================
scroll:

	call cpct_waitVSYNC_asm

	ld hl, #offset
	ld l, (hl)
	call cpct_setVideoMemoryOffset_asm

ret

;;===========================================
;;===========================================
;;PUBLIC FUNTIONS
;;===========================================
;;===========================================
scroll_scrollLeft::

	;; Updating pointers
	ld hl, (offset)

	ld a, l 									;; A = offset
	cp #0										;; A == 0

	jr z, no_scroll_left						;; No se puede scrollear a la izquierda

	dec hl 										;; Se puede scrollear
	ld (offset), hl

	ld hl, (puntero_tilemap)
	dec hl
	ld (puntero_tilemap), hl

	ld hl, (puntero_video)
	dec hl
	dec hl
	ld (puntero_video), hl

	call scroll

	ld   hl, (puntero_tilemap)   ;; HL = pointer to the tilemap
	push hl              ;; Push ptilemap to the stack
	ld   hl, (puntero_video)  ;; HL = Pointer to video memory location where tilemap is drawn
	push hl              ;; Push pvideomem to the stack
	;; Set Paramters on registers
	ld    a, #120 ;; A = map_width
	ld    b, #0          ;; B = y tile-coordinate
	ld    c, #0          ;; C = x tile-coordinate
	ld    d, #46          ;; H = height in tiles of the tile-box
	ld    e, #1          ;; L =  width in tiles of the tile-box
	call  cpct_etm_drawTileBox2x4_asm ;; Call the function

	ld de, (puntero_video)
	ld c, #0
	ld b, #184
	call cpct_getScreenPtr_asm

	ex de, hl
	ld a, #0
	ld c, #2
	ld b, #8
	call cpct_drawSolidBox_asm

	no_scroll_left:
ret

scroll_scrollRight::

	;; Updating pointers
	ld hl, (offset)

	;; Comprobación de que se puede scrollear
	ld a, l 											;; A = offset
	cp #80										;; A == MAX_SCROLL

	jr z, no_scroll_right								;; No se puede scrollear más de 80 a la derecha

	inc hl 												;; Se puede scrollear
	ld (offset), hl

	ld hl, (puntero_tilemap)
	inc hl
	ld (puntero_tilemap), hl

	ld hl, (puntero_video)
	inc hl
	inc hl
	ld (puntero_video), hl

	call scroll

	ld   hl, (puntero_tilemap)   ;; HL = pointer to the tilemap
	push hl              ;; Push ptilemap to the stack
	ld   hl, (puntero_video)  ;; HL = Pointer to video memory location where tilemap is drawn
	push hl              ;; Push pvideomem to the stack
	;; Set Paramters on registers
	ld    a, #120 ;; A = map_width
	ld    b, #0          ;; B = y tile-coordinate
	ld    c, #39          ;; C = x tile-coordinate
	ld    d, #46          ;; H = height in tiles of the tile-box
	ld    e, #1          ;; L =  width in tiles of the tile-box
	call  cpct_etm_drawTileBox2x4_asm ;; Call the function

	ld de, (puntero_video)
	dec de
	dec de

	ld a, #0
	ld c, #2
	ld b, #8
	call cpct_drawSolidBox_asm

	no_scroll_right:
ret