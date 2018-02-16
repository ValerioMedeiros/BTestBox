MACHINE
    MchWithVariables

CONCRETE_CONSTANTS
    max_count

ABSTRACT_VARIABLES
    count

PROPERTIES
max_count = 10

INVARIANT
    (count : NAT & count <= max_count)

INITIALISATION
    count := 0

OPERATIONS
    GetcountImpForTest <-- OperationForTestGetcountImpMchWithVariables = 
        ANY aux WHERE aux : INT THEN GetcountImpForTest := aux END;

    SetVariablesForTestMchWithVariables(nn1) = 
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
