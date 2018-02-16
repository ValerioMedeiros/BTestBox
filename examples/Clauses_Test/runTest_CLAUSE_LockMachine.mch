MACHINE
    runTest_CLAUSE_LockMachine

OPERATIONS
    verdict <-- testAll =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END