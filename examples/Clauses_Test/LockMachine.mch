MACHINE
    LockMachine

ABSTRACT_VARIABLES
    isOpen

INVARIANT
    isOpen : BOOL

INITIALISATION
    isOpen := FALSE

OPERATIONS
    GetisOpenIMPForTest <-- OperationForTestGetisOpenIMPLockMachine = 
        ANY aux WHERE aux : BOOL THEN GetisOpenIMPForTest := aux END;

    SetVariablesForTestLockMachine(nn1) = 
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