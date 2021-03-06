MACHINE
    MchWithSEES

SEES
    LockMachine

CONCRETE_CONSTANTS
    MAX

ABSTRACT_VARIABLES
    inside, outside, total

PROPERTIES
MAX = 5

INVARIANT
    (inside : NAT & inside >= 0 & outside : NAT & outside >= 0 & total : NAT & total = (inside+outside) & total <= MAX)

INITIALISATION
    total := 0||
inside := 0||
outside := 0

OPERATIONS
    GetinsideIMPForTest <-- OperationForTestGetinsideIMPMchWithSEES = 
        ANY aux WHERE aux : INT THEN GetinsideIMPForTest := aux END;

    GetoutsideIMPForTest <-- OperationForTestGetoutsideIMPMchWithSEES = 
        ANY aux WHERE aux : INT THEN GetoutsideIMPForTest := aux END;

    GettotalIMPForTest <-- OperationForTestGettotalIMPMchWithSEES = 
        ANY aux WHERE aux : INT THEN GettotalIMPForTest := aux END;

    SetVariablesForTestMchWithSEES(nn1, nn2, nn3) = 
    PRE nn1 : NAT & nn2 : NAT & nn3 : NAT
    THEN
        skip
    END;

    guestArrived(nn) =
    PRE nn : NAT & nn <= MAX - total
    THEN
        total := total + nn || outside := outside + nn
    END;
    
    guestLeaved(nn) =
    PRE nn : NAT & nn <= outside
    THEN
        total := total - nn || outside := outside - nn
    END;
    
    enterHouse(nn) =
    PRE isOpen = TRUE & nn : NAT & nn <= outside 
    THEN
        inside := inside + nn || outside := outside - nn
    END;
    
    leaveHouse(nn) =
    PRE isOpen = TRUE & nn : NAT & nn <= inside
    THEN
        inside := inside - nn || outside := outside + nn
    END
END
