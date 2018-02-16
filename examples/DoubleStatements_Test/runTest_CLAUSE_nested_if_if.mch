MACHINE
    runTest_CLAUSE_nested_if_if

OPERATIONS
    verdict <-- testAll =
        ANY kk WHERE kk : BOOL THEN verdict := kk END
END