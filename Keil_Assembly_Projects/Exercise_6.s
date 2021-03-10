;	EXPERIMENT_6	Title for the code
n_val EQU 4	;Define equate_val equal to 0xAAAAAAAA
		AREA code_area, CODE, READONLY	;Telling uVision that this part is code region
		EXPORT __main	;exporting to main
		ALIGN	;To align everything automatically
		ENTRY
__main	PROC	;Starting of the main function
		MOVS R0, #1	; result
		MOVS R1, #1	; i
loop	CMP R1, #n_val	; check if i == n_val
		BEQ _end		; banch to _end if i value is equal to n_val
		ADDS  R1, R1, #1	; incrementing i value by 1
		MULS R0, R1, R0		; multiply result with incremented value of i
		B loop				; go back to loop and check the branching condition
_end	B _end				; infinite end loop
		ENDP
		END