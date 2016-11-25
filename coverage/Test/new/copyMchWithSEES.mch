/* MchWithSEES
 * Author: Diego Oliveira
 * Creation date: 23/11/2016
 */
MACHINE
    copyMchWithSEES

CONSTANTS
    MAX
    
PROPERTIES
    MAX = 5

SEES
    copyLockMachine
    
VARIABLES
    inside, outside, total
    
INVARIANT
    inside : NAT & inside >= 0 & outside : NAT & outside >= 0 & total : NAT & total = inside + outside & total <= MAX
    
INITIALISATION
    total := 0 || inside := 0 || outside := 0
    
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
