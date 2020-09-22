include "constants.asm"

SECTION "scripts/Route1Gate1F.asm", ROMX

Route1Gate1F_ScriptLoader::
	ld hl, Route1Gate1FScriptPointers
	call RunMapScript
	call WriteBackMapScriptNumber
	ret

Route1Gate1FScriptPointers:
	dw Route1Gate1FScript ;>> routine
	dw Route1Gate1FNPCIDs ;>> data

Route1Gate1FNPCIDs:
	db $00
	db $01
	db $FF

Route1Gate1FSignPointers:
	dw MapDefaultText ;no signs
Route1Gate1F_TextPointers::
	dw Route1Gate1FText1
	dw Route1Gate1FText2

Route1Gate1FScript:
	ld hl, Route1Gate1FNPCIDs
	ld de, Route1Gate1FSignPointers
	call CallMapTextSubroutine
	ret

Route1Gate1FText1:
	ld hl, Route1Gate1FText1String
	call OpenTextbox
	ret

Route1Gate1FText2:
	ld hl, Route1Gate1FText2String
	call OpenTextbox
	ret

Route1Gate1FText1String:
	text "このゲートを　ぬけると"
	line "すぐに　オールドシティ　です"
	done

Route1Gate1FText2String:
	text "オールドシティには"
	line "あの　ゆうめいな"
	cont "ごじゅうのとう　が　あるの"

	para "いってみたこと　ある？"
	done

;ends at 40D9
