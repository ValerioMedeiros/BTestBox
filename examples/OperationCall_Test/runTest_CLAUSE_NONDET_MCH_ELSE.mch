MACHINE
    runTest_CLAUSE_NONDET_MCH_ELSE

OPERATIONS
    verdict <-- testAll =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END