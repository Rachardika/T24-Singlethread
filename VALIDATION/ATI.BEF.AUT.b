*-----------------------------------------------------------------------------	
	SUBROUTINE ATI.BEF.AUT
*-----------------------------------------------------------------------------
* Developer Name     : Steven L
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
    $INSERT I_F.ACCOUNT
    $INSERT I_F.FUNDS.TRANSFER
    $INSERT I_F.ATI.TH.FT.CASH.WITHDRAWAL


*-----------------------------------------------------------------------------
MAIN:
*-----------------------------------------------------------------------------
    
	GOSUB INIT
    GOSUB PROCESS

	RETURN

*-----------------------------------------------------------------------------
INIT:
*-----------------------------------------------------------------------------

    FN.ACCOUNT = 'F.ACCOUNT'
    F.ACCOUNT = ''
    CALL OPF(FN.ACCOUNT, F.ACCOUNT)

    FN.FUNDS.TRANSFER = 'F.FUNDS.TRANSFER'
    F.FUNDS.TRANSFER = ''
    CALL OPF(FN.FUNDS.TRANSFER, F.FUNDS.TRANSFER)

    FN.TH.FT = 'F.ATI.TH.FT.CASH.WITHDRAWAL'
    F.TH.FT = ''
    CALL OPF(FN.TH.FT, F.TH.FT)

	RETURN

*-----------------------------------------------------------------------------
PROCESS:
*-----------------------------------------------------------------------------
    
    IF V$FUNCTION NE "I" THEN
        RETURN
    END

    ELSE
        *CALL F.READ(FN.FUNDS.TRANSFER,Y.ID,R.FUNDS.TRANSFER,F.FUNDS.TRANSFER,FUNDS.TRANSFER.ERR)
            *CALL F.READ(FN.ACCOUNT,Y.ID,R.ACCOUNT,F.ACCOUNT,ACCOUNT.ERR)

            Y.DEBIT.ACCOUNT = R.NEW(FT.DEBIT.ACCT.NO)
            Y.CREDIT.ACCOUNT = R.NEW(FT.CREDIT.ACCT.NO)
            Y.AMOUNT = R.NEW(FT.DEBIT.AMOUNT)
            

            IF Y.AMOUNT GT 10000 THEN
                Y.KET = "Melebihi limit"
            END ELSE IF Y.AMOUNT LT 10000 THEN
                Y.KET = "Tidak melebihi limit"
            END

            

            R.BARU = ''

            CALL F.READ(FN.ACCOUNT,Y.DEBIT.ACCOUNT,R.ACCOUNT,F.ACCOUNT,ACCOUNT.ERR)
            R.BARU<TRA.4.NAMA.PENGIRIM> = R.ACCOUNT<AC.SHORT.TITLE>

            CALL F.READ(FN.ACCOUNT,Y.CREDIT.ACCOUNT,R.ACCOUNT,F.ACCOUNT,ACCOUNT.ERR)
            R.BARU<TRA.4.NAMA.PENERIMA> = R.ACCOUNT<AC.SHORT.TITLE>
            R.BARU<TRA.4.JUMLAH> = Y.AMOUNT
            R.BARU<TRA.4.KETERANGAN> = Y.KET

            Y.INPUT = R.NEW(FT.DEBIT.ACCT.NO):"INPUT"

            CALL F.WRITE(FN.RABU.TABEL,Y.INPUT,R.BARU)

            

            
    END

RETURN

*-----------------------------------------------------------------------------
END