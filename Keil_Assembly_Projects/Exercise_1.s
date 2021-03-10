;	EXPERIMENT_1	;Title for the code
equate_val EQU 0xAAAAAAAA	;Define equate_val equal to 0xAAAAAAAA
		AREA code_area, CODE, READONLY	;Telling uVision that this part is code region
		EXPORT __main	;exporting to main
		ALIGN	;To align everything automatically
		ENTRY
__main	PROC	;Starting of the main function
		LDR R1,const_val	;Load register r1 with the constant value 0X55555555
		LDR R0,=const_val	;Load register r0 with the address of the constant value
		LDR R1,[R0]			;Load the contents found in r0 into r1
		LDRH R1,[R0]		;Load the contents found in r0 into r1 but only the last half word (16 bits) 
		LDRB R1,[R0]		;Load the contents found in r0 into r1 but only the last byte (8 bits) 
		LDR R0,=equate_val	;Load  into r0, the value of the constant defined in the begining (0xAAAAAAAA)
		LDR R1,=const_val	;Load  into r1, the address of the constant_val variable stored in the memory
		STR R0,[R1]			;Trying to store the contents of r0 into the memory location found inside r1
							;But failing to do so due to the read only nature of the code region and the variable was declared inside the code region
		MOV R2,R0			;Move the contents of r0 into r2
		MOVS R2,#0			;Move and set the flags for moving 0 into the register r2
		B __main			;Branch and go to the __main part again.... This creates an infinite loop
		ENDP


const_val DCD 0X55555555
		
		AREA data_area, DATA, READWRITE
		END