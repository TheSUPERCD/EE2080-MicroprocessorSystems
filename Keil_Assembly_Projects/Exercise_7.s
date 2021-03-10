;	EXPERIMENT_7	Title for the code
n_val EQU 6	; Define n value
		AREA code_area, CODE, READONLY	;Telling uVision that this part is code region
		EXPORT __main	;exporting to main
		ALIGN	;To align everything automatically
		ENTRY
__main	PROC	;Starting of the main function
		MOVS R0, #1
		MOVS R1, #n_val
		MOVS R2, #0
_test	CMP R0, #10
		BEQ _end
		ADDS R0, R0, #1
		LSRS R1, R1, #1
		BCS _parity
		B _test
_parity	ADDS R2, R2, #1
		B _test
_end	B _end
		ENDP
		END