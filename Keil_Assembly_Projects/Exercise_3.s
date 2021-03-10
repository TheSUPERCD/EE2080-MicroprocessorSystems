;Provide a title for the program mentioning its purpose
			AREA code_area, CODE, READONLY
			EXPORT __main
			ALIGN
			ENTRY
__main 		PROC
pos1 		B pos3		;Redirecting to the memory address of pos3
pos2 		B pos4		;Redirecting to the memory address of pos4
pos3 		B pos2		;Redirecting to the memory address of pos2
pos4 		B pos1		;Redirecting to the memory address of pos1 and this loop of redirecting will continue forever
here 		B here		;infinite end loop
			ENDP
			END