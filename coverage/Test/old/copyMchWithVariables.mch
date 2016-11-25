/* MchWithVariables
 * Author: Diego Oliveira
 * Creation date: 16/11/2016
 */
MACHINE
    copyMchWithVariables

CONSTANTS
    max_count
    
PROPERTIES
    max_count = 10

VARIABLES
    count
    
INVARIANT
    count : NAT & count <= max_count
    
INITIALISATION
    count := 0

OPERATIONS
    GetcountImpForTest <-- OperationForTestGetcountImp = 
        ANY aux WHERE aux : INTEGER THEN GetcountImpForTest := aux END;

    SetVariablesForTest(nn1) = 
    PRE nn1 : NAT
    THEN
        skip
    END;

    res <-- opIncCount(nn) =
    PRE nn : NAT & nn > 0
    THEN
        IF count + nn < max_count THEN
            res := 1 ||
            count := count + nn
        ELSE
            res := 0
        END
    END;
    
    res <-- opRelease(nn) =
    PRE nn : NAT
    THEN
        IF count - nn < 0 THEN
            res := 0
        ELSE
            res := 1 || count := count - nn
        END
    END;
    
    resetCount = count := 0;
    
    res <-- getCount = res := count
END
