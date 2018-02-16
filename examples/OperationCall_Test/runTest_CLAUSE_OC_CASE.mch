MACHINE
    runTest_CLAUSE_OC_CASE

OPERATIONS
    verdict <-- testAll =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END