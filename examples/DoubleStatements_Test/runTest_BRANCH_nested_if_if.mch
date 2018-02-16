MACHINE
    runTest_BRANCH_nested_if_if

OPERATIONS
    verdict <-- testAll =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END