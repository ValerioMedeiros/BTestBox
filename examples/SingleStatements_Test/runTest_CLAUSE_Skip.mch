MACHINE
    runTest_CLAUSE_Skip

OPERATIONS
    verdict <-- testAll =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END