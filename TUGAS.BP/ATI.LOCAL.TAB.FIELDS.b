*-----------------------------------------------------------------------------	
	SUBROUTINE ATI.LOCAL.TAB.FIELDS
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
    $INSERT I_DataTypes


*-----------------------------------------------------------------------------
MAIN:
*-----------------------------------------------------------------------------
    
	GOSUB INIT
    GOSUB PROCESS

	RETURN

*-----------------------------------------------------------------------------
INIT:
*-----------------------------------------------------------------------------
    ID.CHECKFILE = "" ; ID.CONCATFILE = ""
    ID.F = "" ; ID.N ='10' ; ID.T = "A"
	RETURN

*-----------------------------------------------------------------------------
PROCESS:
*-----------------------------------------------------------------------------

    CALL Table.addFieldDefinition('ACCOUNT.DEBIT', "10", 'A',"")
    CALL Table.addFieldDefinition('CUSTOMER.DEBIT', "10", 'A',"")
    CALL Table.addFieldDefinition('SHORT.NAME', "8", 'A',"")
    CALL Table.addFieldDefinition('CURRENCY.DEBIT', "3", 'A',"")
    CALL Table.addFieldDefinition('AMOUNT.DEBIT', "10", '',"")
    CALL Table.addFieldDefinition('ACCOUNT.CREDIT', "10", 'A',"")
    CALL Table.addFieldDefinition('CURRENCY.CREDIT', "3", 'A',"")
    CALL Table.addFieldDefinition('PROCESSING.DATE', "8", 'D',"")
    CALL Table.addFieldDefinition('ATI.BEN.NAME', "20", 'A',"")
    CALL Table.addFieldDefinition('ATI.PAYMENT.DETAILS', "20", 'A',"")

    CALL Table.addField("RESERVED.5", T24_String, Field_NoInput, "")
    CALL Table.addField("RESERVED.4", T24_String, Field_NoInput, "")
    CALL Table.addField("RESERVED.3", T24_String, Field_NoInput, "")
    CALL Table.addField("RESERVED.2", T24_String, Field_NoInput, "")
    CALL Table.addField("RESERVED.1", T24_String, Field_NoInput, "")
    CALL Table.addField("XX.LOCAL.REF", T24_String, "", "")
    CALL Table.addField("XX.OVERRIDE", T24_String, Field_NoInput, "")

    CALL Table.setAuditPosition
	RETURN

*-----------------------------------------------------------------------------
END