MACHINE
    copycountMch

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
    GetcountForTest <-- OperationForTestGetcountcountMch = 
        ANY aux WHERE aux : INTEGER THEN GetcountForTest := aux END;

    SetVariablesForTestcountMch(nn1) = 
    PRE nn1 : NAT
    THEN
        skip
    END;

    res <-- Inc(nn)=
    PRE nn : NAT & nn >= 1
    THEN
        IF count + nn <= max_count THEN
            res := TRUE || count := count + nn
        ELSE
            res := FALSE
        END
    END;
    
    res <-- Dec(nn)=
    PRE nn : NAT & nn >= 1
    THEN
        IF count - nn >= 0 THEN
            res := TRUE || count := count - nn
        ELSE
            res := FALSE
        END
    END
END