MACHINE
    runTest_BRANCH_case

OPERATIONS
    verdict <-- testAll =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END