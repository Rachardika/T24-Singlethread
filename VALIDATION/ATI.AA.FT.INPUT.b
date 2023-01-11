*-----------------------------------------------------------------------------
    SUBROUTINE ATI.AA.FT.INPUT
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
    $INSERT I_F.ACCOUNT
    $INSERT I_F.CUSTOMER
    $INSERT I_F.FUNDS.TRANSFER
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

    FN.ACCOUNT = "F.ACCOUNT"
    F.ACCOUNT = ""
    CALL OPF(FN.ACCOUNT, F.ACCOUNT)

    FN.CUSTOMER = "F.CUSTOMER"
    F.CUSTOMER = ""
    CALL OPF(FN.CUSTOMER, F.CUSTOMER)

    FN.ATI = "F.ATI.TH.FT.CASH.WITHDRAWL"
    F.ATI = ""
    CALL OPF(FN.ATI, F.ATI)
    RETURN

*-----------------------------------------------------------------------------
PROCESS:
*-----------------------------------------------------------------------------

    Y.DEBIT.ACCT = R.NEW(FT.DEBIT.ACCT.NO)
    R.DATA<LIL.ACCOUNT.DEBIT> = Y.DEBIT.ACCT

    CALL F.READ(FN.ACCOUNT, Y.DEBIT.ACCT, R.ACCOUNT, F.ACCOUNT, ERR.ACCOUNT)
    Y.DEBIT.CUST = R.ACCOUNT<AC.CUSTOMER>

    R.DATA<LIL.CUSTOMER.DEBIT> = Y.DEBIT.CUST

    CALL F.READ(FN.CUSTOMER, Y.DEBIT.CUST, R.CUSTOMER, F.CUSTOMER, ERR.CUSTOMER)
    R.DATA<LIL.SHORT.NAME> = R.CUSTOMER<EB.CUS.SHORT.NAME>

    R.DATA<LIL.CURRENCY.DEBIT> = R.NEW(FT.DEBIT.CURRENCY)
    R.DATA<LIL.AMOUNT.DEBIT> = R.NEW(FT.DEBIT.AMOUNT)
    R.DATA<LIL.ACCOUNT.CREDIT> = R.NEW(FT.CREDIT.ACCT.NO)
    R.DATA<LIL.CURRENCY.CREDIT> = R.NEW(FT.CREDIT.CURRENCY)
    R.DATA<LIL.PROCESSING.DATE> = R.NEW(FT.PROCESSING.DATE)

    Y.BEN.NAME = R.NEW(FT.LIL.BEN.NAME)
    CONVERT "\" TO " " IN Y.BEN.NAME
    R.DATA<LIL.BEN.NAME> = Y.BEN.NAME

    Y.PAYMENT.DETAILS = R.NEW(FT.LIL.PAY.DET)
    CONVERT "\" TO " " IN Y.PAYMENT.DETAILS
    R.DATA<LIL.ATI.PAYMENT.DETAILS> = Y.PAYMENT.DETAILS

    CALL F.WRITE(FN.ATI, ID.NEW, R.DATA)

    RETURN

*-----------------------------------------------------------------------------
END