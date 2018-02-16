MACHINE
    runTest_BRANCH_OC_WHILEAFTER

OPERATIONS
    verdict <-- testAll =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END