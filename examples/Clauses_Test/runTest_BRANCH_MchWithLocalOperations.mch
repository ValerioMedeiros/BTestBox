MACHINE
    runTest_BRANCH_MchWithLocalOperations

OPERATIONS
    verdict <-- testAll =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END