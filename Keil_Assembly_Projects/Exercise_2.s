;Provide a title for the program mentioning its purpose
value1		EQU 50		;Define value1 as 50
value2 		EQU 123		;Define value2 as 123
value3 		EQU 0xFFFFFFF0		;Define value2 as 0xFFFFFFF0
			AREA code_area, CODE, READONLY
			EXPORT __main
			ALIGN
			ENTRY
__main 		PROC
			MOVS R0,#0		;Move the value 0 into R0
			LDR R1,=value1	;Load the register R1 with value1
			LDR R2,=value2	;Load the register R2 with value2
			LDR R3,=value3	;Load the register R3 with value3
			MSR APSR,R0		;Loading the special register APSR-Application PSR with the value stored in R0
			ADDS R2,R1		;Add with set R2+R1 and store in R2
			SUBS R2,R1		;Subtract with set R2-R1 and store in R2
			ADDS R3,R1		;Add with set R3+R1 and store in R3
			SUBS R3,R1		;Subtract with set R3-R1 and store in R3
			MSR APSR,R0		;Loading the special register APSR-Application PSR with the value stored in R0
			ADD R3,R1		;Add with set R3+R1 and store in R3
			CMP R1,R2		;Compare R1 with R2 and set flags
			CMP R2,R1		;Compare R2 with R1 and set flags
			CMP R1,R1		;Compare R1 with R1 and set flags
			CMP R1,#0x40	;Compare R1 with 0x40 and set flags
			CMP R2,#0x40	;Compare R2 with 0x40 and set flags
			CMN R1,R3		;Compare R1 with negative of R3 and set flags
			CMN R1,R3		;Compare R1 with negative of R3 and set flags
here 		B here			;infinite end loop
			ENDP
			AREA data_area, DATA, READWRITE
			END