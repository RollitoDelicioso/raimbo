.area _DATA
.area _CODE

.include "hero.h.s"
.include "obstacle.h.s"
.include "enemy.h.s"
.include "bullets.h.s"
.include "map.h.s"

;;===========================================
;;===========================================
;;PUBLIC FUNTIONS
;;===========================================
;;===========================================

;; ======================
;;	Draw all
;; ======================
engine_drawAll::
    call bullets_draw
    call hero_draw
	;call obstacle_draw
    ;call enemy_draw
    ;call map_drawEnemies

    ret

;; ======================
;;	Update all
;; ======================
engine_updateAll::
    call bullets_update
    call hero_update
    ;call obstacle_update
    ;;call enemy_update
    ;call map_updateEnemies

    ret

;; ======================
;;	Erase all
;; ======================
engine_eraseAll::
    call bullets_erase
    call hero_erase
    ;call obstacle_erase
    ;;call enemy_erase
    ;call map_eraseEnemies

    ret  