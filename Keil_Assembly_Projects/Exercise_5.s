;Provide a title for the program mentioning its purpose
				AREA code_area, CODE, READONLY
				EXPORT __main
				ALIGN
				ENTRY
__main 			PROC
loop 			LDR R0,=value1		;Loading R0 with the address of value1
				BL change_value		;Branch to change_value with link to the current memory address, works like a function call
				LDR R0,=value2		;Loading R0 with the address of value2
				BL change_value		;Branch to change_value with link to the current memory address, works like a function call
				B loop

change_value 	PUSH {R1,R2} 		;Pushing the  values of R1 and R2 in the stack memory
				LDR R1,[R0]			;Loading the address of of R0 into R1
				ADDS R1,#1			;Adding the value of R1 with 1 along with setting the flags
				EORS R1,R0			;Bitwise Exclusive OR operation of R0 and R1, stored in R1 and setting flags
				MOVS R2,#0xFF		;Moving the value 0xFF in R2
				ANDS R1,R2			;Bitwise AND operation between R1 and R2, with setting flags
				STR R1,[R0]			;Store the value in R1 in the address given by R0
				POP {R1,R2}			;Popping values from the stack into R1 and R2
				BX LR				;Return to the address stored in the link register
here 			B here				;Infinite ending loop
				ENDP
				AREA data_area, DATA, READWRITE
value1 SPACE 4						;Storing value1 = 4 in the data memory
value2 SPACE 4						;Storing value2 = 4 in the data memory
				END