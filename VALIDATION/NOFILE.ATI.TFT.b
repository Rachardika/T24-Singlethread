*-----------------------------------------------------------------------------
    SUBROUTINE NOFILE.ATI.TFT(Y.OUT)
*-----------------------------------------------------------------------------
* Developer Name     : 
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
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.ATI.TH.FT.CASH.WITHDRAWL

*-----------------------------------------------------------------------------
MAIN:
*-----------------------------------------------------------------------------

    GOSUB INIT
    GOSUB PROCESS

    RETURN

*-----------------------------------------------------------------------------
INIT:
*-----------------------------------------------------------------------------

    FN.ATI = "F.ATI.TH.FT.CASH.WITHDRAWL"
    F.ATI = ""
    CALL OPF(FN.ATI, F.ATI)

    SEL.CMD = "SELECT " : FN.ATI
    Y.FIELD = ENQ.SELECTION<2>
    FIND "@ID" IN Y.FIELD SETTING POS1, POS2 THEN
        Y.OP.ENQ = ENQ.SELECTION<3, POS2>
        Y.ID.ENQ = ENQ.SELECTION<4, POS2>
    END
    IF Y.ID.ENQ NE "" THEN
        SEL.CMD := " WITH @ID " : Y.OP.ENQ : " " : Y.ID.ENQ
    END
    SEL.LIST = ""
    CALL EB.READLIST(SEL.CMD, SEL.LIST, "", NO.OF.REC, REC.ERR)

    RETURN

*-----------------------------------------------------------------------------
PROCESS:
*-----------------------------------------------------------------------------

    FOR I = 1 TO NO.OF.REC
        Y.ID = SEL.LIST<I>
        CALL F.READ(FN.ATI, Y.ID, R.ATI, F.ATI, ERR.ATI)
        
        Y.ACCOUNT.DEBIT = R.ATI<LIL.ACCOUNT.DEBIT>
        Y.CUSTOMER.DEBIT = R.ATI<LIL.CUSTOMER.DEBIT>
        Y.SHORT.NAME = R.ATI<LIL.SHORT.NAME>
        Y.CURRENCY.DEBIT = R.ATI<LIL.CURRENCY.DEBIT>
        Y.AMOUNT.DEBIT = R.ATI<LIL.AMOUNT.DEBIT>
        Y.ACCOUNT.CREDIT = R.ATI<LIL.ACCOUNT.CREDIT>
        Y.CURRENCY.CREDIT = R.ATI<LIL.CURRENCY.CREDIT>
        Y.PROCESSING.DATE = R.ATI<LIL.PROCESSING.DATE>
        Y.ATI.BEN.NAME = R.ATI<LIL.ATI.BEN.NAME>
        Y.ATI.PAYMENT.DETAILS = R.ATI<LIL.ATI.PAYMENT.DETAILS>
        Y.INPUTTER = R.ATI<LIL.INPUTTER>
        Y.AUTHORISER = R.ATI<LIL.AUTHORISER>
        Y.CO.CODE = R.ATI<LIL.CO.CODE>

        Y.OUT<-1> = Y.ID : "*" : Y.ACCOUNT.DEBIT : "*" : Y.CUSTOMER.DEBIT : "*" : Y.SHORT.NAME : "*" : Y.CURRENCY.DEBIT : "*" : Y.AMOUNT.DEBIT : "*" : Y.ACCOUNT.CREDIT : "*" : Y.CURRENCY.CREDIT : "*" : Y.PROCESSING.DATE : "*" : Y.ATI.BEN.NAME : "*" : Y.ATI.PAYMENT.DETAILS : "*" : Y.INPUTTER : "*" : Y.AUTHORISER : "*" : Y.CO.CODE
    NEXT I
    RETURN

*-----------------------------------------------------------------------------
END