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
    GetinsideIMPForTest <-- OperationForTestGetinsideIMP = 
        ANY aux WHERE aux : INTEGER THEN GetinsideIMPForTest := aux END;

    GetoutsideIMPForTest <-- OperationForTestGetoutsideIMP = 
        ANY aux WHERE aux : INTEGER THEN GetoutsideIMPForTest := aux END;

    GettotalIMPForTest <-- OperationForTestGettotalIMP = 
        ANY aux WHERE aux : INTEGER THEN GettotalIMPForTest := aux END;

    SetVariablesForTest(nn1, nn2, nn3) = 
    PRE nn1 : NAT & nn2 : NAT & nn3 : NAT
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