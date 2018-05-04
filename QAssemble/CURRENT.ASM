DSEG    SEGMENT
RSLT    DW      '00', '10', '40', '90', '61', '52', '63', '94', '46', '18'
DSEG    ENDS
CSEG    SEGMENT
        ASSUME  DS:DSEG, CS:CSEG
START:  MOV     AX, DSEG
        MOV     DS, AX
	MOV     AH, 07H
        INT     21H
        SUB     AL, 30H
        MOV     BL, 02H
        MUL     BL
        MOV     SI, AX
        LEA     BX, RSLT
        MOV     DL, BYTE PTR [BX + SI]
        MOV     AH, 02H
        INT     21H
        MOV     DL, BYTE PTR [BX + SI + 1]
        MOV     AH, 02H
        INT     21H
        MOV     AH, 4CH
        INT     21H
CSEG    ENDS
        END     START
