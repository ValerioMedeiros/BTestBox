MACHINE
    copyMchIncludingMchWithSEES

INCLUDES
copyMchWithSEES

PROMOTES
    OperationForTestGetinsideIMPMchWithSEES, OperationForTestGetoutsideIMPMchWithSEES, OperationForTestGettotalIMPMchWithSEES, SetVariablesForTestMchWithSEES

SEES
copyLockMachine

ABSTRACT_VARIABLES
lights

INVARIANT
(lights : BOOL & (inside = 0 => lights = FALSE) & (inside > 0 => lights = TRUE))

INITIALISATION
lights := FALSE

OPERATIONS
    GetlightsForTest <-- OperationForTestGetlightsMchIncludingMchWithSEES = 
        ANY aux WHERE aux : BOOL THEN GetlightsForTest := aux END;

    GetinsideIMPForTest <-- OperationForTestGetinsideIMPMchIncludingMchWithSEES = 
        ANY aux WHERE aux : INTEGER THEN GetinsideIMPForTest := aux END;

    SetVariablesForTestMchIncludingMchWithSEES(nn1, nn2) = 
    PRE nn1 : BOOL & nn2 : INT
    THEN
        skip
    END;

    leavingTheHouse(nn)=
    PRE isOpen = TRUE & nn : NAT & nn <= inside
    THEN
        leaveHouse(nn) || IF inside - nn = 0 THEN lights := FALSE END
    END;
    
    enteringTheHouse(nn)=
    PRE isOpen = TRUE & nn : NAT & nn <= outside 
    THEN
        enterHouse(nn) || IF inside + nn > 0 THEN lights := TRUE END
    END
    
END
