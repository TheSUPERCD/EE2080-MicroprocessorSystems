;	EXPERIMENT_8	Title for the code
		AREA code_area, CODE, READONLY	;Telling uVision that this part is code region
		EXPORT __main	;exporting to main
		ALIGN	;To align everything automatically
		ENTRY
__main	PROC	;Starting of the main function
		LDR R3, _size
		SUBS R3, R3, #1	;r3 having array size
		MOVS R2, #0		;counter
		ADR R4, _array
		LDR R0, [R4]
		ADDS R4, R4, #4
		ADDS R2, R2, #1
_loop	CMP R2, R3
		BEQ _end
		LDR R5, [R4]
		ADDS R4, R4, #4
		ADDS R2, R2, #1
		CMP R5, R0
		BGT _max
		B _loop
_max	MOVS R0, R5
		MOVS R1, R2
		B _loop
_end	B _end
		ENDP

_array	DCD 1, 21, 3, -1
_size	DCD 4
		
		END