*-----------------------------------------------------------------------------	
	SUBROUTINE ATI.DEF
*-----------------------------------------------------------------------------
* Developer Name     : NOVALDY
* Development Date   : 
* Description        : 
*-----------------------------------------------------------------------------
* Developer Name     : 
* Development Date   : 
* Description        : 
*-----------------------------------------------------------------------------
* Modification History:-
*-----------------------------------------------------------------------------
* Date            Modified by                Description
*-----------------------------------------------------------------------------
    
	$INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.FUNDS.TRANSFER


*-----------------------------------------------------------------------------
MAIN:
*-----------------------------------------------------------------------------
    
	GOSUB INIT
    GOSUB PROCESS

	RETURN

*-----------------------------------------------------------------------------
INIT:
*-----------------------------------------------------------------------------

    FN.FT = 'F.FUNDS.TRANSFER'
    F.FT = ''
    CALL OPF(FN.FT, F.FT)

	RETURN

*-----------------------------------------------------------------------------
PROCESS:
*-----------------------------------------------------------------------------
        R.NEW(FT.TRANSACTION.TYPE) = "AC"

RETURN

*-----------------------------------------------------------------------------
END