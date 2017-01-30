MACHINE
    runTest_BRANCH_else

OPERATIONS
    verdict <-- testAll =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END