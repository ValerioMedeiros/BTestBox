MACHINE
    MchToExtend

CONCRETE_VARIABLES
    count

INVARIANT
    count : NAT

INITIALISATION
    count := 0

OPERATIONS
    GetcountForTest <-- OperationForTestGetcountMchToExtend = 
        ANY aux WHERE aux : INT THEN GetcountForTest := aux END;

    SetVariablesForTestMchToExtend(nn1) = 
    PRE nn1 : INT
    THEN
        skip
    END;

    Inc(nn)=
    PRE nn : NAT & count + nn < 50
    THEN
        count := count + nn
    END;
    
    Dec(nn)=
    PRE nn : NAT & count - nn >= 0
    THEN
        count := count - nn
    END;
    
    RandomInc = ANY nn WHERE nn : 0..(50 - count) THEN count := count + nn END
    
END
