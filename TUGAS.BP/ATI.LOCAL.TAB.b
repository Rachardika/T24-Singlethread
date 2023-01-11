*-----------------------------------------------------------------------------	
	SUBROUTINE ATI.LOCAL.TAB
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
    $INSERT I_Table


*-----------------------------------------------------------------------------
MAIN:
*-----------------------------------------------------------------------------
    
	GOSUB INIT
    GOSUB PROCESS

	RETURN

*-----------------------------------------------------------------------------
INIT:
*-----------------------------------------------------------------------------
    Table.name = 'ATI.LOCAL.TAB'
    Table.title = 'LOCAL TABLE'
    Table.stereotype = 'H'
    Table.product = 'ST'
    Table.subProduct = ''
    Table.classification = 'INT'
    Table.systemClearFile = 'N'
    Table.relatedFiles = ''
    Table.isPostClosingFile = ''
    Table.equatePrefix = 'LIL'

    Table.idPrefix = ''
    Table.blockedFunctions = ''
    Table.trigger = ''
	RETURN

*-----------------------------------------------------------------------------
PROCESS:
*-----------------------------------------------------------------------------

    
	RETURN

*-----------------------------------------------------------------------------
END