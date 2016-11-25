/* LockMachine
 * Author: Diego Oliveira
 * Creation date: 23/11/2016
 */
MACHINE
    copyLockMachine

VARIABLES
    isOpen
    
INVARIANT
    isOpen : BOOL
    
INITIALISATION
    isOpen:= FALSE

OPERATIONS
    GetisOpenIMPForTest <-- OperationForTestGetisOpenIMP = 
        ANY aux WHERE aux : BOOL THEN GetisOpenIMPForTest := aux END;
        
    SetVariablesForTestSEES(nn1) = 
    PRE nn1 : BOOL
    THEN
        skip
    END;
    
    openVault =
    PRE isOpen= FALSE
    THEN
        isOpen:= TRUE
    END;
    
    closeVault = 
    PRE isOpen= TRUE
    THEN
        isOpen:= FALSE
    END

END