;Provide a title for the program mentioning its purpose
			AREA code_area, CODE, READONLY
			EXPORT __main
			ALIGN
			ENTRY
__main 		PROC
rst_cnt 	MOVS R0,#3		;move the value 3 into register R0
dec_cnt 	SUBS R0,#1		;subtract with set flags R0 = R0 - 1
			BNE dec_cnt		;if the zero flag is not set, go back to dec_cnt and do that operation again
			B rst_cnt		;if the zero flag is set, go to rst_cnt and keep looping forever
here 		B here			;infinite ending loop
			ENDP
			END